//
//
import Foundation
public struct FieldConstructorsParameterDefaults {
    public var stringField: String
    public var intField: Int32
    public var boolField: Bool
    public init(intField: Int32) {
        self.intField = intField
        self.stringField = "nonsense"
        self.boolField = true
    }
    public init(intField: Int32, boolField: Bool = true) {
        self.intField = intField
        self.boolField = boolField
        self.stringField = "nonsense"
    }
    public init(stringField: String = "nonsense", intField: Int32, boolField: Bool = true) {
        self.stringField = stringField
        self.intField = intField
        self.boolField = boolField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_FieldConstructorsParameterDefaults_stringField_get(cHandle))
        intField = moveFromCType(smoke_FieldConstructorsParameterDefaults_intField_get(cHandle))
        boolField = moveFromCType(smoke_FieldConstructorsParameterDefaults_boolField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorsParameterDefaults {
    return FieldConstructorsParameterDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorsParameterDefaults {
    defer {
        smoke_FieldConstructorsParameterDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorsParameterDefaults) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_FieldConstructorsParameterDefaults_create_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorsParameterDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorsParameterDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorsParameterDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorsParameterDefaults_unwrap_optional_handle(handle)
    return FieldConstructorsParameterDefaults(cHandle: unwrappedHandle) as FieldConstructorsParameterDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorsParameterDefaults? {
    defer {
        smoke_FieldConstructorsParameterDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorsParameterDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_FieldConstructorsParameterDefaults_create_optional_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorsParameterDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorsParameterDefaults_release_optional_handle)
}
