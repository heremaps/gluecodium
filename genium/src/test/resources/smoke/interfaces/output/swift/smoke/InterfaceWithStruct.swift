//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: InterfaceWithStruct?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_InterfaceWithStruct_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_InterfaceWithStruct_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_InterfaceWithStruct_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_InterfaceWithStruct_innerStructMethod = {(swift_class_pointer, inputStruct) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InterfaceWithStruct
        return copyToCType(swift_class.innerStructMethod(inputStruct: moveFromCType(inputStruct))).ref
    }
    let proxy = smoke_InterfaceWithStruct_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_InterfaceWithStruct_release_handle) : RefHolder(proxy)
}
public protocol InterfaceWithStruct : AnyObject {
    func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct
}
internal class _InterfaceWithStruct: InterfaceWithStruct {
    let c_instance : _baseRef
    init(cInterfaceWithStruct: _baseRef) {
        guard cInterfaceWithStruct != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInterfaceWithStruct
    }
    deinit {
        smoke_InterfaceWithStruct_release_handle(c_instance)
    }
    public func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct {
            let c_inputStruct = moveToCType(inputStruct)
        return moveFromCType(smoke_InterfaceWithStruct_innerStructMethod(self.c_instance, c_inputStruct.ref))
    }
}
extension _InterfaceWithStruct: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InterfaceWithStructcopyFromCType(_ handle: _baseRef) -> InterfaceWithStruct {
    if let swift_pointer = smoke_InterfaceWithStruct_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceWithStruct {
        return re_constructed
    }
    return _InterfaceWithStruct(cInterfaceWithStruct: smoke_InterfaceWithStruct_copy_handle(handle))
}
internal func InterfaceWithStructmoveFromCType(_ handle: _baseRef) -> InterfaceWithStruct {
    if let swift_pointer = smoke_InterfaceWithStruct_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InterfaceWithStruct {
        smoke_InterfaceWithStruct_release_handle(handle)
        return re_constructed
    }
    return _InterfaceWithStruct(cInterfaceWithStruct: handle)
}
internal func InterfaceWithStructcopyFromCType(_ handle: _baseRef) -> InterfaceWithStruct? {
    guard handle != 0 else {
        return nil
    }
    return InterfaceWithStructmoveFromCType(handle) as InterfaceWithStruct
}
internal func InterfaceWithStructmoveFromCType(_ handle: _baseRef) -> InterfaceWithStruct? {
    guard handle != 0 else {
        return nil
    }
    return InterfaceWithStructmoveFromCType(handle) as InterfaceWithStruct
}
internal func copyToCType(_ swiftClass: InterfaceWithStruct) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InterfaceWithStruct) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InterfaceWithStruct?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InterfaceWithStruct?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
public struct InnerStruct {
    public var value: Int8
    public init(value: Int8) {
        self.value = value
    }
    internal init(cHandle: _baseRef) {
        value = moveFromCType(smoke_InterfaceWithStruct_InnerStruct_value_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let c_value = moveToCType(value)
        return smoke_InterfaceWithStruct_InnerStruct_create_handle(c_value.ref)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> InnerStruct {
    return InnerStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> InnerStruct {
    defer {
        smoke_InterfaceWithStruct_InnerStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InnerStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: InnerStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InterfaceWithStruct_InnerStruct_release_handle)
}