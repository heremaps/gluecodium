//
//
import Foundation
public class bazInterface {
    public init(_ makeParameter: String) {
        let _result = bazInterface.make(makeParameter)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_bazInterface_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    public var BAZ_PROPERTY: UInt32 {
        get {
            return moveFromCType(smoke_bazInterface_BAZ_PROPERTY_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_bazInterface_BAZ_PROPERTY_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cbazInterface: _baseRef) {
        guard cbazInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cbazInterface
    }
    deinit {
        smoke_bazInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_bazInterface_release_handle(c_instance)
    }
    public func BazMethod(_ BazParameter: String) -> bazStruct {
        let c_BazParameter = moveToCType(BazParameter)
        return moveFromCType(smoke_bazInterface_BazMethod(self.c_instance, c_BazParameter.ref))
    }
    private static func make(_ makeParameter: String) -> _baseRef {
        let c_makeParameter = moveToCType(makeParameter)
        return moveFromCType(smoke_bazInterface_make(c_makeParameter.ref))
    }
}
internal func getRef(_ ref: bazInterface?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_bazInterface_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_bazInterface_release_handle)
        : RefHolder(handle_copy)
}
extension bazInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension bazInterface: Hashable {
    /// :nodoc:
    public static func == (lhs: bazInterface, rhs: bazInterface) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func bazInterface_copyFromCType(_ handle: _baseRef) -> bazInterface {
    if let swift_pointer = smoke_bazInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? bazInterface {
        return re_constructed
    }
    let result = bazInterface(cbazInterface: smoke_bazInterface_copy_handle(handle))
    smoke_bazInterface_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func bazInterface_moveFromCType(_ handle: _baseRef) -> bazInterface {
    if let swift_pointer = smoke_bazInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? bazInterface {
        smoke_bazInterface_release_handle(handle)
        return re_constructed
    }
    let result = bazInterface(cbazInterface: handle)
    smoke_bazInterface_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func bazInterface_copyFromCType(_ handle: _baseRef) -> bazInterface? {
    guard handle != 0 else {
        return nil
    }
    return bazInterface_moveFromCType(handle) as bazInterface
}
internal func bazInterface_moveFromCType(_ handle: _baseRef) -> bazInterface? {
    guard handle != 0 else {
        return nil
    }
    return bazInterface_moveFromCType(handle) as bazInterface
}
internal func copyToCType(_ swiftClass: bazInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: bazInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: bazInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: bazInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
