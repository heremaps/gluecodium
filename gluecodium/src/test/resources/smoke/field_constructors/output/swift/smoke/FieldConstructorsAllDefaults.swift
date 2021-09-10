//
//
import Foundation
public struct FieldConstructorsAllDefaults {
    public var stringField: String
    public var intField: Int32
    public var boolField: Bool
    public init() {
        self.stringField = "nonsense"
        self.intField = 42
        self.boolField = true
    }
    public init(intField: Int32) {
        self.intField = intField
        self.stringField = "nonsense"
        self.boolField = true
    }
    public init(intField: Int32, stringField: String) {
        self.intField = intField
        self.stringField = stringField
        self.boolField = true
    }
    public init(boolField: Bool, intField: Int32, stringField: String) {
        self.boolField = boolField
        self.intField = intField
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_FieldConstructorsAllDefaults_stringField_get(cHandle))
        intField = moveFromCType(smoke_FieldConstructorsAllDefaults_intField_get(cHandle))
        boolField = moveFromCType(smoke_FieldConstructorsAllDefaults_boolField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorsAllDefaults {
    return FieldConstructorsAllDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorsAllDefaults {
    defer {
        smoke_FieldConstructorsAllDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorsAllDefaults) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_FieldConstructorsAllDefaults_create_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorsAllDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorsAllDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorsAllDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorsAllDefaults_unwrap_optional_handle(handle)
    return FieldConstructorsAllDefaults(cHandle: unwrappedHandle) as FieldConstructorsAllDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorsAllDefaults? {
    defer {
        smoke_FieldConstructorsAllDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorsAllDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_FieldConstructorsAllDefaults_create_optional_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorsAllDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorsAllDefaults_release_optional_handle)
}
