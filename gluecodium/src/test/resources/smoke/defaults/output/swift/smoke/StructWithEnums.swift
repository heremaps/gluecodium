//
//
import Foundation
public struct StructWithEnums {
    public static let firstConstant: SomethingEnum = SomethingEnum.reallyFirst
    public var firstField: SomethingEnum
    public var explicitField: SomethingEnum
    public var lastField: SomethingEnum
    public init(firstField: SomethingEnum = SomethingEnum.reallyFirst, explicitField: SomethingEnum = SomethingEnum.explicit, lastField: SomethingEnum = SomethingEnum.last) {
        self.firstField = firstField
        self.explicitField = explicitField
        self.lastField = lastField
    }
    internal init(cHandle: _baseRef) {
        firstField = moveFromCType(smoke_StructWithEnums_firstField_get(cHandle))
        explicitField = moveFromCType(smoke_StructWithEnums_explicitField_get(cHandle))
        lastField = moveFromCType(smoke_StructWithEnums_lastField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithEnums {
    return StructWithEnums(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithEnums {
    defer {
        smoke_StructWithEnums_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructWithEnums) -> RefHolder {
    let c_firstField = moveToCType(swiftType.firstField)
    let c_explicitField = moveToCType(swiftType.explicitField)
    let c_lastField = moveToCType(swiftType.lastField)
    return RefHolder(smoke_StructWithEnums_create_handle(c_firstField.ref, c_explicitField.ref, c_lastField.ref))
}
internal func moveToCType(_ swiftType: StructWithEnums) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithEnums_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithEnums? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructWithEnums_unwrap_optional_handle(handle)
    return StructWithEnums(cHandle: unwrappedHandle) as StructWithEnums
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithEnums? {
    defer {
        smoke_StructWithEnums_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructWithEnums?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_firstField = moveToCType(swiftType.firstField)
    let c_explicitField = moveToCType(swiftType.explicitField)
    let c_lastField = moveToCType(swiftType.lastField)
    return RefHolder(smoke_StructWithEnums_create_optional_handle(c_firstField.ref, c_explicitField.ref, c_lastField.ref))
}
internal func moveToCType(_ swiftType: StructWithEnums?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithEnums_release_optional_handle)
}
