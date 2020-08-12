//
//
import Foundation
public class CollectionConstants {
    public static let listConstant: [String] = ["foo", "bar"]
    public static let setConstant: Set<String> = ["foo", "bar"]
    public static let mapConstant: [String: String] = ["foo": "bar"]
    public static let mixedConstant: [[String]: Set<String>] = [["foo"]: ["bar"]]
    let c_instance : _baseRef
    init(cCollectionConstants: _baseRef) {
        guard cCollectionConstants != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCollectionConstants
    }
    deinit {
        smoke_CollectionConstants_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_CollectionConstants_release_handle(c_instance)
    }
}
internal func getRef(_ ref: CollectionConstants?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CollectionConstants_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CollectionConstants_release_handle)
        : RefHolder(handle_copy)
}
extension CollectionConstants: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func CollectionConstants_copyFromCType(_ handle: _baseRef) -> CollectionConstants {
    if let swift_pointer = smoke_CollectionConstants_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CollectionConstants {
        return re_constructed
    }
    let result = CollectionConstants(cCollectionConstants: smoke_CollectionConstants_copy_handle(handle))
    smoke_CollectionConstants_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CollectionConstants_moveFromCType(_ handle: _baseRef) -> CollectionConstants {
    if let swift_pointer = smoke_CollectionConstants_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CollectionConstants {
        smoke_CollectionConstants_release_handle(handle)
        return re_constructed
    }
    let result = CollectionConstants(cCollectionConstants: handle)
    smoke_CollectionConstants_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CollectionConstants_copyFromCType(_ handle: _baseRef) -> CollectionConstants? {
    guard handle != 0 else {
        return nil
    }
    return CollectionConstants_moveFromCType(handle) as CollectionConstants
}
internal func CollectionConstants_moveFromCType(_ handle: _baseRef) -> CollectionConstants? {
    guard handle != 0 else {
        return nil
    }
    return CollectionConstants_moveFromCType(handle) as CollectionConstants
}
internal func copyToCType(_ swiftClass: CollectionConstants) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CollectionConstants) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CollectionConstants?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CollectionConstants?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
