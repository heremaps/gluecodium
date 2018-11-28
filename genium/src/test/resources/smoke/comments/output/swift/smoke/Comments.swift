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
            return smoke_Comments_someAttribute_get(c_instance)
        }
        set {
            return smoke_Comments_someAttribute_set(c_instance, newValue)
        }
    }
    /// This is some very useful attribute.
    public var instanceNotNullAttribute: CommentsInstantiable {
        get {
            let cResult = smoke_Comments_instanceNotNullAttribute_get(c_instance)
            if let unwrapped_result = CommentsInstantiable(cCommentsInstantiable: cResult) {
                return unwrapped_result
            } else {
                fatalError("Nullptr value is not supported for non-optional type CommentsInstantiable")
            }
        }
        set {
            let newValue_handle = getRef(newValue)
            return smoke_Comments_instanceNotNullAttribute_set(c_instance, newValue_handle.ref)
        }
    }
    let c_instance : _baseRef
    init?(cComments: _baseRef) {
        guard cComments != 0 else {
            return nil
        }
        c_instance = cComments
    }
    deinit {
        smoke_Comments_release_handle(c_instance)
    }
    /// This is some very useful enum.
    public enum SomeEnum : UInt32 {
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
        internal init(cSomeStruct: _baseRef) {
            someField = smoke_Comments_SomeStruct_someField_get(cSomeStruct)
        }
        internal func convertToCType() -> _baseRef {
            let someField_handle = someField
            return smoke_Comments_SomeStruct_create_handle(someField_handle)
        }
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns: Usefulness of the input
    public func someMethodWithAllComments(input: String) -> Comments.Usefulness {
        return smoke_Comments_someMethodWithAllComments(c_instance, input)
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    public func someMethodWithInputComments(input: String) -> Comments.Usefulness {
        return smoke_Comments_someMethodWithInputComments(c_instance, input)
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Returns: Usefulness of the input
    public func someMethodWithOutputComments(input: String) -> Comments.Usefulness {
        return smoke_Comments_someMethodWithOutputComments(c_instance, input)
    }
    /// This is some very useful method that measures the usefulness of its input.
    public func someMethodWithNoComments(input: String) -> Comments.Usefulness {
        return smoke_Comments_someMethodWithNoComments(c_instance, input)
    }
    /// This is some very useful method that does not measure the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    public func someMethodWithoutReturnTypeWithAllComments(input: String) -> Void {
        return smoke_Comments_someMethodWithoutReturnTypeWithAllComments(c_instance, input)
    }
    /// This is some very useful method that does not measure the usefulness of its input.
    public func someMethodWithoutReturnTypeWithNoComments(input: String) -> Void {
        return smoke_Comments_someMethodWithoutReturnTypeWithNoComments(c_instance, input)
    }
    /// This is some very useful method that measures the usefulness of something.
    /// - Returns: Usefulness of the input
    public func someMethodWithoutInputParametersWithAllComments() -> Comments.Usefulness {
        return smoke_Comments_someMethodWithoutInputParametersWithAllComments(c_instance)
    }
    /// This is some very useful method that measures the usefulness of something.
    public func someMethodWithoutInputParametersWithNoComments() -> Comments.Usefulness {
        return smoke_Comments_someMethodWithoutInputParametersWithNoComments(c_instance)
    }
    public func someMethodWithNothing() -> Void {
        return smoke_Comments_someMethodWithNothing(c_instance)
    }
    /// This is some very useful method that does nothing.
    public func someMethodWithoutReturnTypeOrInputParameters() -> Void {
        return smoke_Comments_someMethodWithoutReturnTypeOrInputParameters(c_instance)
    }
    /// This is some very useful instance method.
    /// - Parameter input: This is some very useful instance method parameter.
    /// - Returns: This is some very useful instance method result.
    public func instanceNotNullMethod(input: CommentsInstantiable) -> CommentsInstantiable {
        let input_handle = getRef(input)
        let cResult = smoke_Comments_instanceNotNullMethod(c_instance, input_handle.ref)
        if let unwrapped_result = CommentsInstantiable(cCommentsInstantiable: cResult) {
            return unwrapped_result
        } else {
            fatalError("Nullptr value is not supported for non-optional type CommentsInstantiable")
        }
    }
}
extension Comments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
func convertComments_SomeMapToCType(_ swiftDict: Comments.SomeMap) -> _baseRef {
    let c_handle = smoke_Comments_SomeMap_create_handle()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release_handle(c_key)
        }
        let c_value = swift_value
        smoke_Comments_SomeMap_put(c_handle, c_key, c_value)
    }
    return c_handle
}
func convertComments_SomeMapFromCType(_ c_handle: _baseRef) -> Comments.SomeMap {
    var swiftDict: Comments.SomeMap = [:]
    let iterator_handle = smoke_Comments_SomeMap_iterator(c_handle)
    while smoke_Comments_SomeMap_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Comments_SomeMap_iterator_key(iterator_handle)
        defer {
            std_string_release_handle(c_key)
        }
        let swift_key = String(data: Data(bytes: std_string_data_get(c_key),
                                            count: Int(std_string_size_get(c_key))),
                                            encoding: .utf8)
        let c_value = smoke_Comments_SomeMap_iterator_value(iterator_handle)
        let swift_value = c_value
        swiftDict[swift_key!] = swift_value
        smoke_Comments_SomeMap_iterator_increment(iterator_handle)
    }
    smoke_Comments_SomeMap_iterator_release_handle(iterator_handle)
    return swiftDict
}
