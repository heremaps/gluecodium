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




public class Enums {

    public enum SimpleEnum : UInt32 {

        case first

        case second
    }

    public enum InternalError : UInt32 {

        case errorNone

        case errorFatal = 999
    }

    public struct ErrorStruct {
        public var type: InternalError
        public var message: String

        public init(type: InternalError, message: String) {
            self.type = type
            self.message = message
        }

        internal init?(cErrorStruct: smoke_Enums_ErrorStructRef) {
            type = InternalError.init(rawValue: smoke_Enums_ErrorStruct_type_get(cErrorStruct))!
            do {
                let messageHandle = smoke_Enums_ErrorStruct_message_get(cErrorStruct)
                message = String(cString:std_string_data_get(messageHandle))
            }
        }

        internal func convertToCType() -> smoke_Enums_ErrorStructRef {
            let result = smoke_Enums_ErrorStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cErrorStruct: smoke_Enums_ErrorStructRef) -> Void {
            smoke_Enums_ErrorStruct_type_set(cErrorStruct, type.rawValue)
            smoke_Enums_ErrorStruct_message_set(cErrorStruct, message)
        }
    }

    public static func methodWithEnumeration(input: SimpleEnum) -> SimpleEnum {
        let cResult = smoke_Enums_methodWithEnumeration(input.rawValue)

        return SimpleEnum(rawValue: cResult)!
    }

    public static func flipEnumValue(input: InternalError) -> InternalError {
        let cResult = smoke_Enums_flipEnumValue(input.rawValue)

        return InternalError(rawValue: cResult)!
    }

    public static func extractEnumFromStruct(input: ErrorStruct) -> InternalError {
        let inputHandle = input.convertToCType()
        defer {
            smoke_Enums_ErrorStruct_release(inputHandle)
        }
        let cResult = smoke_Enums_extractEnumFromStruct(inputHandle)

        return InternalError(rawValue: cResult)!
    }

    public static func createStructWithEnumInside(type: InternalError, message: String) -> ErrorStruct? {
        let cResult = smoke_Enums_createStructWithEnumInside(type.rawValue, message)


        defer {
            smoke_Enums_ErrorStruct_release(cResult)
        }

        return ErrorStruct(cErrorStruct: cResult)
    }

}
