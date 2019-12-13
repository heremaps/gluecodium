//
//
import Foundation
public struct StructWithInterface {
    public var interfaceInstance: SimpleInterface
    public init(interfaceInstance: SimpleInterface) {
        self.interfaceInstance = interfaceInstance
    }
    internal init(cHandle: _baseRef) {
        interfaceInstance = SimpleInterface_moveFromCType(smoke_StructWithInterface_interfaceInstance_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithInterface {
    return StructWithInterface(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithInterface {
    defer {
        smoke_StructWithInterface_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructWithInterface) -> RefHolder {
    let c_interfaceInstance = moveToCType(swiftType.interfaceInstance)
    return RefHolder(smoke_StructWithInterface_create_handle(c_interfaceInstance.ref))
}
internal func moveToCType(_ swiftType: StructWithInterface) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithInterface_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithInterface? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructWithInterface_unwrap_optional_handle(handle)
    return StructWithInterface(cHandle: unwrappedHandle) as StructWithInterface
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithInterface? {
    defer {
        smoke_StructWithInterface_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructWithInterface?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_interfaceInstance = moveToCType(swiftType.interfaceInstance)
    return RefHolder(smoke_StructWithInterface_create_optional_handle(c_interfaceInstance.ref))
}
internal func moveToCType(_ swiftType: StructWithInterface?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithInterface_release_optional_handle)
}
