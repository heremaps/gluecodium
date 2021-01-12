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
        smoke_ObjcImplementerClass_remove_swift_object_from_wrapper_cache(c_instance)
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
extension ObjcImplementerClass: Hashable {
    public static func == (lhs: ObjcImplementerClass, rhs: ObjcImplementerClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func ObjcImplementerClass_copyFromCType(_ handle: _baseRef) -> ObjcImplementerClass {
    if let swift_pointer = smoke_ObjcImplementerClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ObjcImplementerClass {
        return re_constructed
    }
    if let swift_pointer = smoke_ObjcImplementerClass_get_typed(smoke_ObjcImplementerClass_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ObjcImplementerClass {
        smoke_ObjcImplementerClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ObjcImplementerClass_moveFromCType(_ handle: _baseRef) -> ObjcImplementerClass {
    if let swift_pointer = smoke_ObjcImplementerClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ObjcImplementerClass {
        smoke_ObjcImplementerClass_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ObjcImplementerClass_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ObjcImplementerClass {
        smoke_ObjcImplementerClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ObjcImplementerClass_copyFromCType(_ handle: _baseRef) -> ObjcImplementerClass? {
    guard handle != 0 else {
        return nil
    }
    return ObjcImplementerClass_moveFromCType(handle) as ObjcImplementerClass
}
internal func ObjcImplementerClass_moveFromCType(_ handle: _baseRef) -> ObjcImplementerClass? {
    guard handle != 0 else {
        return nil
    }
    return ObjcImplementerClass_moveFromCType(handle) as ObjcImplementerClass
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
