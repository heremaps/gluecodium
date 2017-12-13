//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation


internal func getRef(_ ref: TypeDefs) -> RefHolder<smoke_TypeDefsRef> {
    return RefHolder<smoke_TypeDefsRef>(ref.c_instance)
}

public class TypeDefs {

    public typealias PrimitiveTypeDef = Double
    public typealias ComplexTypeDef = CollectionOf<TypeDefs.TestStruct>
    public typealias NestedIntTypeDef = TypeDefs.PrimitiveTypeDef
    public typealias TestStructTypeDef = TypeDefs.TestStruct
    public typealias NestedStructTypeDef = TypeDefs.TestStructTypeDef





    public var primitiveTypeAttribute: CollectionOf<Double> {
        get {
            let handle = smoke_TypeDefs_primitiveTypeAttribute_get(c_instance)
            return DoubleList(handle)
        }
        set {
            let newValueHandle = newValue.c_conversion()
            defer {
                newValueHandle.cleanup()
            }
            return smoke_TypeDefs_primitiveTypeAttribute_set(c_instance, newValueHandle.c_type)
        }
    }
    let c_instance : smoke_TypeDefsRef
    public required init?(cTypeDefs: smoke_TypeDefsRef) {
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
        internal init?(cStructHavingAliasFieldDefinedBelow: smoke_TypeDefs_StructHavingAliasFieldDefinedBelowRef) {
            field = smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_field_get(cStructHavingAliasFieldDefinedBelow)
        }
        internal func convertToCType() -> smoke_TypeDefs_StructHavingAliasFieldDefinedBelowRef {
            let result = smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cStructHavingAliasFieldDefinedBelow: smoke_TypeDefs_StructHavingAliasFieldDefinedBelowRef) -> Void {
            smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_field_set(cStructHavingAliasFieldDefinedBelow, field)
        }
    }

    public struct TestStruct {
        public var something: String

        public init(something: String) {
            self.something = something
        }

        internal init?(cTestStruct: smoke_TypeDefs_TestStructRef) {
            do {
                let somethingHandle = smoke_TypeDefs_TestStruct_something_get(cTestStruct)
                something = String(cString:std_string_data_get(somethingHandle))
            }
        }

        internal func convertToCType() -> smoke_TypeDefs_TestStructRef {
            let result = smoke_TypeDefs_TestStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cTestStruct: smoke_TypeDefs_TestStructRef) -> Void {
            smoke_TypeDefs_TestStruct_something_set(cTestStruct, something)
        }
    }

    public static func methodWithPrimitiveTypeDef(input: TypeDefs.PrimitiveTypeDef) -> TypeDefs.PrimitiveTypeDef {
        return smoke_TypeDefs_methodWithPrimitiveTypeDef(input)
    }

    public static func methodWithComplexTypeDef<Tinput: Collection>(input: Tinput) -> TypeDefs.ComplexTypeDef where Tinput.Element == TypeDefs.TestStruct {
        let inputHandle = input.c_conversion()
        defer {
            inputHandle.cleanup()
        }
        let handle = smoke_TypeDefs_methodWithComplexTypeDef(inputHandle.c_type)
        return TestStructList(handle)
    }

    public static func returnNestedIntTypeDef(input: TypeDefs.NestedIntTypeDef) -> TypeDefs.NestedIntTypeDef {
        return smoke_TypeDefs_returnNestedIntTypeDef(input)
    }

    public static func returnTestStructTypeDef(input: TypeDefs.TestStructTypeDef) -> TypeDefs.TestStructTypeDef? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_TypeDefs_TestStruct_release(inputHandle)
        }
        let cResult = smoke_TypeDefs_returnTestStructTypeDef(inputHandle)


        defer {
            smoke_TypeDefs_TestStruct_release(cResult)
        }

        return TypeDefs.TestStruct(cTestStruct: cResult)
    }
    public static func returnNestedStructTypeDef(input: TypeDefs.NestedStructTypeDef) -> TypeDefs.NestedStructTypeDef? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_TypeDefs_TestStruct_release(inputHandle)
        }
        let cResult = smoke_TypeDefs_returnNestedStructTypeDef(inputHandle)


        defer {
            smoke_TypeDefs_TestStruct_release(cResult)
        }

        return TypeDefs.TestStruct(cTestStruct: cResult)
    }

    public static func returnTypeDefPointFromTypeCollection(input: PointTypeDef) -> PointTypeDef? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(inputHandle)
        }
        let cResult = smoke_TypeDefs_returnTypeDefPointFromTypeCollection(inputHandle)


        defer {
            smoke_TypeCollection_Point_release(cResult)
        }

        return Point(cPoint: cResult)
    }

}
