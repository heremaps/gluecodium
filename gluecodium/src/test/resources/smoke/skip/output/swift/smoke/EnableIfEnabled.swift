//
//
import Foundation
public class EnableIfEnabled {
    let c_instance : _baseRef
    init(cEnableIfEnabled: _baseRef) {
        guard cEnableIfEnabled != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEnableIfEnabled
    }
    deinit {
        smoke_EnableIfEnabled_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_EnableIfEnabled_release_handle(c_instance)
    }
    public static func enableIfUnquoted() -> Void {
        smoke_EnableIfEnabled_enableIfUnquoted()
    }
    public static func enableIfUnquotedList() -> Void {
        smoke_EnableIfEnabled_enableIfUnquotedList()
    }
    public static func enableIfQuoted() -> Void {
        smoke_EnableIfEnabled_enableIfQuoted()
    }
    public static func enableIfQuotedList() -> Void {
        smoke_EnableIfEnabled_enableIfQuotedList()
    }
    public static func enableIfTagged() -> Void {
        smoke_EnableIfEnabled_enableIfTagged()
    }
    public static func enableIfTaggedList() -> Void {
        smoke_EnableIfEnabled_enableIfTaggedList()
    }
    public static func enableIfMixedList() -> Void {
        smoke_EnableIfEnabled_enableIfMixedList()
    }
}
internal func getRef(_ ref: EnableIfEnabled?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_EnableIfEnabled_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_EnableIfEnabled_release_handle)
        : RefHolder(handle_copy)
}
extension EnableIfEnabled: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension EnableIfEnabled: Hashable {
    /// :nodoc:
    public static func == (lhs: EnableIfEnabled, rhs: EnableIfEnabled) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func EnableIfEnabled_copyFromCType(_ handle: _baseRef) -> EnableIfEnabled {
    if let swift_pointer = smoke_EnableIfEnabled_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnableIfEnabled {
        return re_constructed
    }
    let result = EnableIfEnabled(cEnableIfEnabled: smoke_EnableIfEnabled_copy_handle(handle))
    smoke_EnableIfEnabled_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func EnableIfEnabled_moveFromCType(_ handle: _baseRef) -> EnableIfEnabled {
    if let swift_pointer = smoke_EnableIfEnabled_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnableIfEnabled {
        smoke_EnableIfEnabled_release_handle(handle)
        return re_constructed
    }
    let result = EnableIfEnabled(cEnableIfEnabled: handle)
    smoke_EnableIfEnabled_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func EnableIfEnabled_copyFromCType(_ handle: _baseRef) -> EnableIfEnabled? {
    guard handle != 0 else {
        return nil
    }
    return EnableIfEnabled_moveFromCType(handle) as EnableIfEnabled
}
internal func EnableIfEnabled_moveFromCType(_ handle: _baseRef) -> EnableIfEnabled? {
    guard handle != 0 else {
        return nil
    }
    return EnableIfEnabled_moveFromCType(handle) as EnableIfEnabled
}
internal func copyToCType(_ swiftClass: EnableIfEnabled) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EnableIfEnabled) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: EnableIfEnabled?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EnableIfEnabled?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
