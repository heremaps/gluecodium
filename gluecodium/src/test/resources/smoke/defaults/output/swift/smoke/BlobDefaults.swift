//
//
import Foundation
public struct BlobDefaults {
    public var emptyList: Data
    public var deadBeef: Data
    public init(emptyList: Data = Data([]), deadBeef: Data = Data([222, 173, 190, 239])) {
        self.emptyList = emptyList
        self.deadBeef = deadBeef
    }
    internal init(cHandle: _baseRef) {
        emptyList = moveFromCType(smoke_BlobDefaults_emptyList_get(cHandle))
        deadBeef = moveFromCType(smoke_BlobDefaults_deadBeef_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> BlobDefaults {
    return BlobDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> BlobDefaults {
    defer {
        smoke_BlobDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: BlobDefaults) -> RefHolder {
    let c_emptyList = moveToCType(swiftType.emptyList)
    let c_deadBeef = moveToCType(swiftType.deadBeef)
    return RefHolder(smoke_BlobDefaults_create_handle(c_emptyList.ref, c_deadBeef.ref))
}
internal func moveToCType(_ swiftType: BlobDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_BlobDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> BlobDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_BlobDefaults_unwrap_optional_handle(handle)
    return BlobDefaults(cHandle: unwrappedHandle) as BlobDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> BlobDefaults? {
    defer {
        smoke_BlobDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: BlobDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_emptyList = moveToCType(swiftType.emptyList)
    let c_deadBeef = moveToCType(swiftType.deadBeef)
    return RefHolder(smoke_BlobDefaults_create_optional_handle(c_emptyList.ref, c_deadBeef.ref))
}
internal func moveToCType(_ swiftType: BlobDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_BlobDefaults_release_optional_handle)
}
