//
//
import Foundation
extension Extensions {
    public static let fooConst: Extensions.FooEnum = Extensions.FooEnum.foo
    public typealias FooAlias = Extensions.FooStruct
    public enum FooEnum : UInt32, CaseIterable, Codable {
        case foo
        case bar
    }
    public struct FooStruct {
        public var fooField: String
        public init(fooField: String) {
            self.fooField = fooField
        }
        internal init(cHandle: _baseRef) {
            fooField = moveFromCType(smoke_Extensions_FooStruct_fooField_get(cHandle))
        }
    }
}
internal func foobar_copyToCType(_ swiftEnum: Extensions.FooEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: Extensions.FooEnum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: Extensions.FooEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: Extensions.FooEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> Extensions.FooEnum {
    return Extensions.FooEnum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> Extensions.FooEnum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Extensions.FooEnum? {
    guard handle != 0 else {
        return nil
    }
    return Extensions.FooEnum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Extensions.FooEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Extensions.FooStruct {
    return Extensions.FooStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Extensions.FooStruct {
    defer {
        smoke_Extensions_FooStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: Extensions.FooStruct) -> RefHolder {
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_Extensions_FooStruct_create_handle(c_fooField.ref))
}
internal func foobar_moveToCType(_ swiftType: Extensions.FooStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_Extensions_FooStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Extensions.FooStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Extensions_FooStruct_unwrap_optional_handle(handle)
    return Extensions.FooStruct(cHandle: unwrappedHandle) as Extensions.FooStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Extensions.FooStruct? {
    defer {
        smoke_Extensions_FooStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: Extensions.FooStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_Extensions_FooStruct_create_optional_handle(c_fooField.ref))
}
internal func foobar_moveToCType(_ swiftType: Extensions.FooStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_Extensions_FooStruct_release_optional_handle)
}
