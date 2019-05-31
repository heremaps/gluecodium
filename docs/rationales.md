Rationales for some Design decisions
====================================

For some design decisions the rationale might not be immediately apparent, therefore some of these
are documented here.

Pointer equality for Interfaces
-------------------------------

### Pointer comparison in Java/Swift
When a C++ object is passed from Java/Swift and later retrieved (setter/getter) the Java/Swift
object representing it will have a different memory address, e.g. == in Java or === in Swift
respectively will fail. This happens because the bridging code will create a new Java/Swift wrapper
object on return. The object passed via the setter could be cached by the bridging code but since
generated C++ classes are agnostic to their platform bindings, there is no possibility to retain
the Java/Swift wrapper for the lifetime of the C++ object and hence at some point memory address
comparison would fail again.

### Pointer comparison in C++
A C++ object wrapped in Java/Swift will never be copied by bridging code, hence the pointer value
stays the same.

When an Interface is marked as IsInterface=true, i.e. a Java Interface/Swift Protocol is generated
and a native Java/Swift object is passed to C++, a C++ wrapper needs to be instantiated.  It is
passed as `std::shared_ptr` and therefore remains valid as long as C++ code keeps a copy of it. If the
same Java/Swift object is passed again to C++ the same wrapper will be used, i.e. pointer equality
is guaranteed.

Implicit default values for fields in Java
------------------------------------------

### Default constructors for structs
The design decision is to skip generating a default constructor (i.e. a constructor with parameters)
for struct-type classes in Java, unless every field has an explicit default specified. This avoids
the situation where some fields are initialized with some implicit default values which were either
unintended by the API designer or unexpected by the user of the API, or both.

### Builder pattern for structs
Contrary to the one above, there are implicit defaults for the Builder pattern. The implicit
defaults (zeroes and nulls) are applied to each field that **both** lacks an explicit default *and*
was not set by a corresponding `set` call of the Builder class.

The rationale behind this is that Builder pattern is not generated automatically. It has to be
specified explicitly and it occurs much less often than an unconditional default constructor would.
Moreover, the Builder has to initialize the field with *something*. Generating a builder that fails
on uninitialized fields would violate the common behavior of the Builder pattern in Java.

Hash functions in C++
---------------------

For types marked as `Equatable` Genium will also generate a hash function. It appears most
convenient to generate `hash` for custom types in `std` namespace. Sadly STL does not provide
`hash` for containers used by Genium, i.e. `vector`, `unordered_map` and `unordered_set`. In order to
not conflict with any library providing these, Genium should not provide hash functionality for these
in `std` namespace. Genium also distinguishes between `Equatable` and `PointerEquatable` for classes,
which should result in different hashing for `shared_ptr` of the classes. This would conflict with
STL which already defines hash for `shared_ptr` thus might lead to conflicts in generated code. All
in all it is much more consistent if Genium uses `hash` in internal namespace which is implemented
in a way to fallback to `std::hash` if no specialization is available, reusing hash for primitive
types.
