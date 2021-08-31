//
//
import Foundation
public struct ImmutableStructNoClash {
    public let stringField: String
    public let intField: Int32
    public let boolField: Bool
    public init() {
        self.stringField = "nonsense"
        self.intField = 42
        self.boolField = true
    }
    public init(stringField: String = "nonsense", intField: Int32 = 42, boolField: Bool = true) {
        self.stringField = stringField
        self.intField = intField
        self.boolField = boolField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_ImmutableStructNoClash_stringField_get(cHandle))
        intField = moveFromCType(smoke_ImmutableStructNoClash_intField_get(cHandle))
        boolField = moveFromCType(smoke_ImmutableStructNoClash_boolField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ImmutableStructNoClash {
    return ImmutableStructNoClash(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ImmutableStructNoClash {
    defer {
        smoke_ImmutableStructNoClash_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ImmutableStructNoClash) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_ImmutableStructNoClash_create_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: ImmutableStructNoClash) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ImmutableStructNoClash_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ImmutableStructNoClash? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ImmutableStructNoClash_unwrap_optional_handle(handle)
    return ImmutableStructNoClash(cHandle: unwrappedHandle) as ImmutableStructNoClash
}
internal func moveFromCType(_ handle: _baseRef) -> ImmutableStructNoClash? {
    defer {
        smoke_ImmutableStructNoClash_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ImmutableStructNoClash?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_ImmutableStructNoClash_create_optional_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: ImmutableStructNoClash?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ImmutableStructNoClash_release_optional_handle)
}
