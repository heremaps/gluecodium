//
//
import Foundation
public class ChildWithCustomConstructor: ParentWithCustomConstructor {
    public override init() {
        let _result = ChildWithCustomConstructor.make()
        super.init(cParentWithCustomConstructor: _result)
        smoke_ChildWithCustomConstructor_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    init(cChildWithCustomConstructor: _baseRef) {
        super.init(cParentWithCustomConstructor: cChildWithCustomConstructor)
    }
    private static func make() -> _baseRef {
        let c_result_handle = smoke_ChildWithCustomConstructor_make()
        return moveFromCType(c_result_handle)
    }
}
@_cdecl("_CBridgeInitsmoke_ChildWithCustomConstructor")
internal func _CBridgeInitsmoke_ChildWithCustomConstructor(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = ChildWithCustomConstructor(cChildWithCustomConstructor: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ChildWithCustomConstructor?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ChildWithCustomConstructor_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ChildWithCustomConstructor_release_handle)
        : RefHolder(handle_copy)
}
internal func ChildWithCustomConstructor_copyFromCType(_ handle: _baseRef) -> ChildWithCustomConstructor {
    if let swift_pointer = smoke_ChildWithCustomConstructor_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildWithCustomConstructor {
        return re_constructed
    }
    if let swift_pointer = smoke_ChildWithCustomConstructor_get_typed(smoke_ChildWithCustomConstructor_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildWithCustomConstructor {
        smoke_ChildWithCustomConstructor_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ChildWithCustomConstructor_moveFromCType(_ handle: _baseRef) -> ChildWithCustomConstructor {
    if let swift_pointer = smoke_ChildWithCustomConstructor_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildWithCustomConstructor {
        smoke_ChildWithCustomConstructor_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ChildWithCustomConstructor_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildWithCustomConstructor {
        smoke_ChildWithCustomConstructor_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ChildWithCustomConstructor_copyFromCType(_ handle: _baseRef) -> ChildWithCustomConstructor? {
    guard handle != 0 else {
        return nil
    }
    return ChildWithCustomConstructor_moveFromCType(handle) as ChildWithCustomConstructor
}
internal func ChildWithCustomConstructor_moveFromCType(_ handle: _baseRef) -> ChildWithCustomConstructor? {
    guard handle != 0 else {
        return nil
    }
    return ChildWithCustomConstructor_moveFromCType(handle) as ChildWithCustomConstructor
}
internal func copyToCType(_ swiftClass: ChildWithCustomConstructor) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildWithCustomConstructor) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ChildWithCustomConstructor?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildWithCustomConstructor?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
