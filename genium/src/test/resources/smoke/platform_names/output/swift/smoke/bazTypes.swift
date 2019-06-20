//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public typealias bazTypedef = Double
public typealias bazArray = [Float]
public enum bazEnum : UInt32, CaseIterable {
    case BAZ_ITEM
}
internal func copyToCType(_ swiftEnum: bazEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: bazEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: bazEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: bazEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> bazEnum {
    return bazEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> bazEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> bazEnum? {
    guard handle != 0 else {
        return nil
    }
    return bazEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> bazEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
public struct bazStruct {
    public var BAZ_FIELD: String
    public init(BAZ_FIELD: String) {
        self.BAZ_FIELD = BAZ_FIELD
    }
    internal init(cHandle: _baseRef) {
        BAZ_FIELD = moveFromCType(smoke_PlatformNames_bazStruct_BAZ_FIELD_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> bazStruct {
    return bazStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> bazStruct {
    defer {
        smoke_PlatformNames_bazStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: bazStruct) -> RefHolder {
    let c_BAZ_FIELD = moveToCType(swiftType.BAZ_FIELD)
    return RefHolder(smoke_PlatformNames_bazStruct_create_handle(c_BAZ_FIELD.ref))
}
internal func moveToCType(_ swiftType: bazStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PlatformNames_bazStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> bazStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PlatformNames_bazStruct_unwrap_optional_handle(handle)
    return bazStruct(cHandle: unwrappedHandle) as bazStruct
}
internal func moveFromCType(_ handle: _baseRef) -> bazStruct? {
    defer {
        smoke_PlatformNames_bazStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: bazStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_BAZ_FIELD = moveToCType(swiftType.BAZ_FIELD)
    return RefHolder(smoke_PlatformNames_bazStruct_create_optional_handle(c_BAZ_FIELD.ref))
}
internal func moveToCType(_ swiftType: bazStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PlatformNames_bazStruct_release_optional_handle)
}
