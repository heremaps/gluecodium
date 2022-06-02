//
//
import Foundation
import FooKit1
import FooKit2
import FooKit3
import FooKit4
public struct EnumCollectionDefaultsExternal {
    public var listField: [ExternalEnum1]
    public var setField: Set<ExternalEnum2>
    public var mapField: [ExternalEnum3: ExternalEnum4]
    public init(listField: [ExternalEnum1] = [ExternalEnum1.disabled], setField: Set<ExternalEnum2> = [ExternalEnum2.disabled], mapField: [ExternalEnum3: ExternalEnum4] = [ExternalEnum3.disabled: ExternalEnum4.disabled]) {
        self.listField = listField
        self.setField = setField
        self.mapField = mapField
    }
    internal init(cHandle: _baseRef) {
        listField = moveFromCType(smoke_EnumCollectionDefaultsExternal_listField_get(cHandle))
        setField = moveFromCType(smoke_EnumCollectionDefaultsExternal_setField_get(cHandle))
        mapField = moveFromCType(smoke_EnumCollectionDefaultsExternal_mapField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> EnumCollectionDefaultsExternal {
    return EnumCollectionDefaultsExternal(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EnumCollectionDefaultsExternal {
    defer {
        smoke_EnumCollectionDefaultsExternal_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumCollectionDefaultsExternal) -> RefHolder {
    let c_listField = moveToCType(swiftType.listField)
    let c_setField = moveToCType(swiftType.setField)
    let c_mapField = moveToCType(swiftType.mapField)
    return RefHolder(smoke_EnumCollectionDefaultsExternal_create_handle(c_listField.ref, c_setField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: EnumCollectionDefaultsExternal) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumCollectionDefaultsExternal_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumCollectionDefaultsExternal? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EnumCollectionDefaultsExternal_unwrap_optional_handle(handle)
    return EnumCollectionDefaultsExternal(cHandle: unwrappedHandle) as EnumCollectionDefaultsExternal
}
internal func moveFromCType(_ handle: _baseRef) -> EnumCollectionDefaultsExternal? {
    defer {
        smoke_EnumCollectionDefaultsExternal_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumCollectionDefaultsExternal?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_listField = moveToCType(swiftType.listField)
    let c_setField = moveToCType(swiftType.setField)
    let c_mapField = moveToCType(swiftType.mapField)
    return RefHolder(smoke_EnumCollectionDefaultsExternal_create_optional_handle(c_listField.ref, c_setField.ref, c_mapField.ref))
}
internal func moveToCType(_ swiftType: EnumCollectionDefaultsExternal?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumCollectionDefaultsExternal_release_optional_handle)
}
