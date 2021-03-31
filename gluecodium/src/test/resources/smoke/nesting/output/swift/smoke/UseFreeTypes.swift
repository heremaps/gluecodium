//
//
import Foundation
public class UseFreeTypes {
    let c_instance : _baseRef
    init(cUseFreeTypes: _baseRef) {
        guard cUseFreeTypes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cUseFreeTypes
    }
    deinit {
        smoke_UseFreeTypes_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_UseFreeTypes_release_handle(c_instance)
    }
    public func doStuff(point: FreePoint, mode: FreeEnum) throws -> FreeTypeDef {
        let c_point = moveToCType(point)
        let c_mode = moveToCType(mode)
        let RESULT = smoke_UseFreeTypes_doStuff(self.c_instance, c_point.ref, c_mode.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as FreeError
        }
        let c_result_handle = RESULT.returned_value
        return moveFromCType(c_result_handle)
    }
}
internal func getRef(_ ref: UseFreeTypes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_UseFreeTypes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_UseFreeTypes_release_handle)
        : RefHolder(handle_copy)
}
extension UseFreeTypes: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension UseFreeTypes: Hashable {
    /// :nodoc:
    public static func == (lhs: UseFreeTypes, rhs: UseFreeTypes) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func UseFreeTypes_copyFromCType(_ handle: _baseRef) -> UseFreeTypes {
    if let swift_pointer = smoke_UseFreeTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? UseFreeTypes {
        return re_constructed
    }
    let result = UseFreeTypes(cUseFreeTypes: smoke_UseFreeTypes_copy_handle(handle))
    smoke_UseFreeTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func UseFreeTypes_moveFromCType(_ handle: _baseRef) -> UseFreeTypes {
    if let swift_pointer = smoke_UseFreeTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? UseFreeTypes {
        smoke_UseFreeTypes_release_handle(handle)
        return re_constructed
    }
    let result = UseFreeTypes(cUseFreeTypes: handle)
    smoke_UseFreeTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func UseFreeTypes_copyFromCType(_ handle: _baseRef) -> UseFreeTypes? {
    guard handle != 0 else {
        return nil
    }
    return UseFreeTypes_moveFromCType(handle) as UseFreeTypes
}
internal func UseFreeTypes_moveFromCType(_ handle: _baseRef) -> UseFreeTypes? {
    guard handle != 0 else {
        return nil
    }
    return UseFreeTypes_moveFromCType(handle) as UseFreeTypes
}
internal func copyToCType(_ swiftClass: UseFreeTypes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: UseFreeTypes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: UseFreeTypes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: UseFreeTypes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
