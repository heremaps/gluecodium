//
//
import Foundation
public struct StructWithDefaults {
    public var intField: Int32
    public var uintField: UInt32
    public var floatField: Float
    public var doubleField: Double
    public var boolField: Bool
    public var stringField: String
    public init(intField: Int32 = 42, uintField: UInt32 = 4294967295, floatField: Float = 3.14, doubleField: Double = -1.4142, boolField: Bool = true, stringField: String = "\\Jonny \"Magic\" Smith\n") {
        self.intField = intField
        self.uintField = uintField
        self.floatField = floatField
        self.doubleField = doubleField
        self.boolField = boolField
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        intField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_intField_get(cHandle))
        uintField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_uintField_get(cHandle))
        floatField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_floatField_get(cHandle))
        doubleField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_doubleField_get(cHandle))
        boolField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_boolField_get(cHandle))
        stringField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_stringField_get(cHandle))
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
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_TypesWithDefaults_StructWithDefaults_create_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref))
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
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_TypesWithDefaults_StructWithDefaults_create_optional_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref))
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
    public init(intField: Int32 = 42, uintField: UInt32, floatField: Float = 3.14, doubleField: Double = -1.4142, boolField: Bool, stringField: String = "\\Jonny \"Magic\" Smith\n") {
        self.intField = intField
        self.uintField = uintField
        self.floatField = floatField
        self.doubleField = doubleField
        self.boolField = boolField
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        intField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_intField_get(cHandle))
        uintField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_uintField_get(cHandle))
        floatField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_floatField_get(cHandle))
        doubleField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_doubleField_get(cHandle))
        boolField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_boolField_get(cHandle))
        stringField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_stringField_get(cHandle))
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
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref))
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
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_optional_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref))
}
internal func moveToCType(_ swiftType: ImmutableStructWithDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_optional_handle)
}
