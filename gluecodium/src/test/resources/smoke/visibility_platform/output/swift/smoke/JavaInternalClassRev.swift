//

//

import Foundation

public class JavaInternalClassRev {


    let c_instance : _baseRef

    init(cJavaInternalClassRev: _baseRef) {
        guard cJavaInternalClassRev != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cJavaInternalClassRev
    }

    deinit {
        smoke_JavaInternalClassRev_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_JavaInternalClassRev_release_handle(c_instance)
    }


}



internal func getRef(_ ref: JavaInternalClassRev?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_JavaInternalClassRev_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_JavaInternalClassRev_release_handle)
        : RefHolder(handle_copy)
}

extension JavaInternalClassRev: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension JavaInternalClassRev: Hashable {
    /// :nodoc:
    public static func == (lhs: JavaInternalClassRev, rhs: JavaInternalClassRev) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }

    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}

internal func JavaInternalClassRev_copyFromCType(_ handle: _baseRef) -> JavaInternalClassRev {
    if let swift_pointer = smoke_JavaInternalClassRev_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? JavaInternalClassRev {
        return re_constructed
    }
    let result = JavaInternalClassRev(cJavaInternalClassRev: smoke_JavaInternalClassRev_copy_handle(handle))
    smoke_JavaInternalClassRev_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func JavaInternalClassRev_moveFromCType(_ handle: _baseRef) -> JavaInternalClassRev {
    if let swift_pointer = smoke_JavaInternalClassRev_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? JavaInternalClassRev {
        smoke_JavaInternalClassRev_release_handle(handle)
        return re_constructed
    }
    let result = JavaInternalClassRev(cJavaInternalClassRev: handle)
    smoke_JavaInternalClassRev_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func JavaInternalClassRev_copyFromCType(_ handle: _baseRef) -> JavaInternalClassRev? {
    guard handle != 0 else {
        return nil
    }
    return JavaInternalClassRev_moveFromCType(handle) as JavaInternalClassRev
}
internal func JavaInternalClassRev_moveFromCType(_ handle: _baseRef) -> JavaInternalClassRev? {
    guard handle != 0 else {
        return nil
    }
    return JavaInternalClassRev_moveFromCType(handle) as JavaInternalClassRev
}

internal func copyToCType(_ swiftClass: JavaInternalClassRev) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: JavaInternalClassRev) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftClass: JavaInternalClassRev?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: JavaInternalClassRev?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}



