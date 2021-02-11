//
//
import Foundation
public typealias bazTypedef = Double
public enum bazEnum : UInt32, CaseIterable, Codable {
    case BAZ_ITEM
}
internal func foobar_copyToCType(_ swiftEnum: bazEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: bazEnum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: bazEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: bazEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> bazEnum {
    return bazEnum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> bazEnum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> bazEnum? {
    guard handle != 0 else {
        return nil
    }
    return bazEnum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> bazEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
public struct bazStruct {
    public var BAZ_FIELD: String
    internal init(cHandle: _baseRef) {
        BAZ_FIELD = moveFromCType(smoke_bazTypes_bazStruct_BAZ_FIELD_get(cHandle))
    }
    public init(_ BazParameter: String) {
        let _result_handle = bazStruct.BazCreate(BazParameter)
        guard _result_handle != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        let _result: bazStruct = foobar_moveFromCType(_result_handle)
        self.BAZ_FIELD = _result.BAZ_FIELD
    }
    private static func BazCreate(_ BazParameter: String) -> _baseRef {
        let c_BazParameter = moveToCType(BazParameter)
        return moveFromCType(smoke_bazTypes_bazStruct_BazCreate(c_BazParameter.ref))
    }
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> bazStruct {
    return bazStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> bazStruct {
    defer {
        smoke_bazTypes_bazStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: bazStruct) -> RefHolder {
    let c_BAZ_FIELD = moveToCType(swiftType.BAZ_FIELD)
    return RefHolder(smoke_bazTypes_bazStruct_create_handle(c_BAZ_FIELD.ref))
}
internal func foobar_moveToCType(_ swiftType: bazStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_bazTypes_bazStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> bazStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_bazTypes_bazStruct_unwrap_optional_handle(handle)
    return bazStruct(cHandle: unwrappedHandle) as bazStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> bazStruct? {
    defer {
        smoke_bazTypes_bazStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: bazStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_BAZ_FIELD = moveToCType(swiftType.BAZ_FIELD)
    return RefHolder(smoke_bazTypes_bazStruct_create_optional_handle(c_BAZ_FIELD.ref))
}
internal func foobar_moveToCType(_ swiftType: bazStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_bazTypes_bazStruct_release_optional_handle)
}
