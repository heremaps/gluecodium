//
//
import Foundation
public class ChildConstructors: Constructors {
    public override init() {
        let _result = ChildConstructors.create()
        super.init(cConstructors: _result)
        smoke_ChildConstructors_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    public override init(other: Constructors) {
        let _result = ChildConstructors.create(other: other)
        super.init(cConstructors: _result)
        smoke_ChildConstructors_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    init(cChildConstructors: _baseRef) {
        super.init(cConstructors: cChildConstructors)
    }
    private static func create() -> _baseRef {
        return moveFromCType(smoke_ChildConstructors_create_())
    }
    private static func create(other: Constructors) -> _baseRef {
        let c_other = moveToCType(other)
        return moveFromCType(smoke_ChildConstructors_create_Constructors(c_other.ref))
    }
}
@_cdecl("_CBridgeInitsmoke_ChildConstructors")
internal func _CBridgeInitsmoke_ChildConstructors(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = ChildConstructors(cChildConstructors: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ChildConstructors?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ChildConstructors_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ChildConstructors_release_handle)
        : RefHolder(handle_copy)
}
internal func ChildConstructors_copyFromCType(_ handle: _baseRef) -> ChildConstructors {
    if let swift_pointer = smoke_ChildConstructors_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildConstructors {
        return re_constructed
    }
    if let swift_pointer = smoke_ChildConstructors_get_typed(smoke_ChildConstructors_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildConstructors {
        smoke_ChildConstructors_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ChildConstructors_moveFromCType(_ handle: _baseRef) -> ChildConstructors {
    if let swift_pointer = smoke_ChildConstructors_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildConstructors {
        smoke_ChildConstructors_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ChildConstructors_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildConstructors {
        smoke_ChildConstructors_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ChildConstructors_copyFromCType(_ handle: _baseRef) -> ChildConstructors? {
    guard handle != 0 else {
        return nil
    }
    return ChildConstructors_moveFromCType(handle) as ChildConstructors
}
internal func ChildConstructors_moveFromCType(_ handle: _baseRef) -> ChildConstructors? {
    guard handle != 0 else {
        return nil
    }
    return ChildConstructors_moveFromCType(handle) as ChildConstructors
}
internal func copyToCType(_ swiftClass: ChildConstructors) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildConstructors) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ChildConstructors?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildConstructors?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
