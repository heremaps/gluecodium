//
//
import Foundation
public class BasicTypes {
    let c_instance : _baseRef
    init(cBasicTypes: _baseRef) {
        guard cBasicTypes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cBasicTypes
    }
    deinit {
        smoke_BasicTypes_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_BasicTypes_release_handle(c_instance)
    }
    public static func stringFunction(input: String) -> String {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_stringFunction(c_input.ref))
    }
    public static func boolFunction(input: Bool) -> Bool {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_boolFunction(c_input.ref))
    }
    public static func floatFunction(input: Float) -> Float {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_floatFunction(c_input.ref))
    }
    public static func doubleFunction(input: Double) -> Double {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_doubleFunction(c_input.ref))
    }
    public static func byteFunction(input: Int8) -> Int8 {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_byteFunction(c_input.ref))
    }
    public static func shortFunction(input: Int16) -> Int16 {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_shortFunction(c_input.ref))
    }
    public static func intFunction(input: Int32) -> Int32 {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_intFunction(c_input.ref))
    }
    public static func longFunction(input: Int64) -> Int64 {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_longFunction(c_input.ref))
    }
    public static func ubyteFunction(input: UInt8) -> UInt8 {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_ubyteFunction(c_input.ref))
    }
    public static func ushortFunction(input: UInt16) -> UInt16 {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_ushortFunction(c_input.ref))
    }
    public static func uintFunction(input: UInt32) -> UInt32 {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_uintFunction(c_input.ref))
    }
    public static func ulongFunction(input: UInt64) -> UInt64 {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_BasicTypes_ulongFunction(c_input.ref))
    }
}
internal func getRef(_ ref: BasicTypes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_BasicTypes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_BasicTypes_release_handle)
        : RefHolder(handle_copy)
}
extension BasicTypes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func BasicTypes_copyFromCType(_ handle: _baseRef) -> BasicTypes {
    if let swift_pointer = smoke_BasicTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? BasicTypes {
        return re_constructed
    }
    let result = BasicTypes(cBasicTypes: smoke_BasicTypes_copy_handle(handle))
    smoke_BasicTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func BasicTypes_moveFromCType(_ handle: _baseRef) -> BasicTypes {
    if let swift_pointer = smoke_BasicTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? BasicTypes {
        smoke_BasicTypes_release_handle(handle)
        return re_constructed
    }
    let result = BasicTypes(cBasicTypes: handle)
    smoke_BasicTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func BasicTypes_copyFromCType(_ handle: _baseRef) -> BasicTypes? {
    guard handle != 0 else {
        return nil
    }
    return BasicTypes_moveFromCType(handle) as BasicTypes
}
internal func BasicTypes_moveFromCType(_ handle: _baseRef) -> BasicTypes? {
    guard handle != 0 else {
        return nil
    }
    return BasicTypes_moveFromCType(handle) as BasicTypes
}
internal func copyToCType(_ swiftClass: BasicTypes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: BasicTypes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: BasicTypes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: BasicTypes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
