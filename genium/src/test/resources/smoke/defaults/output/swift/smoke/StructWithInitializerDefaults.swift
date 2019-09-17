//
//
import Foundation
public struct StructWithInitializerDefaults {
    public var intsField: [Int32]
    public var floatsField: DefaultValues.FloatArray
    public var structField: StructWithAnEnum
    public var setTypeField: DefaultValues.StringSet
    public init(intsField: [Int32] = [4, -2, 42], floatsField: DefaultValues.FloatArray = [3.14, -Float.infinity], structField: StructWithAnEnum = StructWithAnEnum(config: AnEnum.disabled), setTypeField: DefaultValues.StringSet = ["foo", "bar"]) {
        self.intsField = intsField
        self.floatsField = floatsField
        self.structField = structField
        self.setTypeField = setTypeField
    }
    internal init(cHandle: _baseRef) {
        intsField = moveFromCType(smoke_StructWithInitializerDefaults_intsField_get(cHandle))
        floatsField = moveFromCType(smoke_StructWithInitializerDefaults_floatsField_get(cHandle))
        structField = moveFromCType(smoke_StructWithInitializerDefaults_structField_get(cHandle))
        setTypeField = moveFromCType(smoke_StructWithInitializerDefaults_setTypeField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithInitializerDefaults {
    return StructWithInitializerDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithInitializerDefaults {
    defer {
        smoke_StructWithInitializerDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructWithInitializerDefaults) -> RefHolder {
    let c_intsField = moveToCType(swiftType.intsField)
    let c_floatsField = moveToCType(swiftType.floatsField)
    let c_structField = moveToCType(swiftType.structField)
    let c_setTypeField = moveToCType(swiftType.setTypeField)
    return RefHolder(smoke_StructWithInitializerDefaults_create_handle(c_intsField.ref, c_floatsField.ref, c_structField.ref, c_setTypeField.ref))
}
internal func moveToCType(_ swiftType: StructWithInitializerDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithInitializerDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithInitializerDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructWithInitializerDefaults_unwrap_optional_handle(handle)
    return StructWithInitializerDefaults(cHandle: unwrappedHandle) as StructWithInitializerDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithInitializerDefaults? {
    defer {
        smoke_StructWithInitializerDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructWithInitializerDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_intsField = moveToCType(swiftType.intsField)
    let c_floatsField = moveToCType(swiftType.floatsField)
    let c_structField = moveToCType(swiftType.structField)
    let c_setTypeField = moveToCType(swiftType.setTypeField)
    return RefHolder(smoke_StructWithInitializerDefaults_create_optional_handle(c_intsField.ref, c_floatsField.ref, c_structField.ref, c_setTypeField.ref))
}
internal func moveToCType(_ swiftType: StructWithInitializerDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithInitializerDefaults_release_optional_handle)
}
