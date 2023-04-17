//
//
import Foundation
internal class DartPublicClass {
    let c_instance : _baseRef
    init(cDartPublicClass: _baseRef) {
        guard cDartPublicClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cDartPublicClass
    }
    deinit {
        smoke_DartPublicClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_DartPublicClass_release_handle(c_instance)
    }
}
internal func getRef(_ ref: DartPublicClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_DartPublicClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_DartPublicClass_release_handle)
        : RefHolder(handle_copy)
}
extension DartPublicClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension DartPublicClass: Hashable {
    /// :nodoc:
    public static func == (lhs: DartPublicClass, rhs: DartPublicClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func DartPublicClass_copyFromCType(_ handle: _baseRef) -> DartPublicClass {
    if let swift_pointer = smoke_DartPublicClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DartPublicClass {
        return re_constructed
    }
    let result = DartPublicClass(cDartPublicClass: smoke_DartPublicClass_copy_handle(handle))
    smoke_DartPublicClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func DartPublicClass_moveFromCType(_ handle: _baseRef) -> DartPublicClass {
    if let swift_pointer = smoke_DartPublicClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DartPublicClass {
        smoke_DartPublicClass_release_handle(handle)
        return re_constructed
    }
    let result = DartPublicClass(cDartPublicClass: handle)
    smoke_DartPublicClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func DartPublicClass_copyFromCType(_ handle: _baseRef) -> DartPublicClass? {
    guard handle != 0 else {
        return nil
    }
    return DartPublicClass_moveFromCType(handle) as DartPublicClass
}
internal func DartPublicClass_moveFromCType(_ handle: _baseRef) -> DartPublicClass? {
    guard handle != 0 else {
        return nil
    }
    return DartPublicClass_moveFromCType(handle) as DartPublicClass
}
internal func copyToCType(_ swiftClass: DartPublicClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DartPublicClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: DartPublicClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DartPublicClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
