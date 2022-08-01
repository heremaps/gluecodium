Hash functions in C++
=====================

TODO: #1431

For types marked as `Equatable` Gluecodium will also generate a hash function. It appears most
convenient to generate `hash` for custom types in `std` namespace. Sadly STL does not provide
`hash` for containers used by Gluecodium, i.e. `vector`, `unordered_map` and `unordered_set`. In order to
not conflict with any library providing these, Gluecodium should not provide hash functionality for these
in `std` namespace. Gluecodium also distinguishes between `Equatable` and `PointerEquatable` for classes,
which should result in different hashing for `shared_ptr` of the classes. This would conflict with
STL which already defines hash for `shared_ptr` thus might lead to conflicts in generated code. All
in all it is much more consistent if Gluecodium uses `hash` in internal namespace which is implemented
in a way to fallback to `std::hash` if no specialization is available, reusing hash for primitive
types.
