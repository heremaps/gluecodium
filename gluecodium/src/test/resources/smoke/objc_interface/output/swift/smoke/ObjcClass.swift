//
//
import Foundation
@objcMembers
public class ObjcClass: NSObject {
    let c_instance : _baseRef
    init(cObjcClass: _baseRef) {
        guard cObjcClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cObjcClass
    }
    deinit {
        smoke_ObjcClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ObjcClass_release_handle(c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_ObjcClass")
internal func _CBridgeInitsmoke_ObjcClass(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = ObjcClass(cObjcClass: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ObjcClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ObjcClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ObjcClass_release_handle)
        : RefHolder(handle_copy)
}
extension ObjcClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension ObjcClass: Hashable {
    public static func == (lhs: ObjcClass, rhs: ObjcClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func ObjcClass_copyFromCType(_ handle: _baseRef) -> ObjcClass {
    if let swift_pointer = smoke_ObjcClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ObjcClass {
        return re_constructed
    }
    if let swift_pointer = smoke_ObjcClass_get_typed(smoke_ObjcClass_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ObjcClass {
        smoke_ObjcClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ObjcClass_moveFromCType(_ handle: _baseRef) -> ObjcClass {
    if let swift_pointer = smoke_ObjcClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ObjcClass {
        smoke_ObjcClass_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ObjcClass_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ObjcClass {
        smoke_ObjcClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ObjcClass_copyFromCType(_ handle: _baseRef) -> ObjcClass? {
    guard handle != 0 else {
        return nil
    }
    return ObjcClass_moveFromCType(handle) as ObjcClass
}
internal func ObjcClass_moveFromCType(_ handle: _baseRef) -> ObjcClass? {
    guard handle != 0 else {
        return nil
    }
    return ObjcClass_moveFromCType(handle) as ObjcClass
}
internal func copyToCType(_ swiftClass: ObjcClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ObjcClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ObjcClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ObjcClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
