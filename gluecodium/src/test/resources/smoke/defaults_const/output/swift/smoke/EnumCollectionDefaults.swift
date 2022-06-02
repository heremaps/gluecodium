//
//
import Foundation
public struct EnumCollectionDefaults {
    public var listField: [Enum1]
    public var setField: Set<Enum2>
    public var mapField: [Enum3: Enum4]
    public init(listField: [Enum1] = [Enum1.disabled], setField: Set<Enum2> = [Enum2.disabled], mapField: [Enum3: Enum4] = [Enum3.disabled: Enum4.disabled]) {
        self.listField = listField
        self.setField = setField
        self.mapField = mapField
    }
    internal init(cHandle: _baseRef) {
        listField = moveFromCType(smoke_EnumCollectionDefaults_listField_get(cHandle))
        setField = moveFromCType(smoke_EnumCollectionDefaults_setField_get(cHandle))
        mapField = moveFromCType(smoke_EnumCollectionDefaults_mapField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> EnumCollectionDefaults {
    return EnumCollectionDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EnumCollectionDefaults {
    defer {
        smoke_EnumCollectionDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumCollectionDefaults) -> RefHolder {
    let c_listField = moveToCType(swiftType.listField)
    let c_setField = moveToCType(swiftType.setField)
    let c_mapField = moveToCType(swiftType.mapField)
    return RefHolder(smoke_EnumCollectionDefaults_create_handle(c_listField.ref, c_setField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: EnumCollectionDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumCollectionDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumCollectionDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EnumCollectionDefaults_unwrap_optional_handle(handle)
    return EnumCollectionDefaults(cHandle: unwrappedHandle) as EnumCollectionDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> EnumCollectionDefaults? {
    defer {
        smoke_EnumCollectionDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumCollectionDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_listField = moveToCType(swiftType.listField)
    let c_setField = moveToCType(swiftType.setField)
    let c_mapField = moveToCType(swiftType.mapField)
    return RefHolder(smoke_EnumCollectionDefaults_create_optional_handle(c_listField.ref, c_setField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: EnumCollectionDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumCollectionDefaults_release_optional_handle)
}
