//
//
import Foundation
public struct ImmutableStructWithClash {
    public let stringField: String
    public let intField: Int32
    public let boolField: Bool
    public init() {
        self.stringField = "nonsense"
        self.intField = 42
        self.boolField = true
    }
    public init(boolField: Bool, intField: Int32, stringField: String) {
        self.boolField = boolField
        self.intField = intField
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_ImmutableStructWithClash_stringField_get(cHandle))
        intField = moveFromCType(smoke_ImmutableStructWithClash_intField_get(cHandle))
        boolField = moveFromCType(smoke_ImmutableStructWithClash_boolField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ImmutableStructWithClash {
    return ImmutableStructWithClash(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ImmutableStructWithClash {
    defer {
        smoke_ImmutableStructWithClash_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ImmutableStructWithClash) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_ImmutableStructWithClash_create_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: ImmutableStructWithClash) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ImmutableStructWithClash_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ImmutableStructWithClash? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ImmutableStructWithClash_unwrap_optional_handle(handle)
    return ImmutableStructWithClash(cHandle: unwrappedHandle) as ImmutableStructWithClash
}
internal func moveFromCType(_ handle: _baseRef) -> ImmutableStructWithClash? {
    defer {
        smoke_ImmutableStructWithClash_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ImmutableStructWithClash?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_ImmutableStructWithClash_create_optional_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: ImmutableStructWithClash?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ImmutableStructWithClash_release_optional_handle)
}
