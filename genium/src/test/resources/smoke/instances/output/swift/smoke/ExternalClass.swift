//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
@_cdecl("_CBridgeInitsmoke_ExternalClass")
internal func _CBridgeInitsmoke_ExternalClass(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = ExternalClass(cExternalClass: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ExternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ExternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ExternalClass_release_handle)
        : RefHolder(handle_copy)
}
public class ExternalClass {
    public var someProperty: String {
        get {
            return moveFromCType(smoke_ExternalClass_someProperty_get(self.c_instance))
        }
    }
    let c_instance : _baseRef
    init(cExternalClass: _baseRef) {
        guard cExternalClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cExternalClass
    }
    deinit {
        smoke_ExternalClass_release_handle(c_instance)
    }
    public enum SomeEnum : UInt32, CaseIterable {
        case someValue
    }
    public struct SomeStruct {
        public var someField: String
        public init(someField: String) {
            self.someField = someField
        }
        internal init(cHandle: _baseRef) {
            someField = moveFromCType(smoke_ExternalClass_SomeStruct_someField_get(cHandle))
        }
    }
    public func someMethod(someParameter: Int8) -> Void {
        let c_someParameter = moveToCType(someParameter)
        return moveFromCType(smoke_ExternalClass_someMethod(self.c_instance, c_someParameter.ref))
    }
}
extension ExternalClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ExternalClasscopyFromCType(_ handle: _baseRef) -> ExternalClass {
    if let swift_pointer = smoke_ExternalClass_get_typed(smoke_ExternalClass_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ExternalClass {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ExternalClassmoveFromCType(_ handle: _baseRef) -> ExternalClass {
    if let swift_pointer = smoke_ExternalClass_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ExternalClass {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ExternalClasscopyFromCType(_ handle: _baseRef) -> ExternalClass? {
    guard handle != 0 else {
        return nil
    }
    return ExternalClassmoveFromCType(handle) as ExternalClass
}
internal func ExternalClassmoveFromCType(_ handle: _baseRef) -> ExternalClass? {
    guard handle != 0 else {
        return nil
    }
    return ExternalClassmoveFromCType(handle) as ExternalClass
}
internal func copyToCType(_ swiftClass: ExternalClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExternalClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ExternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> ExternalClass.SomeStruct {
    return ExternalClass.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ExternalClass.SomeStruct {
    defer {
        smoke_ExternalClass_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ExternalClass.SomeStruct) -> RefHolder {
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_ExternalClass_SomeStruct_create_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: ExternalClass.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExternalClass_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ExternalClass.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ExternalClass_SomeStruct_unwrap_optional_handle(handle)
    return ExternalClass.SomeStruct(cHandle: unwrappedHandle) as ExternalClass.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> ExternalClass.SomeStruct? {
    defer {
        smoke_ExternalClass_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ExternalClass.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_ExternalClass_SomeStruct_create_optional_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: ExternalClass.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExternalClass_SomeStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: ExternalClass.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: ExternalClass.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: ExternalClass.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: ExternalClass.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> ExternalClass.SomeEnum {
    return ExternalClass.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> ExternalClass.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> ExternalClass.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return ExternalClass.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> ExternalClass.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}