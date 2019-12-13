//
//
import Foundation
internal func copyFromCType(_ handle: _baseRef) -> [DummyClass] {
    var result: [DummyClass] = []
    let count = ArrayOf_smoke_DummyClass_count(handle)
    for idx in 0..<count {
        result.append(DummyClass_copyFromCType(ArrayOf_smoke_DummyClass_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [DummyClass] {
    defer {
        ArrayOf_smoke_DummyClass_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [DummyClass]) -> RefHolder {
    let handle = ArrayOf_smoke_DummyClass_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_smoke_DummyClass_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [DummyClass]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_smoke_DummyClass_release_handle)
}
internal func copyToCType(_ swiftArray: [DummyClass]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_smoke_DummyClass_create_optional_handle()
    let handle = ArrayOf_smoke_DummyClass_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_smoke_DummyClass_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [DummyClass]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_smoke_DummyClass_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [DummyClass]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_smoke_DummyClass_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [DummyClass]
}
internal func moveFromCType(_ handle: _baseRef) -> [DummyClass]? {
    defer {
        ArrayOf_smoke_DummyClass_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [DummyInterface] {
    var result: [DummyInterface] = []
    let count = ArrayOf_smoke_DummyInterface_count(handle)
    for idx in 0..<count {
        result.append(DummyInterface_copyFromCType(ArrayOf_smoke_DummyInterface_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [DummyInterface] {
    defer {
        ArrayOf_smoke_DummyInterface_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [DummyInterface]) -> RefHolder {
    let handle = ArrayOf_smoke_DummyInterface_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_smoke_DummyInterface_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [DummyInterface]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_smoke_DummyInterface_release_handle)
}
internal func copyToCType(_ swiftArray: [DummyInterface]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_smoke_DummyInterface_create_optional_handle()
    let handle = ArrayOf_smoke_DummyInterface_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_smoke_DummyInterface_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [DummyInterface]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_smoke_DummyInterface_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [DummyInterface]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_smoke_DummyInterface_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [DummyInterface]
}
internal func moveFromCType(_ handle: _baseRef) -> [DummyInterface]? {
    defer {
        ArrayOf_smoke_DummyInterface_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Float] {
    var result: [Float] = []
    let count = ArrayOf__Float_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf__Float_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Float] {
    defer {
        ArrayOf__Float_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Float]) -> RefHolder {
    let handle = ArrayOf__Float_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf__Float_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Float]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf__Float_release_handle)
}
internal func copyToCType(_ swiftArray: [Float]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf__Float_create_optional_handle()
    let handle = ArrayOf__Float_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf__Float_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Float]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf__Float_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Float]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf__Float_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Float]
}
internal func moveFromCType(_ handle: _baseRef) -> [Float]? {
    defer {
        ArrayOf__Float_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.BasicStruct] {
    var result: [GenericTypesWithCompoundTypes.BasicStruct] = []
    let count = ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.BasicStruct] {
    defer {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.BasicStruct]) -> RefHolder {
    let handle = ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [GenericTypesWithCompoundTypes.BasicStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle)
}
internal func copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.BasicStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_optional_handle()
    let handle = ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.BasicStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.BasicStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.BasicStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.BasicStruct]? {
    defer {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum] {
    var result: [GenericTypesWithCompoundTypes.ExternalEnum] = []
    let count = ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum] {
    defer {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalEnum]) -> RefHolder {
    let handle = ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle)
}
internal func copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalEnum]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_optional_handle()
    let handle = ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.ExternalEnum]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.ExternalEnum]
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalEnum]? {
    defer {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalStruct] {
    var result: [GenericTypesWithCompoundTypes.ExternalStruct] = []
    let count = ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalStruct] {
    defer {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalStruct]) -> RefHolder {
    let handle = ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalStruct]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle)
}
internal func copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.ExternalStruct]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_optional_handle()
    let handle = ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.ExternalStruct]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalStruct]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.ExternalStruct]
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.ExternalStruct]? {
    defer {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum] {
    var result: [GenericTypesWithCompoundTypes.SomeEnum] = []
    let count = ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum] {
    defer {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.SomeEnum]) -> RefHolder {
    let handle = ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [GenericTypesWithCompoundTypes.SomeEnum]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle)
}
internal func copyToCType(_ swiftArray: [GenericTypesWithCompoundTypes.SomeEnum]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_optional_handle()
    let handle = ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [GenericTypesWithCompoundTypes.SomeEnum]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [GenericTypesWithCompoundTypes.SomeEnum]
}
internal func moveFromCType(_ handle: _baseRef) -> [GenericTypesWithCompoundTypes.SomeEnum]? {
    defer {
        ArrayOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32] {
    var result: [Int32] = []
    let count = ArrayOf__Int_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf__Int_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32] {
    defer {
        ArrayOf__Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Int32]) -> RefHolder {
    let handle = ArrayOf__Int_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf__Int_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Int32]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf__Int_release_handle)
}
internal func copyToCType(_ swiftArray: [Int32]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf__Int_create_optional_handle()
    let handle = ArrayOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf__Int_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Int32]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf__Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Int32]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf__Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Int32]
}
internal func moveFromCType(_ handle: _baseRef) -> [Int32]? {
    defer {
        ArrayOf__Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String] {
    var result: [String] = []
    let count = ArrayOf__String_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf__String_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [String] {
    defer {
        ArrayOf__String_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [String]) -> RefHolder {
    let handle = ArrayOf__String_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf__String_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [String]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf__String_release_handle)
}
internal func copyToCType(_ swiftArray: [String]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf__String_create_optional_handle()
    let handle = ArrayOf__String_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf__String_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [String]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf__String_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [String]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf__String_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [String]
}
internal func moveFromCType(_ handle: _baseRef) -> [String]? {
    defer {
        ArrayOf__String_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8] {
    var result: [UInt8] = []
    let count = ArrayOf__UByte_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf__UByte_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8] {
    defer {
        ArrayOf__UByte_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [UInt8]) -> RefHolder {
    let handle = ArrayOf__UByte_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf__UByte_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [UInt8]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf__UByte_release_handle)
}
internal func copyToCType(_ swiftArray: [UInt8]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf__UByte_create_optional_handle()
    let handle = ArrayOf__UByte_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf__UByte_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [UInt8]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf__UByte_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [UInt8]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf__UByte_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [UInt8]
}
internal func moveFromCType(_ handle: _baseRef) -> [UInt8]? {
    defer {
        ArrayOf__UByte_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32: Bool]] {
    var result: [[Int32: Bool]] = []
    let count = ArrayOf_MapOf__Int_To__Boolean_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_MapOf__Int_To__Boolean_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32: Bool]] {
    defer {
        ArrayOf_MapOf__Int_To__Boolean_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [[Int32: Bool]]) -> RefHolder {
    let handle = ArrayOf_MapOf__Int_To__Boolean_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_MapOf__Int_To__Boolean_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [[Int32: Bool]]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_MapOf__Int_To__Boolean_release_handle)
}
internal func copyToCType(_ swiftArray: [[Int32: Bool]]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_MapOf__Int_To__Boolean_create_optional_handle()
    let handle = ArrayOf_MapOf__Int_To__Boolean_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_MapOf__Int_To__Boolean_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [[Int32: Bool]]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_MapOf__Int_To__Boolean_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32: Bool]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_MapOf__Int_To__Boolean_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [[Int32: Bool]]
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32: Bool]]? {
    defer {
        ArrayOf_MapOf__Int_To__Boolean_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Set<Int32>] {
    var result: [Set<Int32>] = []
    let count = ArrayOf_SetOf__Int_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_SetOf__Int_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [Set<Int32>] {
    defer {
        ArrayOf_SetOf__Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [Set<Int32>]) -> RefHolder {
    let handle = ArrayOf_SetOf__Int_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_SetOf__Int_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [Set<Int32>]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_SetOf__Int_release_handle)
}
internal func copyToCType(_ swiftArray: [Set<Int32>]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_SetOf__Int_create_optional_handle()
    let handle = ArrayOf_SetOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_SetOf__Int_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [Set<Int32>]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_SetOf__Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [Set<Int32>]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_SetOf__Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [Set<Int32>]
}
internal func moveFromCType(_ handle: _baseRef) -> [Set<Int32>]? {
    defer {
        ArrayOf_SetOf__Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32]] {
    var result: [[Int32]] = []
    let count = ArrayOf_ArrayOf__Int_count(handle)
    for idx in 0..<count {
        result.append(copyFromCType(ArrayOf_ArrayOf__Int_get(handle, idx)))
    }
    return result
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32]] {
    defer {
        ArrayOf_ArrayOf__Int_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftArray: [[Int32]]) -> RefHolder {
    let handle = ArrayOf_ArrayOf__Int_create_handle()
    for item in swiftArray {
        let value = moveToCType(item)
        ArrayOf_ArrayOf__Int_append(handle, value.ref)
    }
    return RefHolder(handle)
}
internal func moveToCType(_ swiftArray: [[Int32]]) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftArray).ref, release: ArrayOf_ArrayOf__Int_release_handle)
}
internal func copyToCType(_ swiftArray: [[Int32]]?) -> RefHolder {
    guard let swiftArray = swiftArray else {
        return RefHolder(0)
    }
    let optionalHandle = ArrayOf_ArrayOf__Int_create_optional_handle()
    let handle = ArrayOf_ArrayOf__Int_unwrap_optional_handle(optionalHandle)
    for item in swiftArray {
        ArrayOf_ArrayOf__Int_append(handle, moveToCType(item).ref)
    }
    return RefHolder(optionalHandle)
}
internal func moveToCType(_ swiftType: [[Int32]]?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: ArrayOf_ArrayOf__Int_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> [[Int32]]? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = ArrayOf_ArrayOf__Int_unwrap_optional_handle(handle)
    return copyFromCType(unwrappedHandle) as [[Int32]]
}
internal func moveFromCType(_ handle: _baseRef) -> [[Int32]]? {
    defer {
        ArrayOf_ArrayOf__Int_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}