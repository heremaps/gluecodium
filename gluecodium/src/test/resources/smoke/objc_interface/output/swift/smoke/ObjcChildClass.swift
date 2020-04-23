//
//
import Foundation
@objcMembers
public class ObjcChildClass: ObjcClass {
    init(cObjcChildClass: _baseRef) {
        super.init(cObjcClass: cObjcChildClass)
    }
}
@_cdecl("_CBridgeInitsmoke_ObjcChildClass")
internal func _CBridgeInitsmoke_ObjcChildClass(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = ObjcChildClass(cObjcChildClass: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ObjcChildClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ObjcChildClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ObjcChildClass_release_handle)
        : RefHolder(handle_copy)
}
internal func ObjcChildClass_copyFromCType(_ handle: _baseRef) -> ObjcChildClass {
    if let swift_pointer = smoke_ObjcChildClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ObjcChildClass {
        return re_constructed
    }
    if let swift_pointer = smoke_ObjcChildClass_get_typed(smoke_ObjcChildClass_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ObjcChildClass {
        smoke_ObjcChildClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ObjcChildClass_moveFromCType(_ handle: _baseRef) -> ObjcChildClass {
    if let swift_pointer = smoke_ObjcChildClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ObjcChildClass {
        return re_constructed
    }
    if let swift_pointer = smoke_ObjcChildClass_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ObjcChildClass {
        smoke_ObjcChildClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ObjcChildClass_copyFromCType(_ handle: _baseRef) -> ObjcChildClass? {
    guard handle != 0 else {
        return nil
    }
    return ObjcChildClass_moveFromCType(handle) as ObjcChildClass
}
internal func ObjcChildClass_moveFromCType(_ handle: _baseRef) -> ObjcChildClass? {
    guard handle != 0 else {
        return nil
    }
    return ObjcChildClass_moveFromCType(handle) as ObjcChildClass
}
internal func copyToCType(_ swiftClass: ObjcChildClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ObjcChildClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ObjcChildClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ObjcChildClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
