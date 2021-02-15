//
//
import Foundation
import UIKit
public class UseSwiftExternalTypes {
    let c_instance : _baseRef
    init(cUseSwiftExternalTypes: _baseRef) {
        guard cUseSwiftExternalTypes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cUseSwiftExternalTypes
    }
    deinit {
        smoke_UseSwiftExternalTypes_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_UseSwiftExternalTypes_release_handle(c_instance)
    }
    public static func dateIntervalRoundTrip(input: DateInterval) -> DateInterval {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_UseSwiftExternalTypes_dateIntervalRoundTrip(c_input.ref))
    }
    public static func persistenceRoundTrip(input: URLCredential.Persistence) -> URLCredential.Persistence {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_UseSwiftExternalTypes_persistenceRoundTrip(c_input.ref))
    }
    public static func colorRoundTrip(input: UIColor) -> UIColor {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_UseSwiftExternalTypes_colorRoundTrip(c_input.ref))
    }
    public static func seasonRoundTrip(input: SwiftSeason) -> SwiftSeason {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_UseSwiftExternalTypes_seasonRoundTrip(c_input.ref))
    }
}
internal func getRef(_ ref: UseSwiftExternalTypes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_UseSwiftExternalTypes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_UseSwiftExternalTypes_release_handle)
        : RefHolder(handle_copy)
}
extension UseSwiftExternalTypes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension UseSwiftExternalTypes: Hashable {
    /// :nodoc:
    public static func == (lhs: UseSwiftExternalTypes, rhs: UseSwiftExternalTypes) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func UseSwiftExternalTypes_copyFromCType(_ handle: _baseRef) -> UseSwiftExternalTypes {
    if let swift_pointer = smoke_UseSwiftExternalTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? UseSwiftExternalTypes {
        return re_constructed
    }
    let result = UseSwiftExternalTypes(cUseSwiftExternalTypes: smoke_UseSwiftExternalTypes_copy_handle(handle))
    smoke_UseSwiftExternalTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func UseSwiftExternalTypes_moveFromCType(_ handle: _baseRef) -> UseSwiftExternalTypes {
    if let swift_pointer = smoke_UseSwiftExternalTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? UseSwiftExternalTypes {
        smoke_UseSwiftExternalTypes_release_handle(handle)
        return re_constructed
    }
    let result = UseSwiftExternalTypes(cUseSwiftExternalTypes: handle)
    smoke_UseSwiftExternalTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func UseSwiftExternalTypes_copyFromCType(_ handle: _baseRef) -> UseSwiftExternalTypes? {
    guard handle != 0 else {
        return nil
    }
    return UseSwiftExternalTypes_moveFromCType(handle) as UseSwiftExternalTypes
}
internal func UseSwiftExternalTypes_moveFromCType(_ handle: _baseRef) -> UseSwiftExternalTypes? {
    guard handle != 0 else {
        return nil
    }
    return UseSwiftExternalTypes_moveFromCType(handle) as UseSwiftExternalTypes
}
internal func copyToCType(_ swiftClass: UseSwiftExternalTypes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: UseSwiftExternalTypes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: UseSwiftExternalTypes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: UseSwiftExternalTypes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
