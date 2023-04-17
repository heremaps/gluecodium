Pointer equality for classes and interfaces
===========================================

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

When an `interface` implementation is passed from the Platform side to C++, a C++ wrapper needs to be instantiated. It
is passed as `std::shared_ptr` and therefore remains valid as long as C++ code keeps a copy of it. If the
same Platform object is passed again to C++ the same wrapper will be used, i.e. pointer equality is preserved.
