//
//
import Foundation
/// This is some very useful interface.
public class Comments {
    /// This is some very useful typedef.
    public typealias Usefulness = Bool
    /// This is some very useful array.
    public typealias SomeArray = [String]
    /// This is some very useful map.
    public typealias SomeMap = [String: Comments.Usefulness]
    /// This is some very useful constant.
    public static let veryUseful: Comments.Usefulness = true
    /// Some very useful property.
    public var isSomeProperty: Comments.Usefulness {
        get {
            return moveFromCType(examples_Comments_someProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(examples_Comments_someProperty_set(self.c_instance, c_newValue.ref))
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
            someField = moveFromCType(examples_Comments_SomeStruct_someField_get(cHandle))
        }
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns: Usefulness of the input
    public func someMethod(input: String) -> Comments.Usefulness {
        let c_input = moveToCType(input)
        return moveFromCType(examples_Comments_someMethod(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: Comments?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_Comments_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_Comments_release_handle)
        : RefHolder(handle_copy)
}
extension Comments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func CommentscopyFromCType(_ handle: _baseRef) -> Comments {
    return Comments(cComments: examples_Comments_copy_handle(handle))
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
        examples_Comments_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Comments.SomeStruct) -> RefHolder {
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(examples_Comments_SomeStruct_create_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: Comments.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Comments_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Comments.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = examples_Comments_SomeStruct_unwrap_optional_handle(handle)
    return Comments.SomeStruct(cHandle: unwrappedHandle) as Comments.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Comments.SomeStruct? {
    defer {
        examples_Comments_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Comments.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(examples_Comments_SomeStruct_create_optional_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: Comments.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Comments_SomeStruct_release_optional_handle)
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
