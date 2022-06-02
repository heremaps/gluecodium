//
//
import Foundation
public class EnumDefaults {
    public typealias EnumAlias = Enum3
    let c_instance : _baseRef
    init(cEnumDefaults: _baseRef) {
        guard cEnumDefaults != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEnumDefaults
    }
    deinit {
        smoke_EnumDefaults_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_EnumDefaults_release_handle(c_instance)
    }
    public struct SimpleEnum {
        public var enumField: Enum1
        public init(enumField: Enum1 = Enum1.disabled) {
            self.enumField = enumField
        }
        internal init(cHandle: _baseRef) {
            enumField = moveFromCType(smoke_EnumDefaults_SimpleEnum_enumField_get(cHandle))
        }
    }
    public struct NullableEnum {
        public var enumField1: Enum2?
        public var enumField1: Enum2?
        public init(enumField1: Enum2? = nil, enumField1: Enum2? = Enum2.disabled) {
            self.enumField1 = enumField1
            self.enumField1 = enumField1
        }
        internal init(cHandle: _baseRef) {
            enumField1 = moveFromCType(smoke_EnumDefaults_NullableEnum_enumField1_get(cHandle))
            enumField1 = moveFromCType(smoke_EnumDefaults_NullableEnum_enumField1_get(cHandle))
        }
    }
    public struct AliasEnum {
        public var enumField: EnumDefaults.EnumAlias
        public init(enumField: EnumDefaults.EnumAlias = Enum3.disabled) {
            self.enumField = enumField
        }
        internal init(cHandle: _baseRef) {
            enumField = moveFromCType(smoke_EnumDefaults_AliasEnum_enumField_get(cHandle))
        }
    }
    public struct WrappedEnum {
        public var structField: EnumWrapper
        public init(structField: EnumWrapper = EnumWrapper(enumField: Enum4.disabled)) {
            self.structField = structField
        }
        internal init(cHandle: _baseRef) {
            structField = moveFromCType(smoke_EnumDefaults_WrappedEnum_structField_get(cHandle))
        }
    }
}
internal func getRef(_ ref: EnumDefaults?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_EnumDefaults_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_EnumDefaults_release_handle)
        : RefHolder(handle_copy)
}
extension EnumDefaults: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension EnumDefaults: Hashable {
    /// :nodoc:
    public static func == (lhs: EnumDefaults, rhs: EnumDefaults) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func EnumDefaults_copyFromCType(_ handle: _baseRef) -> EnumDefaults {
    if let swift_pointer = smoke_EnumDefaults_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnumDefaults {
        return re_constructed
    }
    let result = EnumDefaults(cEnumDefaults: smoke_EnumDefaults_copy_handle(handle))
    smoke_EnumDefaults_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func EnumDefaults_moveFromCType(_ handle: _baseRef) -> EnumDefaults {
    if let swift_pointer = smoke_EnumDefaults_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnumDefaults {
        smoke_EnumDefaults_release_handle(handle)
        return re_constructed
    }
    let result = EnumDefaults(cEnumDefaults: handle)
    smoke_EnumDefaults_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func EnumDefaults_copyFromCType(_ handle: _baseRef) -> EnumDefaults? {
    guard handle != 0 else {
        return nil
    }
    return EnumDefaults_moveFromCType(handle) as EnumDefaults
}
internal func EnumDefaults_moveFromCType(_ handle: _baseRef) -> EnumDefaults? {
    guard handle != 0 else {
        return nil
    }
    return EnumDefaults_moveFromCType(handle) as EnumDefaults
}
internal func copyToCType(_ swiftClass: EnumDefaults) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EnumDefaults) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: EnumDefaults?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EnumDefaults?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaults.SimpleEnum {
    return EnumDefaults.SimpleEnum(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaults.SimpleEnum {
    defer {
        smoke_EnumDefaults_SimpleEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumDefaults.SimpleEnum) -> RefHolder {
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_EnumDefaults_SimpleEnum_create_handle(c_enumField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaults.SimpleEnum) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaults_SimpleEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaults.SimpleEnum? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EnumDefaults_SimpleEnum_unwrap_optional_handle(handle)
    return EnumDefaults.SimpleEnum(cHandle: unwrappedHandle) as EnumDefaults.SimpleEnum
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaults.SimpleEnum? {
    defer {
        smoke_EnumDefaults_SimpleEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumDefaults.SimpleEnum?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_EnumDefaults_SimpleEnum_create_optional_handle(c_enumField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaults.SimpleEnum?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaults_SimpleEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaults.NullableEnum {
    return EnumDefaults.NullableEnum(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaults.NullableEnum {
    defer {
        smoke_EnumDefaults_NullableEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumDefaults.NullableEnum) -> RefHolder {
    let c_enumField1 = moveToCType(swiftType.enumField1)
    let c_enumField1 = moveToCType(swiftType.enumField1)
    return RefHolder(smoke_EnumDefaults_NullableEnum_create_handle(c_enumField1.ref, c_enumField1.ref))
}
internal func moveToCType(_ swiftType: EnumDefaults.NullableEnum) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaults_NullableEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaults.NullableEnum? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EnumDefaults_NullableEnum_unwrap_optional_handle(handle)
    return EnumDefaults.NullableEnum(cHandle: unwrappedHandle) as EnumDefaults.NullableEnum
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaults.NullableEnum? {
    defer {
        smoke_EnumDefaults_NullableEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumDefaults.NullableEnum?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_enumField1 = moveToCType(swiftType.enumField1)
    let c_enumField1 = moveToCType(swiftType.enumField1)
    return RefHolder(smoke_EnumDefaults_NullableEnum_create_optional_handle(c_enumField1.ref, c_enumField1.ref))
}
internal func moveToCType(_ swiftType: EnumDefaults.NullableEnum?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaults_NullableEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaults.AliasEnum {
    return EnumDefaults.AliasEnum(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaults.AliasEnum {
    defer {
        smoke_EnumDefaults_AliasEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumDefaults.AliasEnum) -> RefHolder {
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_EnumDefaults_AliasEnum_create_handle(c_enumField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaults.AliasEnum) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaults_AliasEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaults.AliasEnum? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EnumDefaults_AliasEnum_unwrap_optional_handle(handle)
    return EnumDefaults.AliasEnum(cHandle: unwrappedHandle) as EnumDefaults.AliasEnum
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaults.AliasEnum? {
    defer {
        smoke_EnumDefaults_AliasEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumDefaults.AliasEnum?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_EnumDefaults_AliasEnum_create_optional_handle(c_enumField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaults.AliasEnum?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaults_AliasEnum_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaults.WrappedEnum {
    return EnumDefaults.WrappedEnum(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaults.WrappedEnum {
    defer {
        smoke_EnumDefaults_WrappedEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumDefaults.WrappedEnum) -> RefHolder {
    let c_structField = moveToCType(swiftType.structField)
    return RefHolder(smoke_EnumDefaults_WrappedEnum_create_handle(c_structField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaults.WrappedEnum) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaults_WrappedEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaults.WrappedEnum? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EnumDefaults_WrappedEnum_unwrap_optional_handle(handle)
    return EnumDefaults.WrappedEnum(cHandle: unwrappedHandle) as EnumDefaults.WrappedEnum
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaults.WrappedEnum? {
    defer {
        smoke_EnumDefaults_WrappedEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EnumDefaults.WrappedEnum?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_structField = moveToCType(swiftType.structField)
    return RefHolder(smoke_EnumDefaults_WrappedEnum_create_optional_handle(c_structField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaults.WrappedEnum?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaults_WrappedEnum_release_optional_handle)
}
