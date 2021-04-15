//
//
import Foundation
public class EnableIfSkipped {
    let c_instance : _baseRef
    init(cEnableIfSkipped: _baseRef) {
        guard cEnableIfSkipped != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEnableIfSkipped
    }
    deinit {
        smoke_EnableIfSkipped_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_EnableIfSkipped_release_handle(c_instance)
    }
}
internal func getRef(_ ref: EnableIfSkipped?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_EnableIfSkipped_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_EnableIfSkipped_release_handle)
        : RefHolder(handle_copy)
}
extension EnableIfSkipped: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension EnableIfSkipped: Hashable {
    /// :nodoc:
    public static func == (lhs: EnableIfSkipped, rhs: EnableIfSkipped) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func EnableIfSkipped_copyFromCType(_ handle: _baseRef) -> EnableIfSkipped {
    if let swift_pointer = smoke_EnableIfSkipped_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnableIfSkipped {
        return re_constructed
    }
    let result = EnableIfSkipped(cEnableIfSkipped: smoke_EnableIfSkipped_copy_handle(handle))
    smoke_EnableIfSkipped_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func EnableIfSkipped_moveFromCType(_ handle: _baseRef) -> EnableIfSkipped {
    if let swift_pointer = smoke_EnableIfSkipped_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnableIfSkipped {
        smoke_EnableIfSkipped_release_handle(handle)
        return re_constructed
    }
    let result = EnableIfSkipped(cEnableIfSkipped: handle)
    smoke_EnableIfSkipped_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func EnableIfSkipped_copyFromCType(_ handle: _baseRef) -> EnableIfSkipped? {
    guard handle != 0 else {
        return nil
    }
    return EnableIfSkipped_moveFromCType(handle) as EnableIfSkipped
}
internal func EnableIfSkipped_moveFromCType(_ handle: _baseRef) -> EnableIfSkipped? {
    guard handle != 0 else {
        return nil
    }
    return EnableIfSkipped_moveFromCType(handle) as EnableIfSkipped
}
internal func copyToCType(_ swiftClass: EnableIfSkipped) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EnableIfSkipped) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: EnableIfSkipped?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EnableIfSkipped?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
