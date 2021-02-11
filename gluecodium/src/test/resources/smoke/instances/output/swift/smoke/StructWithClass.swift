//
//
import Foundation
public struct StructWithClass {
    public var classInstance: SimpleClass
    public init(classInstance: SimpleClass) {
        self.classInstance = classInstance
    }
    internal init(cHandle: _baseRef) {
        classInstance = foobar_SimpleClass_moveFromCType(smoke_StructWithClass_classInstance_get(cHandle))
    }
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> StructWithClass {
    return StructWithClass(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> StructWithClass {
    defer {
        smoke_StructWithClass_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: StructWithClass) -> RefHolder {
    let c_classInstance = foobar_moveToCType(swiftType.classInstance)
    return RefHolder(smoke_StructWithClass_create_handle(c_classInstance.ref))
}
internal func foobar_moveToCType(_ swiftType: StructWithClass) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_StructWithClass_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> StructWithClass? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructWithClass_unwrap_optional_handle(handle)
    return StructWithClass(cHandle: unwrappedHandle) as StructWithClass
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> StructWithClass? {
    defer {
        smoke_StructWithClass_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: StructWithClass?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_classInstance = foobar_moveToCType(swiftType.classInstance)
    return RefHolder(smoke_StructWithClass_create_optional_handle(c_classInstance.ref))
}
internal func foobar_moveToCType(_ swiftType: StructWithClass?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_StructWithClass_release_optional_handle)
}
