//
//
import Foundation
public class JavaInternalClass {
    let c_instance : _baseRef
    init(cJavaInternalClass: _baseRef) {
        guard cJavaInternalClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cJavaInternalClass
    }
    deinit {
        smoke_JavaInternalClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_JavaInternalClass_release_handle(c_instance)
    }
}
internal func getRef(_ ref: JavaInternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_JavaInternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_JavaInternalClass_release_handle)
        : RefHolder(handle_copy)
}
extension JavaInternalClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension JavaInternalClass: Hashable {
    /// :nodoc:
    public static func == (lhs: JavaInternalClass, rhs: JavaInternalClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func JavaInternalClass_copyFromCType(_ handle: _baseRef) -> JavaInternalClass {
    if let swift_pointer = smoke_JavaInternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? JavaInternalClass {
        return re_constructed
    }
    let result = JavaInternalClass(cJavaInternalClass: smoke_JavaInternalClass_copy_handle(handle))
    smoke_JavaInternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func JavaInternalClass_moveFromCType(_ handle: _baseRef) -> JavaInternalClass {
    if let swift_pointer = smoke_JavaInternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? JavaInternalClass {
        smoke_JavaInternalClass_release_handle(handle)
        return re_constructed
    }
    let result = JavaInternalClass(cJavaInternalClass: handle)
    smoke_JavaInternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func JavaInternalClass_copyFromCType(_ handle: _baseRef) -> JavaInternalClass? {
    guard handle != 0 else {
        return nil
    }
    return JavaInternalClass_moveFromCType(handle) as JavaInternalClass
}
internal func JavaInternalClass_moveFromCType(_ handle: _baseRef) -> JavaInternalClass? {
    guard handle != 0 else {
        return nil
    }
    return JavaInternalClass_moveFromCType(handle) as JavaInternalClass
}
internal func copyToCType(_ swiftClass: JavaInternalClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: JavaInternalClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: JavaInternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: JavaInternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
