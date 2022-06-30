//
//
import Foundation
public struct bazTypes {
    public enum bazEnum : UInt32, CaseIterable, Codable {
        case BAZ_ITEM
    }
    public typealias bazTypedef = Double
    public struct bazStruct {
        public var BAZ_FIELD: String
        internal init(cHandle: _baseRef) {
            BAZ_FIELD = moveFromCType(smoke_bazTypes_bazStruct_BAZ_FIELD_get(cHandle))
        }
        public init(_ BazParameter: String) {
            let _result_handle = bazTypes.bazStruct.BazCreate(BazParameter)
            guard _result_handle != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            let _result: bazTypes.bazStruct = moveFromCType(_result_handle)
            self.BAZ_FIELD = _result.BAZ_FIELD
        }
        private static func BazCreate(_ BazParameter: String) -> _baseRef {
            let c_BazParameter = moveToCType(BazParameter)
            let c_result_handle = smoke_bazTypes_bazStruct_BazCreate(c_BazParameter.ref)
            return moveFromCType(c_result_handle)
        }
    }
}
internal func copyFromCType(_ handle: _baseRef) -> bazTypes.bazStruct {
    return bazTypes.bazStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> bazTypes.bazStruct {
    defer {
        smoke_bazTypes_bazStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: bazTypes.bazStruct) -> RefHolder {
    let c_BAZ_FIELD = moveToCType(swiftType.BAZ_FIELD)
    return RefHolder(smoke_bazTypes_bazStruct_create_handle(c_BAZ_FIELD.ref))
}
internal func moveToCType(_ swiftType: bazTypes.bazStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_bazTypes_bazStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> bazTypes.bazStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_bazTypes_bazStruct_unwrap_optional_handle(handle)
    return bazTypes.bazStruct(cHandle: unwrappedHandle) as bazTypes.bazStruct
}
internal func moveFromCType(_ handle: _baseRef) -> bazTypes.bazStruct? {
    defer {
        smoke_bazTypes_bazStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: bazTypes.bazStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_BAZ_FIELD = moveToCType(swiftType.BAZ_FIELD)
    return RefHolder(smoke_bazTypes_bazStruct_create_optional_handle(c_BAZ_FIELD.ref))
}
internal func moveToCType(_ swiftType: bazTypes.bazStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_bazTypes_bazStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: bazTypes.bazEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: bazTypes.bazEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: bazTypes.bazEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: bazTypes.bazEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> bazTypes.bazEnum {
    return bazTypes.bazEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> bazTypes.bazEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> bazTypes.bazEnum? {
    guard handle != 0 else {
        return nil
    }
    return bazTypes.bazEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> bazTypes.bazEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
