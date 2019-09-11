//
//
import Foundation
@objcMembers
public class ObjcImplementerClass: NSObject, ObjcInterface {
    let c_instance : _baseRef
    init(cObjcImplementerClass: _baseRef) {
        guard cObjcImplementerClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cObjcImplementerClass
    }
    deinit {
        smoke_ObjcImplementerClass_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_ObjcImplementerClass")
internal func _CBridgeInitsmoke_ObjcImplementerClass(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = ObjcImplementerClass(cObjcImplementerClass: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ObjcImplementerClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ObjcImplementerClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ObjcImplementerClass_release_handle)
        : RefHolder(handle_copy)
}
extension ObjcImplementerClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ObjcImplementerClasscopyFromCType(_ handle: _baseRef) -> ObjcImplementerClass {
    if let swift_pointer = smoke_ObjcImplementerClass_get_typed(smoke_ObjcImplementerClass_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ObjcImplementerClass {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ObjcImplementerClassmoveFromCType(_ handle: _baseRef) -> ObjcImplementerClass {
    if let swift_pointer = smoke_ObjcImplementerClass_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ObjcImplementerClass {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ObjcImplementerClasscopyFromCType(_ handle: _baseRef) -> ObjcImplementerClass? {
    guard handle != 0 else {
        return nil
    }
    return ObjcImplementerClassmoveFromCType(handle) as ObjcImplementerClass
}
internal func ObjcImplementerClassmoveFromCType(_ handle: _baseRef) -> ObjcImplementerClass? {
    guard handle != 0 else {
        return nil
    }
    return ObjcImplementerClassmoveFromCType(handle) as ObjcImplementerClass
}
internal func copyToCType(_ swiftClass: ObjcImplementerClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ObjcImplementerClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ObjcImplementerClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ObjcImplementerClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
