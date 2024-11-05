//

//

import Foundation

internal class DartInternalClassRev {


    let c_instance : _baseRef

    init(cDartInternalClassRev: _baseRef) {
        guard cDartInternalClassRev != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cDartInternalClassRev
    }

    deinit {
        smoke_DartInternalClassRev_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_DartInternalClassRev_release_handle(c_instance)
    }


}



internal func getRef(_ ref: DartInternalClassRev?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_DartInternalClassRev_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_DartInternalClassRev_release_handle)
        : RefHolder(handle_copy)
}

extension DartInternalClassRev: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension DartInternalClassRev: Hashable {
    /// :nodoc:
    public static func == (lhs: DartInternalClassRev, rhs: DartInternalClassRev) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }

    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}

internal func DartInternalClassRev_copyFromCType(_ handle: _baseRef) -> DartInternalClassRev {
    if let swift_pointer = smoke_DartInternalClassRev_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DartInternalClassRev {
        return re_constructed
    }
    let result = DartInternalClassRev(cDartInternalClassRev: smoke_DartInternalClassRev_copy_handle(handle))
    smoke_DartInternalClassRev_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func DartInternalClassRev_moveFromCType(_ handle: _baseRef) -> DartInternalClassRev {
    if let swift_pointer = smoke_DartInternalClassRev_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DartInternalClassRev {
        smoke_DartInternalClassRev_release_handle(handle)
        return re_constructed
    }
    let result = DartInternalClassRev(cDartInternalClassRev: handle)
    smoke_DartInternalClassRev_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func DartInternalClassRev_copyFromCType(_ handle: _baseRef) -> DartInternalClassRev? {
    guard handle != 0 else {
        return nil
    }
    return DartInternalClassRev_moveFromCType(handle) as DartInternalClassRev
}
internal func DartInternalClassRev_moveFromCType(_ handle: _baseRef) -> DartInternalClassRev? {
    guard handle != 0 else {
        return nil
    }
    return DartInternalClassRev_moveFromCType(handle) as DartInternalClassRev
}

internal func copyToCType(_ swiftClass: DartInternalClassRev) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: DartInternalClassRev) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftClass: DartInternalClassRev?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: DartInternalClassRev?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}



