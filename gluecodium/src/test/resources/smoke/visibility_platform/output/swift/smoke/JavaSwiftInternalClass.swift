//
//
import Foundation
internal class JavaSwiftInternalClass {
    let c_instance : _baseRef
    init(cJavaSwiftInternalClass: _baseRef) {
        guard cJavaSwiftInternalClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cJavaSwiftInternalClass
    }
    deinit {
        smoke_JavaSwiftInternalClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_JavaSwiftInternalClass_release_handle(c_instance)
    }
}
internal func getRef(_ ref: JavaSwiftInternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_JavaSwiftInternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_JavaSwiftInternalClass_release_handle)
        : RefHolder(handle_copy)
}
extension JavaSwiftInternalClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension JavaSwiftInternalClass: Hashable {
    /// :nodoc:
    public static func == (lhs: JavaSwiftInternalClass, rhs: JavaSwiftInternalClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func JavaSwiftInternalClass_copyFromCType(_ handle: _baseRef) -> JavaSwiftInternalClass {
    if let swift_pointer = smoke_JavaSwiftInternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? JavaSwiftInternalClass {
        return re_constructed
    }
    let result = JavaSwiftInternalClass(cJavaSwiftInternalClass: smoke_JavaSwiftInternalClass_copy_handle(handle))
    smoke_JavaSwiftInternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func JavaSwiftInternalClass_moveFromCType(_ handle: _baseRef) -> JavaSwiftInternalClass {
    if let swift_pointer = smoke_JavaSwiftInternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? JavaSwiftInternalClass {
        smoke_JavaSwiftInternalClass_release_handle(handle)
        return re_constructed
    }
    let result = JavaSwiftInternalClass(cJavaSwiftInternalClass: handle)
    smoke_JavaSwiftInternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func JavaSwiftInternalClass_copyFromCType(_ handle: _baseRef) -> JavaSwiftInternalClass? {
    guard handle != 0 else {
        return nil
    }
    return JavaSwiftInternalClass_moveFromCType(handle) as JavaSwiftInternalClass
}
internal func JavaSwiftInternalClass_moveFromCType(_ handle: _baseRef) -> JavaSwiftInternalClass? {
    guard handle != 0 else {
        return nil
    }
    return JavaSwiftInternalClass_moveFromCType(handle) as JavaSwiftInternalClass
}
internal func copyToCType(_ swiftClass: JavaSwiftInternalClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: JavaSwiftInternalClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: JavaSwiftInternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: JavaSwiftInternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
