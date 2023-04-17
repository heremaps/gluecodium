//
//
import Foundation
public class SwiftPublicClass {
    let c_instance : _baseRef
    init(cSwiftPublicClass: _baseRef) {
        guard cSwiftPublicClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSwiftPublicClass
    }
    deinit {
        smoke_SwiftPublicClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SwiftPublicClass_release_handle(c_instance)
    }
}
internal func getRef(_ ref: SwiftPublicClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SwiftPublicClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SwiftPublicClass_release_handle)
        : RefHolder(handle_copy)
}
extension SwiftPublicClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension SwiftPublicClass: Hashable {
    /// :nodoc:
    public static func == (lhs: SwiftPublicClass, rhs: SwiftPublicClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func SwiftPublicClass_copyFromCType(_ handle: _baseRef) -> SwiftPublicClass {
    if let swift_pointer = smoke_SwiftPublicClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SwiftPublicClass {
        return re_constructed
    }
    let result = SwiftPublicClass(cSwiftPublicClass: smoke_SwiftPublicClass_copy_handle(handle))
    smoke_SwiftPublicClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SwiftPublicClass_moveFromCType(_ handle: _baseRef) -> SwiftPublicClass {
    if let swift_pointer = smoke_SwiftPublicClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SwiftPublicClass {
        smoke_SwiftPublicClass_release_handle(handle)
        return re_constructed
    }
    let result = SwiftPublicClass(cSwiftPublicClass: handle)
    smoke_SwiftPublicClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SwiftPublicClass_copyFromCType(_ handle: _baseRef) -> SwiftPublicClass? {
    guard handle != 0 else {
        return nil
    }
    return SwiftPublicClass_moveFromCType(handle) as SwiftPublicClass
}
internal func SwiftPublicClass_moveFromCType(_ handle: _baseRef) -> SwiftPublicClass? {
    guard handle != 0 else {
        return nil
    }
    return SwiftPublicClass_moveFromCType(handle) as SwiftPublicClass
}
internal func copyToCType(_ swiftClass: SwiftPublicClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SwiftPublicClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SwiftPublicClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SwiftPublicClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
