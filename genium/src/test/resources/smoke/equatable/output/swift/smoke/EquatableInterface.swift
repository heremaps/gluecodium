//
//
import Foundation
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
    public struct EquatableStruct: Hashable {
        public var intField: Int32
        public var stringField: String
        public var nestedEquatableInstance: EquatableInterface
        public var nestedPointerEquatableInstance: PointerEquatableInterface
        public init(intField: Int32, stringField: String, nestedEquatableInstance: EquatableInterface, nestedPointerEquatableInstance: PointerEquatableInterface) {
            self.intField = intField
            self.stringField = stringField
            self.nestedEquatableInstance = nestedEquatableInstance
            self.nestedPointerEquatableInstance = nestedPointerEquatableInstance
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_EquatableInterface_EquatableStruct_intField_get(cHandle))
            stringField = moveFromCType(smoke_EquatableInterface_EquatableStruct_stringField_get(cHandle))
            nestedEquatableInstance = EquatableInterface_moveFromCType(smoke_EquatableInterface_EquatableStruct_nestedEquatableInstance_get(cHandle))
            nestedPointerEquatableInstance = PointerEquatableInterface_moveFromCType(smoke_EquatableInterface_EquatableStruct_nestedPointerEquatableInstance_get(cHandle))
        }
    }
}
internal func getRef(_ ref: EquatableInterface?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_EquatableInterface_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_EquatableInterface_release_handle)
        : RefHolder(handle_copy)
}
extension EquatableInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension EquatableInterface: Hashable {
    public static func == (lhs: EquatableInterface, rhs: EquatableInterface) -> Bool {
        return smoke_EquatableInterface_equal(lhs.c_handle, rhs.c_handle)
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(smoke_EquatableInterface_hash(c_handle))
    }
}
internal func EquatableInterface_copyFromCType(_ handle: _baseRef) -> EquatableInterface {
    return EquatableInterface(cEquatableInterface: smoke_EquatableInterface_copy_handle(handle))
}
internal func EquatableInterface_moveFromCType(_ handle: _baseRef) -> EquatableInterface {
    return EquatableInterface(cEquatableInterface: handle)
}
internal func EquatableInterface_copyFromCType(_ handle: _baseRef) -> EquatableInterface? {
    guard handle != 0 else {
        return nil
    }
    return EquatableInterface_moveFromCType(handle) as EquatableInterface
}
internal func EquatableInterface_moveFromCType(_ handle: _baseRef) -> EquatableInterface? {
    guard handle != 0 else {
        return nil
    }
    return EquatableInterface_moveFromCType(handle) as EquatableInterface
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
    let c_intField = moveToCType(swiftType.intField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_nestedEquatableInstance = moveToCType(swiftType.nestedEquatableInstance)
    let c_nestedPointerEquatableInstance = moveToCType(swiftType.nestedPointerEquatableInstance)
    return RefHolder(smoke_EquatableInterface_EquatableStruct_create_handle(c_intField.ref, c_stringField.ref, c_nestedEquatableInstance.ref, c_nestedPointerEquatableInstance.ref))
}
internal func moveToCType(_ swiftType: EquatableInterface.EquatableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EquatableInterface_EquatableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EquatableInterface.EquatableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EquatableInterface_EquatableStruct_unwrap_optional_handle(handle)
    return EquatableInterface.EquatableStruct(cHandle: unwrappedHandle) as EquatableInterface.EquatableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableInterface.EquatableStruct? {
    defer {
        smoke_EquatableInterface_EquatableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EquatableInterface.EquatableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_intField = moveToCType(swiftType.intField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_nestedEquatableInstance = moveToCType(swiftType.nestedEquatableInstance)
    let c_nestedPointerEquatableInstance = moveToCType(swiftType.nestedPointerEquatableInstance)
    return RefHolder(smoke_EquatableInterface_EquatableStruct_create_optional_handle(c_intField.ref, c_stringField.ref, c_nestedEquatableInstance.ref, c_nestedPointerEquatableInstance.ref))
}
internal func moveToCType(_ swiftType: EquatableInterface.EquatableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EquatableInterface_EquatableStruct_release_optional_handle)
}
