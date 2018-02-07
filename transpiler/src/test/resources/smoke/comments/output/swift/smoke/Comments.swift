//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Comments) -> RefHolder {
    return RefHolder(ref.c_instance)
}
/**
 This is some very useful interface.
 */
public class Comments {
    /**
     This is some very useful typedef.
     */
    public typealias Usefulness = Bool
    /**
     This is some very useful attribute.
     */
    public var someAttribute: Comments.Usefulness {
        get {
            return smoke_Comments_someAttribute_get(c_instance)
        }
        set {
            return smoke_Comments_someAttribute_set(c_instance, newValue)
        }
    }
    let c_instance : _baseRef
    public init?(cComments: _baseRef) {
        guard cComments != 0 else {
            return nil
        }
        c_instance = cComments
    }
    deinit {
        smoke_Comments_release(c_instance)
    }
    /**
     This is some very useful enum.
     */
    public enum SomeEnum : UInt32 {
        /**
         Not quite useful
         */
        case useless
        /**
         Somewhat useful
         */
        case useful
    }
    /**
     This is some very useful struct.
     */
    public struct SomeStruct {
        /**
         How useful this struct is
         */
        public var someField: Comments.Usefulness
        public init(someField: Comments.Usefulness) {
            self.someField = someField
        }
        internal init?(cSomeStruct: _baseRef) {
            someField = smoke_Comments_SomeStruct_someField_get(cSomeStruct)
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Comments_SomeStruct_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cSomeStruct: _baseRef) -> Void {
            smoke_Comments_SomeStruct_someField_set(cSomeStruct, someField)
        }
    }
    /**
     This is some very useful method that measures the usefulness of its input.
     - Parameter input: Very useful input parameter
     - Returns: Usefulness of the input
     */
    public func someMethodWithAllComments(input: String) -> Comments.Usefulness {
        return smoke_Comments_someMethodWithAllComments(c_instance, input)
    }
    /**
     This is some very useful method that measures the usefulness of its input.
     - Parameter input: Very useful input parameter
     */
    public func someMethodWithInputComments(input: String) -> Comments.Usefulness {
        return smoke_Comments_someMethodWithInputComments(c_instance, input)
    }
    /**
     This is some very useful method that measures the usefulness of its input.
     - Returns: Usefulness of the input
     */
    public func someMethodWithOutputComments(input: String) -> Comments.Usefulness {
        return smoke_Comments_someMethodWithOutputComments(c_instance, input)
    }
    /**
     This is some very useful method that measures the usefulness of its input.
     */
    public func someMethodWithNoComments(input: String) -> Comments.Usefulness {
        return smoke_Comments_someMethodWithNoComments(c_instance, input)
    }
    /**
     This is some very useful method that does not measure the usefulness of its input.
     - Parameter input: Very useful input parameter
     */
    public func someMethodWithoutReturnTypeWithAllComments(input: String) -> Void {
        return smoke_Comments_someMethodWithoutReturnTypeWithAllComments(c_instance, input)
    }
    /**
     This is some very useful method that does not measure the usefulness of its input.
     */
    public func someMethodWithoutReturnTypeWithNoComments(input: String) -> Void {
        return smoke_Comments_someMethodWithoutReturnTypeWithNoComments(c_instance, input)
    }
    /**
     This is some very useful method that measures the usefulness of something.
     - Returns: Usefulness of the input
     */
    public func someMethodWithoutInputParametersWithAllComments() -> Comments.Usefulness {
        return smoke_Comments_someMethodWithoutInputParametersWithAllComments(c_instance)
    }
    /**
     This is some very useful method that measures the usefulness of something.
     */
    public func someMethodWithoutInputParametersWithNoComments() -> Comments.Usefulness {
        return smoke_Comments_someMethodWithoutInputParametersWithNoComments(c_instance)
    }
    public func someMethodWithNothing() -> Void {
        return smoke_Comments_someMethodWithNothing(c_instance)
    }
    /**
     This is some very useful method that does nothing.
     */
    public func someMethodWithoutReturnTypeOrInputParameters() -> Void {
        return smoke_Comments_someMethodWithoutReturnTypeOrInputParameters(c_instance)
    }
}

extension Comments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
