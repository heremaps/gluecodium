//
//
import Foundation
public struct UseEnumOptionSet {
    public var setField: EnumOptionSet
    public var setFieldEmpty: EnumOptionSet
    public var setFieldValue: EnumOptionSet
    public init(setField: EnumOptionSet, setFieldEmpty: EnumOptionSet = [], setFieldValue: EnumOptionSet = [EnumOptionSet.one, EnumOptionSet.three]) {
        self.setField = setField
        self.setFieldEmpty = setFieldEmpty
        self.setFieldValue = setFieldValue
    }
    internal init(cHandle: _baseRef) {
        setField = foobar_moveFromCType(smoke_UseEnumOptionSet_setField_get(cHandle))
        setFieldEmpty = foobar_moveFromCType(smoke_UseEnumOptionSet_setFieldEmpty_get(cHandle))
        setFieldValue = foobar_moveFromCType(smoke_UseEnumOptionSet_setFieldValue_get(cHandle))
    }
    public static func roundTrip(input: EnumOptionSet) -> EnumOptionSet {
        let c_input = foobar_moveToCType(input)
        let c_result_handle = smoke_UseEnumOptionSet_roundTrip(c_input.ref)
        return foobar_moveFromCType(c_result_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> UseEnumOptionSet {
    return UseEnumOptionSet(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> UseEnumOptionSet {
    defer {
        smoke_UseEnumOptionSet_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: UseEnumOptionSet) -> RefHolder {
    let c_setField = foobar_moveToCType(swiftType.setField)
    let c_setFieldEmpty = foobar_moveToCType(swiftType.setFieldEmpty)
    let c_setFieldValue = foobar_moveToCType(swiftType.setFieldValue)
    return RefHolder(smoke_UseEnumOptionSet_create_handle(c_setField.ref, c_setFieldEmpty.ref, c_setFieldValue.ref))
}
internal func moveToCType(_ swiftType: UseEnumOptionSet) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_UseEnumOptionSet_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> UseEnumOptionSet? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_UseEnumOptionSet_unwrap_optional_handle(handle)
    return UseEnumOptionSet(cHandle: unwrappedHandle) as UseEnumOptionSet
}
internal func moveFromCType(_ handle: _baseRef) -> UseEnumOptionSet? {
    defer {
        smoke_UseEnumOptionSet_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: UseEnumOptionSet?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_setField = foobar_moveToCType(swiftType.setField)
    let c_setFieldEmpty = foobar_moveToCType(swiftType.setFieldEmpty)
    let c_setFieldValue = foobar_moveToCType(swiftType.setFieldValue)
    return RefHolder(smoke_UseEnumOptionSet_create_optional_handle(c_setField.ref, c_setFieldEmpty.ref, c_setFieldValue.ref))
}
internal func moveToCType(_ swiftType: UseEnumOptionSet?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_UseEnumOptionSet_release_optional_handle)
}
