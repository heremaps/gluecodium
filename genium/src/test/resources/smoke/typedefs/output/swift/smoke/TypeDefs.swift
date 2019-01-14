//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: TypeDefs?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_TypeDefs_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_TypeDefs_release_handle)
        : RefHolder(handle_copy)
}
public class TypeDefs {
    public typealias NestedIntTypeDef = TypeDefs.PrimitiveTypeDef
    public typealias PrimitiveTypeDef = Double
    public typealias ComplexTypeDef = CollectionOf<TypeDefs.TestStruct>
    public typealias TestStructTypeDef = TypeDefs.TestStruct
    public typealias NestedStructTypeDef = TypeDefs.TestStructTypeDef
    public var primitiveTypeAttribute: CollectionOf<TypeDefs.PrimitiveTypeDef> {
        get {
            return moveFromCType(smoke_TypeDefs_primitiveTypeAttribute_get(c_instance))
        }
        set {
            let newValue_handle = newValue.c_conversion()
            defer {
                newValue_handle.cleanup()
            }
            return moveFromCType(smoke_TypeDefs_primitiveTypeAttribute_set(c_instance, newValue_handle.c_type))
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
        smoke_TypeDefs_release_handle(c_instance)
    }
    public struct StructHavingAliasFieldDefinedBelow {
        public var field: TypeDefs.PrimitiveTypeDef
        public init(field: TypeDefs.PrimitiveTypeDef) {
            self.field = field
        }
        internal init(cHandle: _baseRef) {
            field = smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_field_get(cHandle)
        }
        internal func convertToCType() -> _baseRef {
            let field_handle = field
            return smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle(field_handle)
        }
    }
    public struct TestStruct {
        public var something: String
        public init(something: String) {
            self.something = something
        }
        internal init(cHandle: _baseRef) {
            do {
                let something_handle = smoke_TypeDefs_TestStruct_something_get(cHandle)
                defer {
                    std_string_release_handle(something_handle)
                }
                something = String(cString: std_string_data_get(something_handle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let something_handle = something
            return smoke_TypeDefs_TestStruct_create_handle(something_handle)
        }
    }
    public static func methodWithPrimitiveTypeDef(input: TypeDefs.PrimitiveTypeDef) -> TypeDefs.PrimitiveTypeDef {
        return moveFromCType(smoke_TypeDefs_methodWithPrimitiveTypeDef(input))
    }
    public static func methodWithComplexTypeDef<Tinput: Collection>(input: Tinput) -> TypeDefs.ComplexTypeDef where Tinput.Element == TypeDefs.TestStruct {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return moveFromCType(smoke_TypeDefs_methodWithComplexTypeDef(input_handle.c_type))
    }
    public static func returnNestedIntTypeDef(input: TypeDefs.NestedIntTypeDef) -> TypeDefs.NestedIntTypeDef {
        return moveFromCType(smoke_TypeDefs_returnNestedIntTypeDef(input))
    }
    public static func returnTestStructTypeDef(input: TypeDefs.TestStructTypeDef) -> TypeDefs.TestStructTypeDef {
        let input_handle = input.convertToCType()
        defer {
            smoke_TypeDefs_TestStruct_release_handle(input_handle)
        }
        return moveFromCType(smoke_TypeDefs_returnTestStructTypeDef(input_handle))
    }
    public static func returnNestedStructTypeDef(input: TypeDefs.NestedStructTypeDef) -> TypeDefs.NestedStructTypeDef {
        let input_handle = input.convertToCType()
        defer {
            smoke_TypeDefs_TestStruct_release_handle(input_handle)
        }
        return moveFromCType(smoke_TypeDefs_returnNestedStructTypeDef(input_handle))
    }
    public static func returnTypeDefPointFromTypeCollection(input: PointTypeDef) -> PointTypeDef {
        let input_handle = input.convertToCType()
        defer {
            smoke_TypeCollection_Point_release_handle(input_handle)
        }
        return moveFromCType(smoke_TypeDefs_returnTypeDefPointFromTypeCollection(input_handle))
    }
}
extension TypeDefs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func TypeDefscopyFromCType(_ handle: _baseRef) -> TypeDefs {
    return TypeDefs(cTypeDefs: handle)
}
internal func TypeDefsmoveFromCType(_ handle: _baseRef) -> TypeDefs {
    return TypeDefscopyFromCType(handle)
}
internal func TypeDefscopyFromCType(_ handle: _baseRef) -> TypeDefs? {
    guard handle != 0 else {
        return nil
    }
    return TypeDefsmoveFromCType(handle) as TypeDefs
}
internal func TypeDefsmoveFromCType(_ handle: _baseRef) -> TypeDefs? {
    return TypeDefscopyFromCType(handle)
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
internal func copyFromCType(_ handle: _baseRef) -> TypeDefs.TestStruct {
    return TypeDefs.TestStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypeDefs.TestStruct {
    defer {
        smoke_TypeDefs_TestStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}