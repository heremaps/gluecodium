//
//
import Foundation
internal class ExposeInternalClass {
    let c_instance : _baseRef
    init(cExposeInternalClass: _baseRef) {
        guard cExposeInternalClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cExposeInternalClass
    }
    deinit {
        smoke_ExposeInternalClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ExposeInternalClass_release_handle(c_instance)
    }
}
internal func getRef(_ ref: ExposeInternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ExposeInternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ExposeInternalClass_release_handle)
        : RefHolder(handle_copy)
}
extension ExposeInternalClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension ExposeInternalClass: Hashable {
    /// :nodoc:
    public static func == (lhs: ExposeInternalClass, rhs: ExposeInternalClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func ExposeInternalClass_copyFromCType(_ handle: _baseRef) -> ExposeInternalClass {
    if let swift_pointer = smoke_ExposeInternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInternalClass {
        return re_constructed
    }
    let result = ExposeInternalClass(cExposeInternalClass: smoke_ExposeInternalClass_copy_handle(handle))
    smoke_ExposeInternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ExposeInternalClass_moveFromCType(_ handle: _baseRef) -> ExposeInternalClass {
    if let swift_pointer = smoke_ExposeInternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeInternalClass {
        smoke_ExposeInternalClass_release_handle(handle)
        return re_constructed
    }
    let result = ExposeInternalClass(cExposeInternalClass: handle)
    smoke_ExposeInternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ExposeInternalClass_copyFromCType(_ handle: _baseRef) -> ExposeInternalClass? {
    guard handle != 0 else {
        return nil
    }
    return ExposeInternalClass_moveFromCType(handle) as ExposeInternalClass
}
internal func ExposeInternalClass_moveFromCType(_ handle: _baseRef) -> ExposeInternalClass? {
    guard handle != 0 else {
        return nil
    }
    return ExposeInternalClass_moveFromCType(handle) as ExposeInternalClass
}
internal func copyToCType(_ swiftClass: ExposeInternalClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExposeInternalClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ExposeInternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExposeInternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
