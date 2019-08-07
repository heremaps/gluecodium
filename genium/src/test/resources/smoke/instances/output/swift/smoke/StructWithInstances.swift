//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public struct StructWithInstances {
    public var classInstance: SimpleClass
    public var interfaceInstance: SimpleInterface
    public init(classInstance: SimpleClass, interfaceInstance: SimpleInterface) {
        self.classInstance = classInstance
        self.interfaceInstance = interfaceInstance
    }
    internal init(cHandle: _baseRef) {
        classInstance = SimpleClassmoveFromCType(smoke_StructWithInstances_StructWithInstances_classInstance_get(cHandle))
        interfaceInstance = SimpleInterfacemoveFromCType(smoke_StructWithInstances_StructWithInstances_interfaceInstance_get(cHandle))
    }
    public func useSimpleClass(input: SimpleClass) -> SimpleClass {
        let c_self_handle = moveToCType(self)
        let c_input = moveToCType(input)
        return SimpleClassmoveFromCType(smoke_StructWithInstances_StructWithInstances_useSimpleClass(c_self_handle.ref, c_input.ref))
    }
    public func useSimpleInterface(input: SimpleInterface) -> SimpleInterface {
        let c_self_handle = moveToCType(self)
        let c_input = moveToCType(input)
        return SimpleInterfacemoveFromCType(smoke_StructWithInstances_StructWithInstances_useSimpleInterface(c_self_handle.ref, c_input.ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithInstances {
    return StructWithInstances(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithInstances {
    defer {
        smoke_StructWithInstances_StructWithInstances_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructWithInstances) -> RefHolder {
    let c_classInstance = moveToCType(swiftType.classInstance)
    let c_interfaceInstance = moveToCType(swiftType.interfaceInstance)
    return RefHolder(smoke_StructWithInstances_StructWithInstances_create_handle(c_classInstance.ref, c_interfaceInstance.ref))
}
internal func moveToCType(_ swiftType: StructWithInstances) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithInstances_StructWithInstances_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructWithInstances? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructWithInstances_StructWithInstances_unwrap_optional_handle(handle)
    return StructWithInstances(cHandle: unwrappedHandle) as StructWithInstances
}
internal func moveFromCType(_ handle: _baseRef) -> StructWithInstances? {
    defer {
        smoke_StructWithInstances_StructWithInstances_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructWithInstances?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_classInstance = moveToCType(swiftType.classInstance)
    let c_interfaceInstance = moveToCType(swiftType.interfaceInstance)
    return RefHolder(smoke_StructWithInstances_StructWithInstances_create_optional_handle(c_classInstance.ref, c_interfaceInstance.ref))
}
internal func moveToCType(_ swiftType: StructWithInstances?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructWithInstances_StructWithInstances_release_optional_handle)
}
