//
//
import Foundation
public struct FieldConstructorsWithLabels {
    public var stringField: String
    public var intField: Int32
    public var boolField: Bool
    public init(value intField: Int32, _ boolField: Bool) {
        self.intField = intField
        self.boolField = boolField
        self.stringField = "nonsense"
    }
    public init(stringField: String, value intField: Int32, _ boolField: Bool) {
        self.stringField = stringField
        self.intField = intField
        self.boolField = boolField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_FieldConstructorsWithLabels_stringField_get(cHandle))
        intField = moveFromCType(smoke_FieldConstructorsWithLabels_intField_get(cHandle))
        boolField = moveFromCType(smoke_FieldConstructorsWithLabels_boolField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorsWithLabels {
    return FieldConstructorsWithLabels(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorsWithLabels {
    defer {
        smoke_FieldConstructorsWithLabels_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorsWithLabels) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_FieldConstructorsWithLabels_create_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorsWithLabels) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorsWithLabels_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorsWithLabels? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorsWithLabels_unwrap_optional_handle(handle)
    return FieldConstructorsWithLabels(cHandle: unwrappedHandle) as FieldConstructorsWithLabels
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorsWithLabels? {
    defer {
        smoke_FieldConstructorsWithLabels_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: FieldConstructorsWithLabels?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_FieldConstructorsWithLabels_create_optional_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorsWithLabels?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorsWithLabels_release_optional_handle)
}
