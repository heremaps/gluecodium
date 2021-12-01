//
//
import Foundation
/// Text trailing line break
public class PlatformCommentsLineBreaks {
    let c_instance : _baseRef
    init(cPlatformCommentsLineBreaks: _baseRef) {
        guard cPlatformCommentsLineBreaks != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cPlatformCommentsLineBreaks
    }
    deinit {
        smoke_PlatformCommentsLineBreaks_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_PlatformCommentsLineBreaks_release_handle(c_instance)
    }
}
internal func getRef(_ ref: PlatformCommentsLineBreaks?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_PlatformCommentsLineBreaks_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_PlatformCommentsLineBreaks_release_handle)
        : RefHolder(handle_copy)
}
extension PlatformCommentsLineBreaks: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension PlatformCommentsLineBreaks: Hashable {
    /// :nodoc:
    public static func == (lhs: PlatformCommentsLineBreaks, rhs: PlatformCommentsLineBreaks) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func PlatformCommentsLineBreaks_copyFromCType(_ handle: _baseRef) -> PlatformCommentsLineBreaks {
    if let swift_pointer = smoke_PlatformCommentsLineBreaks_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PlatformCommentsLineBreaks {
        return re_constructed
    }
    let result = PlatformCommentsLineBreaks(cPlatformCommentsLineBreaks: smoke_PlatformCommentsLineBreaks_copy_handle(handle))
    smoke_PlatformCommentsLineBreaks_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func PlatformCommentsLineBreaks_moveFromCType(_ handle: _baseRef) -> PlatformCommentsLineBreaks {
    if let swift_pointer = smoke_PlatformCommentsLineBreaks_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? PlatformCommentsLineBreaks {
        smoke_PlatformCommentsLineBreaks_release_handle(handle)
        return re_constructed
    }
    let result = PlatformCommentsLineBreaks(cPlatformCommentsLineBreaks: handle)
    smoke_PlatformCommentsLineBreaks_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func PlatformCommentsLineBreaks_copyFromCType(_ handle: _baseRef) -> PlatformCommentsLineBreaks? {
    guard handle != 0 else {
        return nil
    }
    return PlatformCommentsLineBreaks_moveFromCType(handle) as PlatformCommentsLineBreaks
}
internal func PlatformCommentsLineBreaks_moveFromCType(_ handle: _baseRef) -> PlatformCommentsLineBreaks? {
    guard handle != 0 else {
        return nil
    }
    return PlatformCommentsLineBreaks_moveFromCType(handle) as PlatformCommentsLineBreaks
}
internal func copyToCType(_ swiftClass: PlatformCommentsLineBreaks) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PlatformCommentsLineBreaks) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: PlatformCommentsLineBreaks?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PlatformCommentsLineBreaks?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
