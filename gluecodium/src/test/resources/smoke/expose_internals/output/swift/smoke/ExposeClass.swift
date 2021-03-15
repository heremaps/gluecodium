//
//
import Foundation
public class ExposeClass {
    let c_instance : _baseRef
    init(cExposeClass: _baseRef) {
        guard cExposeClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cExposeClass
    }
    deinit {
        smoke_ExposeClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ExposeClass_release_handle(c_instance)
    }
}
/// :nodoc:
public func getRef(_ ref: ExposeClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ExposeClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ExposeClass_release_handle)
        : RefHolder(handle_copy)
}
extension ExposeClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension ExposeClass: Hashable {
    /// :nodoc:
    public static func == (lhs: ExposeClass, rhs: ExposeClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
/// :nodoc:
public func ExposeClass_copyFromCType(_ handle: _baseRef) -> ExposeClass {
    if let swift_pointer = smoke_ExposeClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeClass {
        return re_constructed
    }
    let result = ExposeClass(cExposeClass: smoke_ExposeClass_copy_handle(handle))
    smoke_ExposeClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
/// :nodoc:
public func ExposeClass_moveFromCType(_ handle: _baseRef) -> ExposeClass {
    if let swift_pointer = smoke_ExposeClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExposeClass {
        smoke_ExposeClass_release_handle(handle)
        return re_constructed
    }
    let result = ExposeClass(cExposeClass: handle)
    smoke_ExposeClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
/// :nodoc:
public func ExposeClass_copyFromCType(_ handle: _baseRef) -> ExposeClass? {
    guard handle != 0 else {
        return nil
    }
    return ExposeClass_moveFromCType(handle) as ExposeClass
}
/// :nodoc:
public func ExposeClass_moveFromCType(_ handle: _baseRef) -> ExposeClass? {
    guard handle != 0 else {
        return nil
    }
    return ExposeClass_moveFromCType(handle) as ExposeClass
}
/// :nodoc:
public func copyToCType(_ swiftClass: ExposeClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
/// :nodoc:
public func moveToCType(_ swiftClass: ExposeClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
/// :nodoc:
public func copyToCType(_ swiftClass: ExposeClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
/// :nodoc:
public func moveToCType(_ swiftClass: ExposeClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
