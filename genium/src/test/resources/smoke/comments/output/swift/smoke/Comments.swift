//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Comments?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Comments_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Comments_release_handle)
        : RefHolder(handle_copy)
}
/// This is some very useful interface.
public class Comments {
    /// This is some very useful typedef.
    public typealias Usefulness = Bool
    /// This is some very useful map.
    public typealias SomeMap = [String: Comments.Usefulness]
    /// This is some very useful constant.
    public static let veryUseful: Comments.Usefulness = true
    /// This is some very useful attribute.
    public var someAttribute: Comments.Usefulness {
        get {
            return moveFromCType(smoke_Comments_someAttribute_get(self.c_instance))
        }
        set {
                let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Comments_someAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    /// This is some very useful attribute.
    public var instanceNotNullAttribute: CommentsInstantiable {
        get {
            return CommentsInstantiablemoveFromCType(smoke_Comments_instanceNotNullAttribute_get(self.c_instance))
        }
        set {
                let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Comments_instanceNotNullAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cComments: _baseRef) {
        guard cComments != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cComments
    }
    deinit {
        smoke_Comments_release_handle(c_instance)
    }
    /// This is some very useful enum.
    public enum SomeEnum : UInt32, CaseIterable {
        /// Not quite useful
        case useless
        /// Somewhat useful
        case useful
    }
    /// This is some very useful struct.
    public struct SomeStruct {
        /// How useful this struct is
        public var someField: Comments.Usefulness
        public init(someField: Comments.Usefulness) {
            self.someField = someField
        }
        internal init(cHandle: _baseRef) {
            someField = moveFromCType(smoke_Comments_SomeStruct_someField_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_someField = moveToCType(someField)
            return smoke_Comments_SomeStruct_create_handle(c_someField.ref)
        }
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns: Usefulness of the input
    public func someMethodWithAllComments(input: String) -> Comments.Usefulness {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithAllComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    public func someMethodWithInputComments(input: String) -> Comments.Usefulness {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithInputComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Returns: Usefulness of the input
    public func someMethodWithOutputComments(input: String) -> Comments.Usefulness {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithOutputComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of its input.
    public func someMethodWithNoComments(input: String) -> Comments.Usefulness {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithNoComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that does not measure the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    public func someMethodWithoutReturnTypeWithAllComments(input: String) -> Void {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithoutReturnTypeWithAllComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that does not measure the usefulness of its input.
    public func someMethodWithoutReturnTypeWithNoComments(input: String) -> Void {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithoutReturnTypeWithNoComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of something.
    /// - Returns: Usefulness of the input
    public func someMethodWithoutInputParametersWithAllComments() -> Comments.Usefulness {
        return moveFromCType(smoke_Comments_someMethodWithoutInputParametersWithAllComments(self.c_instance))
    }
    /// This is some very useful method that measures the usefulness of something.
    public func someMethodWithoutInputParametersWithNoComments() -> Comments.Usefulness {
        return moveFromCType(smoke_Comments_someMethodWithoutInputParametersWithNoComments(self.c_instance))
    }
    public func someMethodWithNothing() -> Void {
        return moveFromCType(smoke_Comments_someMethodWithNothing(self.c_instance))
    }
    /// This is some very useful method that does nothing.
    public func someMethodWithoutReturnTypeOrInputParameters() -> Void {
        return moveFromCType(smoke_Comments_someMethodWithoutReturnTypeOrInputParameters(self.c_instance))
    }
    /// This is some very useful instance method.
    /// - Parameter input: This is some very useful instance method parameter.
    /// - Returns: This is some very useful instance method result.
    public func instanceNotNullMethod(input: CommentsInstantiable) -> CommentsInstantiable {
            let c_input = moveToCType(input)
        return CommentsInstantiablemoveFromCType(smoke_Comments_instanceNotNullMethod(self.c_instance, c_input.ref))
    }
}
extension Comments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func CommentscopyFromCType(_ handle: _baseRef) -> Comments {
    return Comments(cComments: smoke_Comments_copy_handle(handle))
}
internal func CommentsmoveFromCType(_ handle: _baseRef) -> Comments {
    return Comments(cComments: handle)
}
internal func CommentscopyFromCType(_ handle: _baseRef) -> Comments? {
    guard handle != 0 else {
        return nil
    }
    return CommentsmoveFromCType(handle) as Comments
}
internal func CommentsmoveFromCType(_ handle: _baseRef) -> Comments? {
    guard handle != 0 else {
        return nil
    }
    return CommentsmoveFromCType(handle) as Comments
}
internal func copyToCType(_ swiftClass: Comments) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Comments) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Comments?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Comments?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> Comments.SomeStruct {
    return Comments.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Comments.SomeStruct {
    defer {
        smoke_Comments_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Comments.SomeStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Comments.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Comments_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Comments.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Comments_SomeStruct_unwrap_optional_handle(handle)
    return Comments.SomeStruct(cHandle: unwrappedHandle) as Comments.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Comments.SomeStruct? {
    defer {
        smoke_Comments_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Comments.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Comments_SomeStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Comments.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Comments_SomeStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: Comments.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Comments.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Comments.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Comments.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Comments.SomeEnum {
    return Comments.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Comments.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Comments.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return Comments.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Comments.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}