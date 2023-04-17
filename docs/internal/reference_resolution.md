Reference resolution
====================

This document describes the details of resolving different kinds of references that are found in the LIME model.

Why references?
---------------
LIME model represents all definitions from the IDL files as elements in the model tree. These tree elements are
immutable and thus have to contain all related data at the moment of creation. However, the order of creation of these
elements is not guaranteed. So when a function parameter (or return value, or a struct field, etc.) refers to a type,
the element representing that type might not be created yet. Or, worse still, there might be a cyclic reference of some
kind, i.e. A refers to B, while B refers to A. Therefore, resolving a (textual) reference to an element has to be
postponed until after the whole model tree is created.

In the model tree itself this is represented by element references. Mostly these are descendants of the `LimeTypeRef`
abstract class. There are also other descendants of the `LimeElementRef` class.

Direct references
-----------------
Some type references do not require any delayed-resolution handling. These are references to basic (built-in) type, like
`String`, `Int`, or `Date`. References to generic types (`List`, `Set`, and `Map`) themselves could be resolved 
directly too. However, the generic types also contain at least one nested type reference, representing the type
parameter(s) of the generic. These nested references are normal type references, and thus could also be either direct
or late-bound.

Reference map
-------------
Resolution of all late-bound references is done through a straightforward mechanism called "reference map". The map
itself is a simple Kotlin `Map<String, LimeElement>`. Each key is a "full path": a dot-concatenated list of nested
declarations, uniquely identifying the element that is the mapped value. For situations where some ambiguity can be
expected (e.g. functions overloading), an additional "disambiguation suffix" is appended to the path. For example, given
the following declaration
```kotlin
package core

class MyClass {
    interface NestedInterface {}
    fun doSomething(value: Int)
    fun doSomething(value: String): Boolean
}
```
the full path of "core.MyClass.NestedInterface" uniquely identifies the interface element in the declaration. And the
full path "core.MyClass.doSomething.value:1" uniquely identifies the parameter of the second overload of the function.
Notably, even if the possible ambiguity is at the "core.MyClass.doSomething" level, the ":1" suffix is still added at
the very end. This allows for a uniform string representation of paths.

The reference map is mutable (appendable) for the whole duration of model tree creation. It becomes immutable when the
tree is fully created.

Late-bound references
---------------------
There are several kinds of late-bound references. All of them utilize the Kotlin `by lazy` mechanism to delay the
resolution until the first "read" access.
* _Ambiguous type reference_: a type reference where some ambiguity is expected due to the effect of `import`
statements. This is by far the most common kind of late-bound reference in a usual model tree. The logic for ambiguity
resolution is isolated in a standalone helper `LimeAmbiguityResolver`. For the details of the algorithm, please refer to
the documentation of `LimeAmbiguityResolver` itself.
* _Lazy type reference_: a simple late-bound reference where no ambiguity is expected. Only used for self-references,
i.e. to refer to the type in the process of creation of the element, corresponding to it. Only occurs in the return
types of constructor declarations.
* _Positional type reference_: a late-bound reference where the name of the type is not known, but the type needs to be
computed by the position of the reference in the list of its siblings. Occurs in struct initializer literals, or in 
collection initializer literals.
* _Ambiguous constant reference_: same as "ambiguous type reference" above, but referring either to an enumerator (a 
single member of an `enum` enumeration) or to a named constant. Occurs in constant literals.
* _Positional enumerator reference_: same as "positional type reference" above, but referring to an enumerator. Occurs
in "raw" enumerator literals, e.g. `const myConst: MyEnum = MyEnum(2)`.
* _Lazy field reference_: a simple late-bound reference to a struct field. Occurs in field constructor declarations.

Nesting relationships
---------------------
The reference map is also used to resolve the nesting relationships in some algorithms. I.e. given an element with the
"path" of "core.MyClass.doSomething" (with or without the disambiguation suffix), the "outer" element can be found by
omitting the last section of the path ("core.MyClass") and then using that as a key for the reference map. Such
"nesting parent" look-ups are used in various generator algorithms: import/include resolution, fully qualified name
resolution, etc.

Documentation references
------------------------
Textual references to an element (e.g `[core.MyClass.NestedInterface]`) in LIME documentation comments are also resolved
through the reference map. Only the disambiguation syntax differs: documentation references use function signatures to
explicitly disambiguate between different function overloads. Compared to numerical suffixes, this syntax is more
human-readable. It is also stable with regard to reordering, adding, or removing declarations in the IDL file (numerical
suffixes don't need to be stable, only to be unique within a single Gluecodium execution).

Ambiguous keys
--------------
According to documentation conventions of most target languages, referring to an overloaded function just by name,
without any disambiguation, still has to produce a valid documentation reference. LIME model handles this by adding
so-called "ambiguous keys" to the reference map. For example, given
```kotlin
class MyClass {
    fun doSomething(value: Int)
    fun doSomething(value: String): Boolean
}
```
the reference map will have two keys "core.MyClass.doSomething" and "core.MyClass.doSomething:0", both pointing to the
first overload. The former key is "ambiguous" in a sense that its disambiguation suffix is omitted. The downside is that
this approach is not stable with regard to textual reordering of the overloads in the IDL file. The upside is the
minimal amount of additional processing required.
