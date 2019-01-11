//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Comments?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_Comments_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_Comments_release_handle)
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
            return examples_Comments_someAttribute_get(c_instance)
        }
        set {
            return examples_Comments_someAttribute_set(c_instance, newValue)
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
        examples_Comments_release_handle(c_instance)
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
        internal init(cHandle: _baseRef) {
            someField = examples_Comments_SomeStruct_someField_get(cHandle)
        }
        internal func convertToCType() -> _baseRef {
            let someField_handle = someField
            return examples_Comments_SomeStruct_create_handle(someField_handle)
        }
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns: Usefulness of the input
    public func someMethod(input: String) -> Comments.Usefulness {
        return examples_Comments_someMethod(c_instance, input)
    }
}
extension Comments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func copyFromCType(_ handle: _baseRef) -> Comments.SomeStruct {
    return Comments.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Comments.SomeStruct {
    defer {
        examples_Comments_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
func convertComments_SomeMapToCType(_ swiftDict: Comments.SomeMap) -> _baseRef {
    let c_handle = examples_Comments_SomeMap_create_handle()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release_handle(c_key)
        }
        let c_value = swift_value
        examples_Comments_SomeMap_put(c_handle, c_key, c_value)
    }
    return c_handle
}
func convertComments_SomeMapFromCType(_ c_handle: _baseRef) -> Comments.SomeMap {
    var swiftDict: Comments.SomeMap = [:]
    let iterator_handle = examples_Comments_SomeMap_iterator(c_handle)
    while examples_Comments_SomeMap_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = examples_Comments_SomeMap_iterator_key(iterator_handle)
        let swift_key: String = moveFromCType(c_key)
        let c_value = examples_Comments_SomeMap_iterator_value(iterator_handle)
        let swift_value = c_value
        swiftDict[swift_key] = swift_value
        examples_Comments_SomeMap_iterator_increment(iterator_handle)
    }
    examples_Comments_SomeMap_iterator_release_handle(iterator_handle)
    return swiftDict
}