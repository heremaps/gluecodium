# Generated code for Swift

This should give some overview how the generated code for Swift bindings is structured.

## Generated layers for Swift

Bindings generation for Swift consists of the Swift code and some translation layer C-Bridge between Swift and the C++ BaseAPI. As Swift only supports C calling conventions, the interface to Swift must be pure C.
![Generated code overview](diagrams/SwiftOverview.svg)

## Classes with C++ implementation

Lime IDL classes are generated as classes in Swift and abstract classes in BaseAPI. Calling into C++, objects needs to pass through the
C interface. The lifetime of the C++ object can be prolonged by holding a reference on Swift side.
![Interfaces code overview](diagrams/SwiftInterfaces.svg)

## Interfaces with Swift implementation

For interfaces Gluecodium generates a protocol in Swift which can be implemented in Swift and passed to C++. Gluecodium generates
the necessary proxy class. Holding a `shared_ptr` to the proxy on C++ side will extend the life of the Swift object.
![Listeners code overview](diagrams/SwiftProxy.svg)

## Preserving object type when passing subclass from C++ to Swift

Each base class or base interface (that means it does not inherit from anything) has a map called TypeRepository. In the C++
constructor it will register its object with a *type init function*. Subclasses register in the same TypeRepository with their own
*type init function*. When the C++ object is passed to Swift, then in order to create the Swift wrapper object, the *type init
function* is called. It is implemented in Swift and declared with `@_cdecl("CBridgeInit...")` in order to be callable from C.
This way each object will have the Swift wrapper object according to its actual type and type checking works natively on Swift side.
