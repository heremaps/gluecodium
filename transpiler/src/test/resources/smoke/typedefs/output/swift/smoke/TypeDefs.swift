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




public class TypeDefs {

    public typealias PrimitiveTypeDef = Double

    public typealias ComplexTypeDef = Void

    public typealias NestedIntTypeDef = PrimitiveTypeDef

    public typealias TestStructTypeDef = TestStruct

    public typealias NestedStructTypeDef = TestStructTypeDef

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

    public static func methodWithPrimitiveTypeDef(input: PrimitiveTypeDef) -> PrimitiveTypeDef {
        return smoke_TypeDefs_methodWithPrimitiveTypeDef(input)
    }

    public static func methodWithComplexTypeDef(input: ComplexTypeDef) -> ComplexTypeDef {
        return smoke_TypeDefs_methodWithComplexTypeDef(input)
    }

    public static func returnNestedIntTypeDef(input: NestedIntTypeDef) -> NestedIntTypeDef {
        return smoke_TypeDefs_returnNestedIntTypeDef(input)
    }

    public static func returnTestStructTypeDef(input: TestStructTypeDef) -> TestStructTypeDef? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_TypeDefs_TestStruct_release(inputHandle)
        }
        let cResult = smoke_TypeDefs_returnTestStructTypeDef(inputHandle)


        defer {
            smoke_TypeDefs_TestStruct_release(cResult)
        }

        return TestStruct(cTestStruct: cResult)
    }

    public static func returnNestedStructTypeDef(input: NestedStructTypeDef) -> NestedStructTypeDef? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_TypeDefs_TestStruct_release(inputHandle)
        }
        let cResult = smoke_TypeDefs_returnNestedStructTypeDef(inputHandle)


        defer {
            smoke_TypeDefs_TestStruct_release(cResult)
        }

        return TestStruct(cTestStruct: cResult)
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
