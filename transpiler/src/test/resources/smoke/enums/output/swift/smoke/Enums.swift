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

internal func getRef(_ ref: Enums) -> RefHolder<smoke_EnumsRef> {
    return RefHolder<smoke_EnumsRef>(ref.c_instance)
}

public class Enums {
    let c_instance : smoke_EnumsRef
    public required init?(cEnums: smoke_EnumsRef) {
        c_instance = cEnums
    }
    deinit {
        smoke_Enums_release(c_instance)
    }

    public enum SimpleEnum : UInt32 {

        case first

        case second
    }

    public enum InternalError : UInt32 {

        case errorNone

        case errorFatal = 999
    }

    public struct ErrorStruct {
        public var type: Enums.InternalError
        public var message: String

        public init(type: Enums.InternalError, message: String) {
            self.type = type
            self.message = message
        }

        internal init?(cErrorStruct: smoke_Enums_ErrorStructRef) {
            type = Enums.InternalError.init(rawValue: smoke_Enums_ErrorStruct_type_get(cErrorStruct))!
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

    public static func methodWithEnumeration(input: Enums.SimpleEnum) -> Enums.SimpleEnum {
        let cResult = smoke_Enums_methodWithEnumeration(input.rawValue)
        return Enums.SimpleEnum(rawValue: cResult)!
    }

    public static func flipEnumValue(input: Enums.InternalError) -> Enums.InternalError {
        let cResult = smoke_Enums_flipEnumValue(input.rawValue)
        return Enums.InternalError(rawValue: cResult)!
    }
    public static func extractEnumFromStruct(input: Enums.ErrorStruct) -> Enums.InternalError {
        let inputHandle = input.convertToCType()
        defer {
            smoke_Enums_ErrorStruct_release(inputHandle)
        }
        let cResult = smoke_Enums_extractEnumFromStruct(inputHandle)
        return Enums.InternalError(rawValue: cResult)!
    }
    public static func createStructWithEnumInside(type: Enums.InternalError, message: String) -> Enums.ErrorStruct? {
        let cResult = smoke_Enums_createStructWithEnumInside(type.rawValue, message)


        defer {
            smoke_Enums_ErrorStruct_release(cResult)
        }

        return Enums.ErrorStruct(cErrorStruct: cResult)
    }

}
