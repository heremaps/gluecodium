//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: EquatableInterface?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_EquatableInterface_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_EquatableInterface_release_handle)
        : RefHolder(handle_copy)
}
public class EquatableInterface {
    let c_instance : _baseRef
    init(cEquatableInterface: _baseRef) {
        guard cEquatableInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEquatableInterface
    }
    deinit {
        smoke_EquatableInterface_release_handle(c_instance)
    }
    public struct EquatableStruct: Equatable {
        public var intField: Int32
        public var stringField: String
        public init(intField: Int32, stringField: String) {
            self.intField = intField
            self.stringField = stringField
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_EquatableInterface_EquatableStruct_intField_get(cHandle))
            stringField = moveFromCType(smoke_EquatableInterface_EquatableStruct_stringField_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_intField = moveToCType(intField)
            let c_stringField = moveToCType(stringField)
            return smoke_EquatableInterface_EquatableStruct_create_handle(c_intField.ref, c_stringField.ref)
        }
    }
}
extension EquatableInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func EquatableInterfacecopyFromCType(_ handle: _baseRef) -> EquatableInterface {
    return EquatableInterface(cEquatableInterface: smoke_EquatableInterface_copy_handle(handle))
}
internal func EquatableInterfacemoveFromCType(_ handle: _baseRef) -> EquatableInterface {
    return EquatableInterface(cEquatableInterface: handle)
}
internal func EquatableInterfacecopyFromCType(_ handle: _baseRef) -> EquatableInterface? {
    guard handle != 0 else {
        return nil
    }
    return EquatableInterfacemoveFromCType(handle) as EquatableInterface
}
internal func EquatableInterfacemoveFromCType(_ handle: _baseRef) -> EquatableInterface? {
    guard handle != 0 else {
        return nil
    }
    return EquatableInterfacemoveFromCType(handle) as EquatableInterface
}
internal func copyToCType(_ swiftClass: EquatableInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EquatableInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: EquatableInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EquatableInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> EquatableInterface.EquatableStruct {
    return EquatableInterface.EquatableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableInterface.EquatableStruct {
    defer {
        smoke_EquatableInterface_EquatableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EquatableInterface.EquatableStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: EquatableInterface.EquatableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EquatableInterface_EquatableStruct_release_handle)
}