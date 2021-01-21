//
//
import Foundation
public class SkipTagsOnly {
    let c_instance : _baseRef
    init(cSkipTagsOnly: _baseRef) {
        guard cSkipTagsOnly != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSkipTagsOnly
    }
    deinit {
        smoke_SkipTagsOnly_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SkipTagsOnly_release_handle(c_instance)
    }
}
internal func getRef(_ ref: SkipTagsOnly?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SkipTagsOnly_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SkipTagsOnly_release_handle)
        : RefHolder(handle_copy)
}
extension SkipTagsOnly: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension SkipTagsOnly: Hashable {
    public static func == (lhs: SkipTagsOnly, rhs: SkipTagsOnly) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func SkipTagsOnly_copyFromCType(_ handle: _baseRef) -> SkipTagsOnly {
    if let swift_pointer = smoke_SkipTagsOnly_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipTagsOnly {
        return re_constructed
    }
    let result = SkipTagsOnly(cSkipTagsOnly: smoke_SkipTagsOnly_copy_handle(handle))
    smoke_SkipTagsOnly_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SkipTagsOnly_moveFromCType(_ handle: _baseRef) -> SkipTagsOnly {
    if let swift_pointer = smoke_SkipTagsOnly_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipTagsOnly {
        smoke_SkipTagsOnly_release_handle(handle)
        return re_constructed
    }
    let result = SkipTagsOnly(cSkipTagsOnly: handle)
    smoke_SkipTagsOnly_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SkipTagsOnly_copyFromCType(_ handle: _baseRef) -> SkipTagsOnly? {
    guard handle != 0 else {
        return nil
    }
    return SkipTagsOnly_moveFromCType(handle) as SkipTagsOnly
}
internal func SkipTagsOnly_moveFromCType(_ handle: _baseRef) -> SkipTagsOnly? {
    guard handle != 0 else {
        return nil
    }
    return SkipTagsOnly_moveFromCType(handle) as SkipTagsOnly
}
internal func copyToCType(_ swiftClass: SkipTagsOnly) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipTagsOnly) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SkipTagsOnly?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipTagsOnly?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
