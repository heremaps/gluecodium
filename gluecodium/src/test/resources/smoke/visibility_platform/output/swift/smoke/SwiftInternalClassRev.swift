//
//
import Foundation
internal class SwiftInternalClassRev {
    let c_instance : _baseRef
    init(cSwiftInternalClassRev: _baseRef) {
        guard cSwiftInternalClassRev != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSwiftInternalClassRev
    }
    deinit {
        smoke_SwiftInternalClassRev_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SwiftInternalClassRev_release_handle(c_instance)
    }
}
internal func getRef(_ ref: SwiftInternalClassRev?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SwiftInternalClassRev_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SwiftInternalClassRev_release_handle)
        : RefHolder(handle_copy)
}
extension SwiftInternalClassRev: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension SwiftInternalClassRev: Hashable {
    /// :nodoc:
    public static func == (lhs: SwiftInternalClassRev, rhs: SwiftInternalClassRev) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func SwiftInternalClassRev_copyFromCType(_ handle: _baseRef) -> SwiftInternalClassRev {
    if let swift_pointer = smoke_SwiftInternalClassRev_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SwiftInternalClassRev {
        return re_constructed
    }
    let result = SwiftInternalClassRev(cSwiftInternalClassRev: smoke_SwiftInternalClassRev_copy_handle(handle))
    smoke_SwiftInternalClassRev_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SwiftInternalClassRev_moveFromCType(_ handle: _baseRef) -> SwiftInternalClassRev {
    if let swift_pointer = smoke_SwiftInternalClassRev_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SwiftInternalClassRev {
        smoke_SwiftInternalClassRev_release_handle(handle)
        return re_constructed
    }
    let result = SwiftInternalClassRev(cSwiftInternalClassRev: handle)
    smoke_SwiftInternalClassRev_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SwiftInternalClassRev_copyFromCType(_ handle: _baseRef) -> SwiftInternalClassRev? {
    guard handle != 0 else {
        return nil
    }
    return SwiftInternalClassRev_moveFromCType(handle) as SwiftInternalClassRev
}
internal func SwiftInternalClassRev_moveFromCType(_ handle: _baseRef) -> SwiftInternalClassRev? {
    guard handle != 0 else {
        return nil
    }
    return SwiftInternalClassRev_moveFromCType(handle) as SwiftInternalClassRev
}
internal func copyToCType(_ swiftClass: SwiftInternalClassRev) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SwiftInternalClassRev) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SwiftInternalClassRev?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SwiftInternalClassRev?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
