//

//

import Foundation
import FooKit1
import FooKit2
import FooKit3
import FooKit4

public class EnumDefaultsExternal {

    public typealias EnumAlias = ExternalEnum3


    let c_instance : _baseRef

    init(cEnumDefaultsExternal: _baseRef) {
        guard cEnumDefaultsExternal != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEnumDefaultsExternal
    }

    deinit {
        smoke_EnumDefaultsExternal_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_EnumDefaultsExternal_release_handle(c_instance)
    }

    public struct SimpleEnum {

        public var enumField: ExternalEnum1

        public init(enumField: ExternalEnum1 = ExternalEnum1.disabled) {
            self.enumField = enumField
        }
        internal init(cHandle: _baseRef) {
            enumField = moveFromCType(smoke_EnumDefaultsExternal_SimpleEnum_enumField_get(cHandle))
        }
    }

    public struct NullableEnum {

        public var enumField1: ExternalEnum2?

        public var enumField2: ExternalEnum2?

        public init(enumField1: ExternalEnum2? = nil, enumField2: ExternalEnum2? = ExternalEnum2.disabled) {
            self.enumField1 = enumField1
            self.enumField2 = enumField2
        }
        internal init(cHandle: _baseRef) {
            enumField1 = moveFromCType(smoke_EnumDefaultsExternal_NullableEnum_enumField1_get(cHandle))
            enumField2 = moveFromCType(smoke_EnumDefaultsExternal_NullableEnum_enumField2_get(cHandle))
        }
    }

    public struct AliasEnum {

        public var enumField: EnumDefaultsExternal.EnumAlias

        public init(enumField: EnumDefaultsExternal.EnumAlias = ExternalEnum3.disabled) {
            self.enumField = enumField
        }
        internal init(cHandle: _baseRef) {
            enumField = moveFromCType(smoke_EnumDefaultsExternal_AliasEnum_enumField_get(cHandle))
        }
    }

    public struct WrappedEnum {

        public var structField: EnumWrapper

        public init(structField: EnumWrapper = EnumWrapper(enumField: ExternalEnum4.disabled)) {
            self.structField = structField
        }
        internal init(cHandle: _baseRef) {
            structField = moveFromCType(smoke_EnumDefaultsExternal_WrappedEnum_structField_get(cHandle))
        }
    }


}



internal func getRef(_ ref: EnumDefaultsExternal?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_EnumDefaultsExternal_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_EnumDefaultsExternal_release_handle)
        : RefHolder(handle_copy)
}

extension EnumDefaultsExternal: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension EnumDefaultsExternal: Hashable {
    /// :nodoc:
    public static func == (lhs: EnumDefaultsExternal, rhs: EnumDefaultsExternal) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }

    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}

