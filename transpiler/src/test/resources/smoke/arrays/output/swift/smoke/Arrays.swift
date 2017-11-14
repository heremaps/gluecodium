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

    public typealias ProfileId = String

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
        public var messages: CollectionOf<String>
        public var numbers: CollectionOf<UInt8>

        public init(messages: CollectionOf<String>, numbers: CollectionOf<UInt8>) {
            self.messages = messages
            self.numbers = numbers
        }

        internal init?(cFancyStruct: smoke_Arrays_FancyStructRef) {
            messages = StringList(smoke_Arrays_FancyStruct_messages_get(cFancyStruct))
            numbers = UInt8List(smoke_Arrays_FancyStruct_numbers_get(cFancyStruct))
        }

        internal func convertToCType() -> smoke_Arrays_FancyStructRef {
            let result = smoke_Arrays_FancyStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cFancyStruct: smoke_Arrays_FancyStructRef) -> Void {
            let messagesConversion = messages.c_conversion()
            smoke_Arrays_FancyStruct_messages_set(cFancyStruct, messagesConversion.c_type)
            messagesConversion.cleanup()
            let numbersConversion = numbers.c_conversion()
            smoke_Arrays_FancyStruct_numbers_set(cFancyStruct, numbersConversion.c_type)
            numbersConversion.cleanup()
        }
    }

    public static func methodWithArray<T: Collection>(input: T) -> CollectionOf<String> {

        let inputArray = input.flatMap{ $0 as? String }
        let inputHandle = inputArray.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle =  smoke_Arrays_methodWithArray(inputHandle.c_type)

        return StringList(handle)
    }

    public static func methodWithArrayInline<T: Collection>(input: T) -> CollectionOf<UInt8> {

        let inputArray = input.flatMap{ $0 as? UInt8 }
        let inputHandle = inputArray.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle =  smoke_Arrays_methodWithArrayInline(inputHandle.c_type)

        return UInt8List(handle)
    }

    public static func methodWithStructArray<T: Collection>(input: T) -> CollectionOf<Arrays.BasicStruct> {

        let inputArray = input.flatMap{ $0 as? BasicStruct }
        let inputHandle = inputArray.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle =  smoke_Arrays_methodWithStructArray(inputHandle.c_type)

        return BasicStructList(handle)
    }

    public static func methodWithArrayOfArrays<T: Collection>(input: T) -> CollectionOf<CollectionOf<UInt8>> {

        let inputArray = input.flatMap{ $0 as? [UInt8] }.map{ CollectionOf<UInt8>($0) }
        let inputHandle = inputArray.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle =  smoke_Arrays_methodWithArrayOfArrays(inputHandle.c_type)

        return UInt8ListList(handle)
    }

    public static func mergeArraysOfStructsWithArrays<T: Collection>(inlineFancyArray: T, fancyArray: T) -> CollectionOf<Arrays.FancyStruct> {

        let inlineFancyArrayArray = inlineFancyArray.flatMap{ $0 as? FancyStruct }
        let inlineFancyArrayHandle = inlineFancyArrayArray.c_conversion()
        defer {
            inlineFancyArrayHandle.cleanup()
        }

        let fancyArrayArray = fancyArray.flatMap{ $0 as? FancyStruct }
        let fancyArrayHandle = fancyArrayArray.c_conversion()
        defer {
            fancyArrayHandle.cleanup()
        }

        let handle =  smoke_Arrays_mergeArraysOfStructsWithArrays(inlineFancyArrayHandle.c_type, fancyArrayHandle.c_type)

        return FancyStructList(handle)
    }

    public static func methodWithArrayOfAliases<T: Collection>(input: T) -> CollectionOf<String> {

        let inputArray = input.flatMap{ $0 as? String }
        let inputHandle = inputArray.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle =  smoke_Arrays_methodWithArrayOfAliases(inputHandle.c_type)

        return StringList(handle)
    }

}
