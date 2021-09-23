//
//
import Foundation
public struct MutableStructNoClash {
    public var stringField: String
    public var intField: Int32
    public var boolField: Bool
    public init() {
        self.stringField = "nonsense"
        self.intField = 42
        self.boolField = true
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_MutableStructNoClash_stringField_get(cHandle))
        intField = moveFromCType(smoke_MutableStructNoClash_intField_get(cHandle))
        boolField = moveFromCType(smoke_MutableStructNoClash_boolField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> MutableStructNoClash {
    return MutableStructNoClash(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> MutableStructNoClash {
    defer {
        smoke_MutableStructNoClash_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: MutableStructNoClash) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_MutableStructNoClash_create_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: MutableStructNoClash) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_MutableStructNoClash_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> MutableStructNoClash? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_MutableStructNoClash_unwrap_optional_handle(handle)
    return MutableStructNoClash(cHandle: unwrappedHandle) as MutableStructNoClash
}
internal func moveFromCType(_ handle: _baseRef) -> MutableStructNoClash? {
    defer {
        smoke_MutableStructNoClash_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: MutableStructNoClash?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    let c_intField = moveToCType(swiftType.intField)
    let c_boolField = moveToCType(swiftType.boolField)
    return RefHolder(smoke_MutableStructNoClash_create_optional_handle(c_stringField.ref, c_intField.ref, c_boolField.ref))
}
internal func moveToCType(_ swiftType: MutableStructNoClash?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_MutableStructNoClash_release_optional_handle)
}