internal func EnumDefaultsExternal_copyFromCType(_ handle: _baseRef) -> EnumDefaultsExternal {
    if let swift_pointer = smoke_EnumDefaultsExternal_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnumDefaultsExternal {
        return re_constructed
    }
    let result = EnumDefaultsExternal(cEnumDefaultsExternal: smoke_EnumDefaultsExternal_copy_handle(handle))
    smoke_EnumDefaultsExternal_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func EnumDefaultsExternal_moveFromCType(_ handle: _baseRef) -> EnumDefaultsExternal {
    if let swift_pointer = smoke_EnumDefaultsExternal_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EnumDefaultsExternal {
        smoke_EnumDefaultsExternal_release_handle(handle)
        return re_constructed
    }
    let result = EnumDefaultsExternal(cEnumDefaultsExternal: handle)
    smoke_EnumDefaultsExternal_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func EnumDefaultsExternal_copyFromCType(_ handle: _baseRef) -> EnumDefaultsExternal? {
    guard handle != 0 else {
        return nil
    }
    return EnumDefaultsExternal_moveFromCType(handle) as EnumDefaultsExternal
}
internal func EnumDefaultsExternal_moveFromCType(_ handle: _baseRef) -> EnumDefaultsExternal? {
    guard handle != 0 else {
        return nil
    }
    return EnumDefaultsExternal_moveFromCType(handle) as EnumDefaultsExternal
}

internal func copyToCType(_ swiftClass: EnumDefaultsExternal) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: EnumDefaultsExternal) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftClass: EnumDefaultsExternal?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: EnumDefaultsExternal?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.SimpleEnum {
    return EnumDefaultsExternal.SimpleEnum(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.SimpleEnum {
    defer {
        smoke_EnumDefaultsExternal_SimpleEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: EnumDefaultsExternal.SimpleEnum) -> RefHolder {
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_EnumDefaultsExternal_SimpleEnum_create_handle(c_enumField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaultsExternal.SimpleEnum) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaultsExternal_SimpleEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.SimpleEnum? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EnumDefaultsExternal_SimpleEnum_unwrap_optional_handle(handle)
    return EnumDefaultsExternal.SimpleEnum(cHandle: unwrappedHandle) as EnumDefaultsExternal.SimpleEnum
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.SimpleEnum? {
    defer {
        smoke_EnumDefaultsExternal_SimpleEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: EnumDefaultsExternal.SimpleEnum?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_EnumDefaultsExternal_SimpleEnum_create_optional_handle(c_enumField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaultsExternal.SimpleEnum?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaultsExternal_SimpleEnum_release_optional_handle)
}

internal func copyFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.NullableEnum {
    return EnumDefaultsExternal.NullableEnum(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.NullableEnum {
    defer {
        smoke_EnumDefaultsExternal_NullableEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: EnumDefaultsExternal.NullableEnum) -> RefHolder {
    let c_enumField1 = moveToCType(swiftType.enumField1)
    let c_enumField2 = moveToCType(swiftType.enumField2)
    return RefHolder(smoke_EnumDefaultsExternal_NullableEnum_create_handle(c_enumField1.ref, c_enumField2.ref))
}
internal func moveToCType(_ swiftType: EnumDefaultsExternal.NullableEnum) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaultsExternal_NullableEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.NullableEnum? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EnumDefaultsExternal_NullableEnum_unwrap_optional_handle(handle)
    return EnumDefaultsExternal.NullableEnum(cHandle: unwrappedHandle) as EnumDefaultsExternal.NullableEnum
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.NullableEnum? {
    defer {
        smoke_EnumDefaultsExternal_NullableEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: EnumDefaultsExternal.NullableEnum?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_enumField1 = moveToCType(swiftType.enumField1)
    let c_enumField2 = moveToCType(swiftType.enumField2)
    return RefHolder(smoke_EnumDefaultsExternal_NullableEnum_create_optional_handle(c_enumField1.ref, c_enumField2.ref))
}
internal func moveToCType(_ swiftType: EnumDefaultsExternal.NullableEnum?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaultsExternal_NullableEnum_release_optional_handle)
}

internal func copyFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.AliasEnum {
    return EnumDefaultsExternal.AliasEnum(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.AliasEnum {
    defer {
        smoke_EnumDefaultsExternal_AliasEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: EnumDefaultsExternal.AliasEnum) -> RefHolder {
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_EnumDefaultsExternal_AliasEnum_create_handle(c_enumField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaultsExternal.AliasEnum) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaultsExternal_AliasEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.AliasEnum? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EnumDefaultsExternal_AliasEnum_unwrap_optional_handle(handle)
    return EnumDefaultsExternal.AliasEnum(cHandle: unwrappedHandle) as EnumDefaultsExternal.AliasEnum
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.AliasEnum? {
    defer {
        smoke_EnumDefaultsExternal_AliasEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: EnumDefaultsExternal.AliasEnum?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_enumField = moveToCType(swiftType.enumField)
    return RefHolder(smoke_EnumDefaultsExternal_AliasEnum_create_optional_handle(c_enumField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaultsExternal.AliasEnum?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaultsExternal_AliasEnum_release_optional_handle)
}

internal func copyFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.WrappedEnum {
    return EnumDefaultsExternal.WrappedEnum(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.WrappedEnum {
    defer {
        smoke_EnumDefaultsExternal_WrappedEnum_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: EnumDefaultsExternal.WrappedEnum) -> RefHolder {
    let c_structField = moveToCType(swiftType.structField)
    return RefHolder(smoke_EnumDefaultsExternal_WrappedEnum_create_handle(c_structField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaultsExternal.WrappedEnum) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaultsExternal_WrappedEnum_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.WrappedEnum? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EnumDefaultsExternal_WrappedEnum_unwrap_optional_handle(handle)
    return EnumDefaultsExternal.WrappedEnum(cHandle: unwrappedHandle) as EnumDefaultsExternal.WrappedEnum
}
internal func moveFromCType(_ handle: _baseRef) -> EnumDefaultsExternal.WrappedEnum? {
    defer {
        smoke_EnumDefaultsExternal_WrappedEnum_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: EnumDefaultsExternal.WrappedEnum?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_structField = moveToCType(swiftType.structField)
    return RefHolder(smoke_EnumDefaultsExternal_WrappedEnum_create_optional_handle(c_structField.ref))
}
internal func moveToCType(_ swiftType: EnumDefaultsExternal.WrappedEnum?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EnumDefaultsExternal_WrappedEnum_release_optional_handle)
}



