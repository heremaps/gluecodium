//
//
import Foundation
public struct ConstantDefaults {
    public var field1: SomeStruct
    public var field2: SomeStruct
    public init(field1: SomeStruct = StructConstants.dummy, field2: SomeStruct = StructConstants.dummy4) {
        self.field1 = field1
        self.field2 = field2
    }
    internal init(cHandle: _baseRef) {
        field1 = moveFromCType(smoke_ConstantDefaults_field1_get(cHandle))
        field2 = moveFromCType(smoke_ConstantDefaults_field2_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ConstantDefaults {
    return ConstantDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ConstantDefaults {
    defer {
        smoke_ConstantDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ConstantDefaults) -> RefHolder {
    let c_field1 = moveToCType(swiftType.field1)
    let c_field2 = moveToCType(swiftType.field2)
    return RefHolder(smoke_ConstantDefaults_create_handle(c_field1.ref, c_field2.ref))
}
internal func moveToCType(_ swiftType: ConstantDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ConstantDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ConstantDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ConstantDefaults_unwrap_optional_handle(handle)
    return ConstantDefaults(cHandle: unwrappedHandle) as ConstantDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> ConstantDefaults? {
    defer {
        smoke_ConstantDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ConstantDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field1 = moveToCType(swiftType.field1)
    let c_field2 = moveToCType(swiftType.field2)
    return RefHolder(smoke_ConstantDefaults_create_optional_handle(c_field1.ref, c_field2.ref))
}
internal func moveToCType(_ swiftType: ConstantDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ConstantDefaults_release_optional_handle)
}
