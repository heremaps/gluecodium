//
//
import Foundation
public struct StructWithInitializerDefaults {
    public var intsField: [Int32]
    public var floatsField: DefaultValues.FloatArray
    public var setTypeField: DefaultValues.StringSet
    public var mapField: DefaultValues.IdToStringMap
    public init(intsField: [Int32] = [4, -2, 42], floatsField: DefaultValues.FloatArray = [3.14, -Float.infinity], setTypeField: DefaultValues.StringSet = ["foo", "bar"], mapField: DefaultValues.IdToStringMap = [1: "foo", 42: "bar"]) {
        self.intsField = intsField
        self.floatsField = floatsField
        self.setTypeField = setTypeField
        self.mapField = mapField
    }
    internal init(cHandle: _baseRef) {
        intsField = foobar_moveFromCType(smoke_StructWithInitializerDefaults_intsField_get(cHandle))
        floatsField = foobar_moveFromCType(smoke_StructWithInitializerDefaults_floatsField_get(cHandle))
        setTypeField = foobar_moveFromCType(smoke_StructWithInitializerDefaults_setTypeField_get(cHandle))
        mapField = foobar_moveFromCType(smoke_StructWithInitializerDefaults_mapField_get(cHandle))
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
    let c_intsField = foobar_moveToCType(swiftType.intsField)
    let c_floatsField = foobar_moveToCType(swiftType.floatsField)
    let c_setTypeField = foobar_moveToCType(swiftType.setTypeField)
    let c_mapField = foobar_moveToCType(swiftType.mapField)
    return RefHolder(smoke_StructWithInitializerDefaults_create_handle(c_intsField.ref, c_floatsField.ref, c_setTypeField.ref, c_mapField.ref))
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
    let c_intsField = foobar_moveToCType(swiftType.intsField)
    let c_floatsField = foobar_moveToCType(swiftType.floatsField)
    let c_setTypeField = foobar_moveToCType(swiftType.setTypeField)
    let c_mapField = foobar_moveToCType(swiftType.mapField)
    return RefHolder(smoke_StructWithInitializerDefaults_create_optional_handle(c_intsField.ref, c_floatsField.ref, c_setTypeField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: StructWithInitializerDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithInitializerDefaults_release_optional_handle)
}
