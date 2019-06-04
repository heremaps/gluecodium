//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: PublicClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_PublicClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_PublicClass_release_handle)
        : RefHolder(handle_copy)
}
public class PublicClass {
    internal typealias InternalArray = [PublicClass.InternalStruct]
    internal typealias InternalStructTypeDef = PublicClass.InternalStruct
    internal typealias StringToInternalStructMap = [String: PublicClass.InternalStruct]
    internal var internalStructAttribute: PublicClass.InternalStruct {
        get {
            return moveFromCType(smoke_PublicClass_internalStructAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_PublicClass_internalStructAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public internal(set) var internalSetterAttribute: String {
        get {
            return moveFromCType(smoke_PublicClass_internalSetterAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_PublicClass_internalSetterAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cPublicClass: _baseRef) {
        guard cPublicClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cPublicClass
    }
    deinit {
        smoke_PublicClass_release_handle(c_instance)
    }
    internal enum InternalEnum : UInt32, CaseIterable {
        case foo
        case bar
    }
    internal struct InternalStruct {
        internal var stringField: String
        internal init(stringField: String) {
            self.stringField = stringField
        }
        internal init(cHandle: _baseRef) {
            stringField = moveFromCType(smoke_PublicClass_InternalStruct_stringField_get(cHandle))
        }
    }
    public struct PublicStruct {
        internal var internalField: PublicClass.InternalStruct
        public init(internalField: PublicClass.InternalStruct) {
            self.internalField = internalField
        }
        internal init(cHandle: _baseRef) {
            internalField = moveFromCType(smoke_PublicClass_PublicStruct_internalField_get(cHandle))
        }
    }
    internal func internalMethod(input: PublicClass.InternalStruct) -> PublicClass.InternalStructTypeDef {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_PublicClass_internalMethod(self.c_instance, c_input.ref))
    }
}
extension PublicClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func PublicClasscopyFromCType(_ handle: _baseRef) -> PublicClass {
    return PublicClass(cPublicClass: smoke_PublicClass_copy_handle(handle))
}
internal func PublicClassmoveFromCType(_ handle: _baseRef) -> PublicClass {
    return PublicClass(cPublicClass: handle)
}
internal func PublicClasscopyFromCType(_ handle: _baseRef) -> PublicClass? {
    guard handle != 0 else {
        return nil
    }
    return PublicClassmoveFromCType(handle) as PublicClass
}
internal func PublicClassmoveFromCType(_ handle: _baseRef) -> PublicClass? {
    guard handle != 0 else {
        return nil
    }
    return PublicClassmoveFromCType(handle) as PublicClass
}
internal func copyToCType(_ swiftClass: PublicClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PublicClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: PublicClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PublicClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> PublicClass.InternalStruct {
    return PublicClass.InternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> PublicClass.InternalStruct {
    defer {
        smoke_PublicClass_InternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicClass.InternalStruct) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_PublicClass_InternalStruct_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: PublicClass.InternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicClass_InternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PublicClass.InternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PublicClass_InternalStruct_unwrap_optional_handle(handle)
    return PublicClass.InternalStruct(cHandle: unwrappedHandle) as PublicClass.InternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> PublicClass.InternalStruct? {
    defer {
        smoke_PublicClass_InternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicClass.InternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_PublicClass_InternalStruct_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: PublicClass.InternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicClass_InternalStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PublicClass.PublicStruct {
    return PublicClass.PublicStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> PublicClass.PublicStruct {
    defer {
        smoke_PublicClass_PublicStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicClass.PublicStruct) -> RefHolder {
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_PublicClass_PublicStruct_create_handle(c_internalField.ref))
}
internal func moveToCType(_ swiftType: PublicClass.PublicStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicClass_PublicStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PublicClass.PublicStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PublicClass_PublicStruct_unwrap_optional_handle(handle)
    return PublicClass.PublicStruct(cHandle: unwrappedHandle) as PublicClass.PublicStruct
}
internal func moveFromCType(_ handle: _baseRef) -> PublicClass.PublicStruct? {
    defer {
        smoke_PublicClass_PublicStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: PublicClass.PublicStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_internalField = moveToCType(swiftType.internalField)
    return RefHolder(smoke_PublicClass_PublicStruct_create_optional_handle(c_internalField.ref))
}
internal func moveToCType(_ swiftType: PublicClass.PublicStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PublicClass_PublicStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: PublicClass.InternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: PublicClass.InternalEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: PublicClass.InternalEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: PublicClass.InternalEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> PublicClass.InternalEnum {
    return PublicClass.InternalEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> PublicClass.InternalEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> PublicClass.InternalEnum? {
    guard handle != 0 else {
        return nil
    }
    return PublicClass.InternalEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> PublicClass.InternalEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
