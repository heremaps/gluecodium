//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public enum SomeEnum : UInt32, CaseIterable {
    case fooValue
    case barValue
}
internal func copyToCType(_ swiftEnum: SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> SomeEnum {
    return SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
public struct StructWithDefaults {
    public var intField: Int32
    public var uintField: UInt32
    public var floatField: Float
    public var doubleField: Double
    public var boolField: Bool
    public var stringField: String
    public var enumField: SomeEnum
    public init(intField: Int32 = 42, uintField: UInt32 = 4294967295, floatField: Float = 3.14, doubleField: Double = -1.4142, boolField: Bool = true, stringField: String = "\\Jonny \"Magic\" Smith\n", enumField: SomeEnum = SomeEnum.barValue) {
        self.intField = intField
        self.uintField = uintField
        self.floatField = floatField
        self.doubleField = doubleField
        self.boolField = boolField
        self.stringField = stringField
        self.enumField = enumField
    }
    internal init(cHandle: _baseRef) {
        intField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_intField_get(cHandle))
        uintField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_uintField_get(cHandle))
        floatField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_floatField_get(cHandle))
        doubleField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_doubleField_get(cHandle))
        boolField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_boolField_get(cHandle))
        stringField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_stringField_get(cHandle))
        enumField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_enumField_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let c_intField = moveToCType(intField)
        let c_uintField = moveToCType(uintField)
        let c_floatField = moveToCType(floatField)
        let c_doubleField = moveToCType(doubleField)
        let c_boolField = moveToCType(boolField)
        let c_stringField = moveToCType(stringField)
        let c_enumField = moveToCType(enumField)
        return smoke_TypesWithDefaults_StructWithDefaults_create_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref, c_enumField.ref)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithDefaults {
    return StructWithDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithDefaults {
    defer {
        smoke_TypesWithDefaults_StructWithDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructWithDefaults) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: StructWithDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_StructWithDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypesWithDefaults_StructWithDefaults_unwrap_optional_handle(handle)
    return StructWithDefaults(cHandle: unwrappedHandle) as StructWithDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithDefaults? {
    defer {
        smoke_TypesWithDefaults_StructWithDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructWithDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_TypesWithDefaults_StructWithDefaults_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: StructWithDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_StructWithDefaults_release_optional_handle)
}
public struct ImmutableStructWithDefaults {
    public let intField: Int32
    public let uintField: UInt32
    public let floatField: Float
    public let doubleField: Double
    public let boolField: Bool
    public let stringField: String
    public let enumField: SomeEnum
    public let externalEnumField: DefaultValues.ExternalEnum
    public init(intField: Int32 = 42, uintField: UInt32, floatField: Float = 3.14, doubleField: Double = -1.4142, boolField: Bool, stringField: String = "\\Jonny \"Magic\" Smith\n", enumField: SomeEnum = SomeEnum.barValue, externalEnumField: DefaultValues.ExternalEnum = DefaultValues.ExternalEnum.anotherValue) {
        self.intField = intField
        self.uintField = uintField
        self.floatField = floatField
        self.doubleField = doubleField
        self.boolField = boolField
        self.stringField = stringField
        self.enumField = enumField
        self.externalEnumField = externalEnumField
    }
    internal init(cHandle: _baseRef) {
        intField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_intField_get(cHandle))
        uintField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_uintField_get(cHandle))
        floatField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_floatField_get(cHandle))
        doubleField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_doubleField_get(cHandle))
        boolField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_boolField_get(cHandle))
        stringField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_stringField_get(cHandle))
        enumField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_enumField_get(cHandle))
        externalEnumField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_externalEnumField_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let c_intField = moveToCType(intField)
        let c_uintField = moveToCType(uintField)
        let c_floatField = moveToCType(floatField)
        let c_doubleField = moveToCType(doubleField)
        let c_boolField = moveToCType(boolField)
        let c_stringField = moveToCType(stringField)
        let c_enumField = moveToCType(enumField)
        let c_externalEnumField = moveToCType(externalEnumField)
        return smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref, c_enumField.ref, c_externalEnumField.ref)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ImmutableStructWithDefaults {
    return ImmutableStructWithDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ImmutableStructWithDefaults {
    defer {
        smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ImmutableStructWithDefaults) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: ImmutableStructWithDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ImmutableStructWithDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypesWithDefaults_ImmutableStructWithDefaults_unwrap_optional_handle(handle)
    return ImmutableStructWithDefaults(cHandle: unwrappedHandle) as ImmutableStructWithDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> ImmutableStructWithDefaults? {
    defer {
        smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ImmutableStructWithDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_TypesWithDefaults_ImmutableStructWithDefaults_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: ImmutableStructWithDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_optional_handle)
}
