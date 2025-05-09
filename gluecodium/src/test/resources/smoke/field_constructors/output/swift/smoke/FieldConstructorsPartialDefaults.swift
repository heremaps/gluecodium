//

//

import Foundation

public struct FieldConstructorsPartialDefaults {

    public var stringField: String

    public var intField: Int32

    public var boolField: Bool
    /// This is some field constructor with two parameters.
    /// It is very important.
    /// - Parameters
    ///   - intField: 
    ///   - stringField: 


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
        stringField = moveFromCType(smoke_FieldConstructorsPartialDefaults_stringField_get(cHandle))
        intField = moveFromCType(smoke_FieldConstructorsPartialDefaults_intField_get(cHandle))
        boolField = moveFromCType(smoke_FieldConstructorsPartialDefaults_boolField_get(cHandle))
    }
}



internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorsPartialDefaults {
    return FieldConstructorsPartialDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorsPartialDefaults {
    defer {
        smoke_FieldConstructorsPartialDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: FieldConstructorsPartialDefaults) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_FieldConstructorsPartialDefaults_create_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorsPartialDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorsPartialDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> FieldConstructorsPartialDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FieldConstructorsPartialDefaults_unwrap_optional_handle(handle)
    return FieldConstructorsPartialDefaults(cHandle: unwrappedHandle) as FieldConstructorsPartialDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> FieldConstructorsPartialDefaults? {
    defer {
        smoke_FieldConstructorsPartialDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: FieldConstructorsPartialDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_FieldConstructorsPartialDefaults_create_optional_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: FieldConstructorsPartialDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_FieldConstructorsPartialDefaults_release_optional_handle)
}



