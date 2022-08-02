Hash functions in C++
=====================

For types marked as `Equatable`, Gluecodium will generate a C++ hash function in addition to any equality operators. It
may seem most convenient to generate the `hash` function for custom types in the `std` namespace. Unfortunately, C++ 
standard library (STL) does not provide `std::hash` for container types: `vector`, `unordered_map` and `unordered_set`.
To avoid conflict with any third-party library providing these container hashes, the decision was made to provide such
Gluecodium hashes in a custom namespace instead. The custom hash falls through to `std::hash` for types, where it is
available.

Main hash function
------------------

`gluecodium::hash` function, generated in a custom namespace, provides the hashing functionality for
Gluecodium-generated code. The main function itself is a template with no logic of its own. The logic is provided either
by a generated specialization, or by the fall-though template selector:
* `gluecodium::hash` specialization is used, if available. Otherwise,
* for enumerations, the trivial `EnumHash` is used, returning the enumerator value as the hash value;
* for shared pointer, a specialization of `EqualityHash` template is used, if available (see below);
* `std::hash` is used, if available.
* if none of the above works, compilation fails (normally, this never happens).

Manual implementation
---------------------

When a `class` or `interface` is marked with `@Equatable` in LIME IDL definitions, a `gluecodium::hash` specialization
has to be implemented manually (next to the rest of the manual "logic" code). When this specialization is implemented,
the main `gluecodium::hash` template uses it through the custom "shared pointer hash" template (see below).

Shared pointer hash
-------------------

The standard `std::hash` does exist for `std::shared_ptr`. It computes the hash value based on the raw pointer value.
However, for `@Equatable` classes the working assumption is: if an instance of this is somehow "equatable" based on its
internal state, it also would be "hashable" based on the same state. Therefore, for such classes `gluecodium::hash` main
template falls through to `EqualityHash` custom shared pointer hash. `EqualityHash`, in turn, uses the manually
implemented specialization `gluecodium::hash` (see above), that is expected to perform this "internal state hashing".

Container hashes
----------------

The `gluecodium::hash` template has specializations for several container types: `std::vector`, `std::unordered_set`,
and `std::unordered_map`. For vector and set types, the hash value is calculated based on hash values of individual
elements in the container. For the map type, the hash value is calculated based on both the keys and the values in the
map.

Struct hash
-----------

`@Equatable` structs have a generated specialization of the `gluecodium::hash` template. The hash value is calculated
based on hash values of individual struct fields.

Other custom hashes
-------------------

The `gluecodium::hash` template also has specializations for `std::chrono::duration` and `std::chrono::time_point`. The
custom Gluecodium type `Locale` has a dedicated hash specialization too.
