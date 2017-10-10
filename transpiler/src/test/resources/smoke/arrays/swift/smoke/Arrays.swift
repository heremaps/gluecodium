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



public class Arrays {




    public struct BasicStruct {
        public var value: Double

        public init(value: Double) {
            self.value = value
        }

        internal init?(cBasicStruct: smoke_Arrays_BasicStructRef) {
            value = smoke_Arrays_BasicStruct_value_get(cBasicStruct)
        }

        internal func convertToCType() -> smoke_Arrays_BasicStructRef {
            let result = smoke_Arrays_BasicStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cBasicStruct: smoke_Arrays_BasicStructRef) -> Void {
            smoke_Arrays_BasicStruct_value_set(cBasicStruct, value)
        }
    }
    public struct FancyStruct {
        public var messages: Void
        public var numbers: UInt8

        public init(messages: Void, numbers: UInt8) {
            self.messages = messages
            self.numbers = numbers
        }

        internal init?(cFancyStruct: smoke_Arrays_FancyStructRef) {
            messages = smoke_Arrays_FancyStruct_messages_get(cFancyStruct)
            numbers = smoke_Arrays_FancyStruct_numbers_get(cFancyStruct)
        }

        internal func convertToCType() -> smoke_Arrays_FancyStructRef {
            let result = smoke_Arrays_FancyStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cFancyStruct: smoke_Arrays_FancyStructRef) -> Void {
            smoke_Arrays_FancyStruct_messages_set(cFancyStruct, messages)
            smoke_Arrays_FancyStruct_numbers_set(cFancyStruct, numbers)
        }
    }

    public static func methodWithArray(input: Void) -> Void {
        return smoke_Arrays_methodWithArray(input)
    }
    public static func methodWithArrayInline(input: UInt8) -> UInt8 {
        return smoke_Arrays_methodWithArrayInline(input)
    }
    public static func methodWithStructArray(input: BasicStruct) -> Void {
        let inputHandle = input.convertToCType()
        defer {
            smoke_Arrays_BasicStruct_release(inputHandle)
        }
        return smoke_Arrays_methodWithStructArray(inputHandle)
    }
    public static func methodWithArrayOfArrys(input: Void) -> Void {
        return smoke_Arrays_methodWithArrayOfArrys(input)
    }
    public static func mergeArraysOfStructsWithArrays(inlineFancyArray: FancyStruct, fancyArray: Void) -> Void {
        let inlineFancyArrayHandle = inlineFancyArray.convertToCType()
        defer {
            smoke_Arrays_FancyStruct_release(inlineFancyArrayHandle)
        }
        return smoke_Arrays_mergeArraysOfStructsWithArrays(inlineFancyArrayHandle, fancyArray)
    }
}


