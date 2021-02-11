//
//
import Foundation
public class ChildClassFromClass: ParentClass {
    init(cChildClassFromClass: _baseRef) {
        super.init(cParentClass: cChildClassFromClass)
    }
    public func childClassMethod() -> Void {
        return moveFromCType(smoke_ChildClassFromClass_childClassMethod(self.c_instance))
    }
}
@_cdecl("_CBridgeInitsmoke_ChildClassFromClass")
internal func _CBridgeInitsmoke_ChildClassFromClass(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = ChildClassFromClass(cChildClassFromClass: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ChildClassFromClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ChildClassFromClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ChildClassFromClass_release_handle)
        : RefHolder(handle_copy)
}
internal func foobar_ChildClassFromClass_copyFromCType(_ handle: _baseRef) -> ChildClassFromClass {
    if let swift_pointer = smoke_ChildClassFromClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildClassFromClass {
        return re_constructed
    }
    if let swift_pointer = smoke_ChildClassFromClass_get_typed(smoke_ChildClassFromClass_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildClassFromClass {
        smoke_ChildClassFromClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_ChildClassFromClass_moveFromCType(_ handle: _baseRef) -> ChildClassFromClass {
    if let swift_pointer = smoke_ChildClassFromClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildClassFromClass {
        smoke_ChildClassFromClass_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ChildClassFromClass_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildClassFromClass {
        smoke_ChildClassFromClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_ChildClassFromClass_copyFromCType(_ handle: _baseRef) -> ChildClassFromClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_ChildClassFromClass_moveFromCType(handle) as ChildClassFromClass
}
internal func foobar_ChildClassFromClass_moveFromCType(_ handle: _baseRef) -> ChildClassFromClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_ChildClassFromClass_moveFromCType(handle) as ChildClassFromClass
}
internal func foobar_copyToCType(_ swiftClass: ChildClassFromClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: ChildClassFromClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: ChildClassFromClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: ChildClassFromClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
