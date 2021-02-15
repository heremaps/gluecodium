//
//
import Foundation
public class TypeDefs {
    public typealias NestedIntTypeDef = TypeDefs.PrimitiveTypeDef
    public typealias PrimitiveTypeDef = Double
    public typealias StructArray = [TypeDefs.TestStruct]
    public typealias ComplexTypeDef = TypeDefs.StructArray
    public typealias TestStructTypeDef = TypeDefs.TestStruct
    public typealias NestedStructTypeDef = TypeDefs.TestStructTypeDef
    public var primitiveTypeProperty: [TypeDefs.PrimitiveTypeDef] {
        get {
            return foobar_moveFromCType(smoke_TypeDefs_primitiveTypeProperty_get(self.c_instance))
        }
        set {
            let c_value = foobar_moveToCType(newValue)
            return moveFromCType(smoke_TypeDefs_primitiveTypeProperty_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cTypeDefs: _baseRef) {
        guard cTypeDefs != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cTypeDefs
    }
    deinit {
        smoke_TypeDefs_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_TypeDefs_release_handle(c_instance)
    }
    public struct StructHavingAliasFieldDefinedBelow {
        public var field: TypeDefs.PrimitiveTypeDef
        public init(field: TypeDefs.PrimitiveTypeDef) {
            self.field = field
        }
        internal init(cHandle: _baseRef) {
            field = moveFromCType(smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_field_get(cHandle))
        }
    }
    public struct TestStruct {
        public var something: String
        public init(something: String) {
            self.something = something
        }
        internal init(cHandle: _baseRef) {
            something = moveFromCType(smoke_TypeDefs_TestStruct_something_get(cHandle))
        }
    }
    public static func methodWithPrimitiveTypeDef(input: TypeDefs.PrimitiveTypeDef) -> TypeDefs.PrimitiveTypeDef {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_TypeDefs_methodWithPrimitiveTypeDef(c_input.ref))
    }
    public static func methodWithComplexTypeDef(input: TypeDefs.ComplexTypeDef) -> TypeDefs.ComplexTypeDef {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_TypeDefs_methodWithComplexTypeDef(c_input.ref))
    }
    public static func returnNestedIntTypeDef(input: TypeDefs.NestedIntTypeDef) -> TypeDefs.NestedIntTypeDef {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_TypeDefs_returnNestedIntTypeDef(c_input.ref))
    }
    public static func returnTestStructTypeDef(input: TypeDefs.TestStructTypeDef) -> TypeDefs.TestStructTypeDef {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_TypeDefs_returnTestStructTypeDef(c_input.ref))
    }
    public static func returnNestedStructTypeDef(input: TypeDefs.NestedStructTypeDef) -> TypeDefs.NestedStructTypeDef {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_TypeDefs_returnNestedStructTypeDef(c_input.ref))
    }
    public static func returnTypeDefPointFromTypeCollection(input: PointTypeDef) -> PointTypeDef {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_TypeDefs_returnTypeDefPointFromTypeCollection(c_input.ref))
    }
}
internal func getRef(_ ref: TypeDefs?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_TypeDefs_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_TypeDefs_release_handle)
        : RefHolder(handle_copy)
}
extension TypeDefs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension TypeDefs: Hashable {
    /// :nodoc:
    public static func == (lhs: TypeDefs, rhs: TypeDefs) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func TypeDefs_copyFromCType(_ handle: _baseRef) -> TypeDefs {
    if let swift_pointer = smoke_TypeDefs_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? TypeDefs {
        return re_constructed
    }
    let result = TypeDefs(cTypeDefs: smoke_TypeDefs_copy_handle(handle))
    smoke_TypeDefs_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func TypeDefs_moveFromCType(_ handle: _baseRef) -> TypeDefs {
    if let swift_pointer = smoke_TypeDefs_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? TypeDefs {
        smoke_TypeDefs_release_handle(handle)
        return re_constructed
    }
    let result = TypeDefs(cTypeDefs: handle)
    smoke_TypeDefs_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func TypeDefs_copyFromCType(_ handle: _baseRef) -> TypeDefs? {
    guard handle != 0 else {
        return nil
    }
    return TypeDefs_moveFromCType(handle) as TypeDefs
}
internal func TypeDefs_moveFromCType(_ handle: _baseRef) -> TypeDefs? {
    guard handle != 0 else {
        return nil
    }
    return TypeDefs_moveFromCType(handle) as TypeDefs
}
internal func copyToCType(_ swiftClass: TypeDefs) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: TypeDefs) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: TypeDefs?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: TypeDefs?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeDefs.StructHavingAliasFieldDefinedBelow {
    return TypeDefs.StructHavingAliasFieldDefinedBelow(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypeDefs.StructHavingAliasFieldDefinedBelow {
    defer {
        smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeDefs.StructHavingAliasFieldDefinedBelow) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: TypeDefs.StructHavingAliasFieldDefinedBelow) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeDefs.StructHavingAliasFieldDefinedBelow? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_unwrap_optional_handle(handle)
    return TypeDefs.StructHavingAliasFieldDefinedBelow(cHandle: unwrappedHandle) as TypeDefs.StructHavingAliasFieldDefinedBelow
}
internal func moveFromCType(_ handle: _baseRef) -> TypeDefs.StructHavingAliasFieldDefinedBelow? {
    defer {
        smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeDefs.StructHavingAliasFieldDefinedBelow?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: TypeDefs.StructHavingAliasFieldDefinedBelow?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeDefs.TestStruct {
    return TypeDefs.TestStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypeDefs.TestStruct {
    defer {
        smoke_TypeDefs_TestStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeDefs.TestStruct) -> RefHolder {
    let c_something = moveToCType(swiftType.something)
    return RefHolder(smoke_TypeDefs_TestStruct_create_handle(c_something.ref))
}
internal func moveToCType(_ swiftType: TypeDefs.TestStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeDefs_TestStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeDefs.TestStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeDefs_TestStruct_unwrap_optional_handle(handle)
    return TypeDefs.TestStruct(cHandle: unwrappedHandle) as TypeDefs.TestStruct
}
internal func moveFromCType(_ handle: _baseRef) -> TypeDefs.TestStruct? {
    defer {
        smoke_TypeDefs_TestStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeDefs.TestStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_something = moveToCType(swiftType.something)
    return RefHolder(smoke_TypeDefs_TestStruct_create_optional_handle(c_something.ref))
}
internal func moveToCType(_ swiftType: TypeDefs.TestStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeDefs_TestStruct_release_optional_handle)
}
