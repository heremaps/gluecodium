//
//
import Foundation
public class DartInternalClass {
    let c_instance : _baseRef
    init(cDartInternalClass: _baseRef) {
        guard cDartInternalClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cDartInternalClass
    }
    deinit {
        smoke_DartInternalClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_DartInternalClass_release_handle(c_instance)
    }
}
internal func getRef(_ ref: DartInternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_DartInternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_DartInternalClass_release_handle)
        : RefHolder(handle_copy)
}
extension DartInternalClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension DartInternalClass: Hashable {
    /// :nodoc:
    public static func == (lhs: DartInternalClass, rhs: DartInternalClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func DartInternalClass_copyFromCType(_ handle: _baseRef) -> DartInternalClass {
    if let swift_pointer = smoke_DartInternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DartInternalClass {
        return re_constructed
    }
    let result = DartInternalClass(cDartInternalClass: smoke_DartInternalClass_copy_handle(handle))
    smoke_DartInternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func DartInternalClass_moveFromCType(_ handle: _baseRef) -> DartInternalClass {
    if let swift_pointer = smoke_DartInternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DartInternalClass {
        smoke_DartInternalClass_release_handle(handle)
        return re_constructed
    }
    let result = DartInternalClass(cDartInternalClass: handle)
    smoke_DartInternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func DartInternalClass_copyFromCType(_ handle: _baseRef) -> DartInternalClass? {
    guard handle != 0 else {
        return nil
    }
    return DartInternalClass_moveFromCType(handle) as DartInternalClass
}
internal func DartInternalClass_moveFromCType(_ handle: _baseRef) -> DartInternalClass? {
    guard handle != 0 else {
        return nil
    }
    return DartInternalClass_moveFromCType(handle) as DartInternalClass
}
internal func copyToCType(_ swiftClass: DartInternalClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DartInternalClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: DartInternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DartInternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
