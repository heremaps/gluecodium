//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: AttributesInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_AttributesInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_AttributesInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_AttributesInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_AttributesInterface_structAttribute_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! AttributesInterface
        return swift_class.structAttribute.convertToCType()
    }
    functions.smoke_AttributesInterface_structAttribute_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! AttributesInterface
        swift_class.structAttribute = moveFromCType(newValue)
    }
    let proxy = smoke_AttributesInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_AttributesInterface_release_handle) : RefHolder(proxy)
}
public protocol AttributesInterface : AnyObject {
    var structAttribute: ExampleStruct { get set }
}
internal class _AttributesInterface: AttributesInterface {
    var structAttribute: ExampleStruct {
        get {
            return moveFromCType(smoke_AttributesInterface_structAttribute_get(c_instance))
        }
        set {
            let newValue_handle = newValue.convertToCType()
            defer {
                smoke_AttributesInterface_ExampleStruct_release_handle(newValue_handle)
            }
            return moveFromCType(smoke_AttributesInterface_structAttribute_set(c_instance, newValue_handle))
        }
    }
    let c_instance : _baseRef
    init(cAttributesInterface: _baseRef) {
        guard cAttributesInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cAttributesInterface
    }
    deinit {
        smoke_AttributesInterface_release_handle(c_instance)
    }
}
extension _AttributesInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func AttributesInterfacecopyFromCType(_ handle: _baseRef) -> AttributesInterface {
    if let swift_pointer = smoke_AttributesInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesInterface {
        smoke_AttributesInterface_release_handle(handle)
        return re_constructed
    }
    return _AttributesInterface(cAttributesInterface: handle)
}
internal func AttributesInterfacemoveFromCType(_ handle: _baseRef) -> AttributesInterface {
    return AttributesInterfacecopyFromCType(handle)
}
internal func AttributesInterfacecopyFromCType(_ handle: _baseRef) -> AttributesInterface? {
    guard handle != 0 else {
        return nil
    }
    return AttributesInterfacemoveFromCType(handle) as AttributesInterface
}
internal func AttributesInterfacemoveFromCType(_ handle: _baseRef) -> AttributesInterface? {
    return AttributesInterfacecopyFromCType(handle)
}
public struct ExampleStruct {
    public var value: Double
    public init(value: Double) {
        self.value = value
    }
    internal init(cHandle: _baseRef) {
        value = smoke_AttributesInterface_ExampleStruct_value_get(cHandle)
    }
    internal func convertToCType() -> _baseRef {
        let value_handle = value
        return smoke_AttributesInterface_ExampleStruct_create_handle(value_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ExampleStruct {
    return ExampleStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ExampleStruct {
    defer {
        smoke_AttributesInterface_ExampleStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}