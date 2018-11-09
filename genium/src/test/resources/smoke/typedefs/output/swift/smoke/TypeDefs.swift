//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: TypeDefs?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class TypeDefs {

    public typealias NestedIntTypeDef = TypeDefs.PrimitiveTypeDef
    public typealias PrimitiveTypeDef = Double
    public typealias ComplexTypeDef = CollectionOf<TypeDefs.TestStruct>
    public typealias TestStructTypeDef = TypeDefs.TestStruct
    public typealias NestedStructTypeDef = TypeDefs.TestStructTypeDef

    public var primitiveTypeAttribute: CollectionOf<TypeDefs.PrimitiveTypeDef> {
        get {

            let result_handle = smoke_TypeDefs_primitiveTypeAttribute_get(c_instance)
            return DoubleList(result_handle)
        }
        set {

            let newValue_handle = newValue.c_conversion()
            defer {
                newValue_handle.cleanup()
            }
            return smoke_TypeDefs_primitiveTypeAttribute_set(c_instance, newValue_handle.c_type)
        }
    }
    let c_instance : _baseRef

    public init?(cTypeDefs: _baseRef) {
        guard cTypeDefs != 0 else {
            return nil
        }
        c_instance = cTypeDefs
    }

    deinit {
        smoke_TypeDefs_release(c_instance)
    }
    public struct StructHavingAliasFieldDefinedBelow {
        public var field: TypeDefs.PrimitiveTypeDef

        public init(field: TypeDefs.PrimitiveTypeDef) {
            self.field = field
        }

        internal init(cStructHavingAliasFieldDefinedBelow: _baseRef) {
            field = smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_field_get(cStructHavingAliasFieldDefinedBelow)
        }

        internal func convertToCType() -> _baseRef {
            let field_handle = field
            return smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create(field_handle)
        }
    }

    public struct TestStruct {
        public var something: String

        public init(something: String) {
            self.something = something
        }

        internal init(cTestStruct: _baseRef) {
            do {
                let something_handle = smoke_TypeDefs_TestStruct_something_get(cTestStruct)
                defer {
                    std_string_release(something_handle)
                }
                something = String(cString: std_string_data_get(something_handle))
            }
        }

        internal func convertToCType() -> _baseRef {
            let something_handle = something
            return smoke_TypeDefs_TestStruct_create(something_handle)
        }
    }

    public static func methodWithPrimitiveTypeDef(input: TypeDefs.PrimitiveTypeDef) -> TypeDefs.PrimitiveTypeDef {
        return smoke_TypeDefs_methodWithPrimitiveTypeDef(input)
    }

    public static func methodWithComplexTypeDef<Tinput: Collection>(input: Tinput) -> TypeDefs.ComplexTypeDef where Tinput.Element == TypeDefs.TestStruct {

        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }

        let result_handle = smoke_TypeDefs_methodWithComplexTypeDef(input_handle.c_type)
        return TestStructList(result_handle)
    }

    public static func returnNestedIntTypeDef(input: TypeDefs.NestedIntTypeDef) -> TypeDefs.NestedIntTypeDef {
        return smoke_TypeDefs_returnNestedIntTypeDef(input)
    }

    public static func returnTestStructTypeDef(input: TypeDefs.TestStructTypeDef) -> TypeDefs.TestStructTypeDef {
        let input_handle = input.convertToCType()
        defer {
            smoke_TypeDefs_TestStruct_release(input_handle)
        }
        let cResult = smoke_TypeDefs_returnTestStructTypeDef(input_handle)
        defer {
            smoke_TypeDefs_TestStruct_release(cResult)
        }
        return TypeDefs.TestStruct(cTestStruct: cResult)
    }

    public static func returnNestedStructTypeDef(input: TypeDefs.NestedStructTypeDef) -> TypeDefs.NestedStructTypeDef {
        let input_handle = input.convertToCType()
        defer {
            smoke_TypeDefs_TestStruct_release(input_handle)
        }
        let cResult = smoke_TypeDefs_returnNestedStructTypeDef(input_handle)
        defer {
            smoke_TypeDefs_TestStruct_release(cResult)
        }
        return TypeDefs.TestStruct(cTestStruct: cResult)
    }

    public static func returnTypeDefPointFromTypeCollection(input: PointTypeDef) -> PointTypeDef {
        let input_handle = input.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(input_handle)
        }
        let cResult = smoke_TypeDefs_returnTypeDefPointFromTypeCollection(input_handle)
        defer {
            smoke_TypeCollection_Point_release(cResult)
        }
        return Point(cPoint: cResult)
    }

}

extension TypeDefs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
