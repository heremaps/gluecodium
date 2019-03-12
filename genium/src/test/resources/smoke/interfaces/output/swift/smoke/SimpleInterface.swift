//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: SimpleInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_SimpleInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_SimpleInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_SimpleInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_SimpleInterface_setStringValue = {(swift_class_pointer, stringValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SimpleInterface
        swift_class.setStringValue(stringValue: moveFromCType(stringValue))
    }
    functions.smoke_SimpleInterface_getStringValue = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SimpleInterface
        return copyToCType(swift_class.getStringValue()).ref
    }
    let proxy = smoke_SimpleInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_SimpleInterface_release_handle) : RefHolder(proxy)
}
public protocol SimpleInterface : AnyObject {
    func setStringValue(stringValue: String) -> Void
    func getStringValue() -> String
}
internal class _SimpleInterface: SimpleInterface {
    let c_instance : _baseRef
    init(cSimpleInterface: _baseRef) {
        guard cSimpleInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSimpleInterface
    }
    deinit {
        smoke_SimpleInterface_release_handle(c_instance)
    }
    public func setStringValue(stringValue: String) -> Void {
            let c_stringValue = moveToCType(stringValue)
        return moveFromCType(smoke_SimpleInterface_setStringValue(self.c_instance, c_stringValue.ref))
    }
    public func getStringValue() -> String {
        return moveFromCType(smoke_SimpleInterface_getStringValue(self.c_instance))
    }
}
extension _SimpleInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func SimpleInterfacecopyFromCType(_ handle: _baseRef) -> SimpleInterface {
    if let swift_pointer = smoke_SimpleInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SimpleInterface {
        smoke_SimpleInterface_release_handle(handle)
        return re_constructed
    }
    return _SimpleInterface(cSimpleInterface: handle)
}
internal func SimpleInterfacemoveFromCType(_ handle: _baseRef) -> SimpleInterface {
    return SimpleInterfacecopyFromCType(handle)
}
internal func SimpleInterfacecopyFromCType(_ handle: _baseRef) -> SimpleInterface? {
    guard handle != 0 else {
        return nil
    }
    return SimpleInterfacemoveFromCType(handle) as SimpleInterface
}
internal func SimpleInterfacemoveFromCType(_ handle: _baseRef) -> SimpleInterface? {
    return SimpleInterfacecopyFromCType(handle)
}
internal func copyToCType(_ swiftClass: SimpleInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SimpleInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SimpleInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SimpleInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}