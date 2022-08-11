//
//
import Foundation
internal class SwiftInternalClass {
    let c_instance : _baseRef
    init(cSwiftInternalClass: _baseRef) {
        guard cSwiftInternalClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSwiftInternalClass
    }
    deinit {
        smoke_SwiftInternalClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SwiftInternalClass_release_handle(c_instance)
    }
}
internal func getRef(_ ref: SwiftInternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SwiftInternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SwiftInternalClass_release_handle)
        : RefHolder(handle_copy)
}
extension SwiftInternalClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension SwiftInternalClass: Hashable {
    /// :nodoc:
    public static func == (lhs: SwiftInternalClass, rhs: SwiftInternalClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func SwiftInternalClass_copyFromCType(_ handle: _baseRef) -> SwiftInternalClass {
    if let swift_pointer = smoke_SwiftInternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SwiftInternalClass {
        return re_constructed
    }
    let result = SwiftInternalClass(cSwiftInternalClass: smoke_SwiftInternalClass_copy_handle(handle))
    smoke_SwiftInternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SwiftInternalClass_moveFromCType(_ handle: _baseRef) -> SwiftInternalClass {
    if let swift_pointer = smoke_SwiftInternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SwiftInternalClass {
        smoke_SwiftInternalClass_release_handle(handle)
        return re_constructed
    }
    let result = SwiftInternalClass(cSwiftInternalClass: handle)
    smoke_SwiftInternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SwiftInternalClass_copyFromCType(_ handle: _baseRef) -> SwiftInternalClass? {
    guard handle != 0 else {
        return nil
    }
    return SwiftInternalClass_moveFromCType(handle) as SwiftInternalClass
}
internal func SwiftInternalClass_moveFromCType(_ handle: _baseRef) -> SwiftInternalClass? {
    guard handle != 0 else {
        return nil
    }
    return SwiftInternalClass_moveFromCType(handle) as SwiftInternalClass
}
internal func copyToCType(_ swiftClass: SwiftInternalClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SwiftInternalClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SwiftInternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SwiftInternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
