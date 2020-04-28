//
//
import Foundation
/// The nested types like `CommentsLinks.randomMethod(String, Bool)` don't need full name prefix, but it's
/// possible to references other interfaces like `CommentsInterface` or other members
/// `Comments.someMethodWithAllComments(...)`.
///
/// Weblinks are not modified like this [example] or [www.example.com].
///
/// [example]: http://example.com
public class CommentsLinks {
    let c_instance : _baseRef
    init(cCommentsLinks: _baseRef) {
        guard cCommentsLinks != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCommentsLinks
    }
    deinit {
        smoke_CommentsLinks_release_handle(c_instance)
    }
    /// Links also work in:
    public struct RandomStruct {
        /// Some random field `Comments.SomeStruct`
        public var randomField: Comments.SomeStruct
        /// constructor comments `Comments.SomeStruct`
        /// - Parameters
        ///   - randomField: Some random field `Comments.SomeStruct`
        public init(randomField: Comments.SomeStruct) {
            self.randomField = randomField
        }
        internal init(cHandle: _baseRef) {
            randomField = moveFromCType(smoke_CommentsLinks_RandomStruct_randomField_get(cHandle))
        }
    }
    /// Link types:
    /// * constant: `Comments.veryUseful`
    /// * struct: `Comments.SomeStruct`
    /// * struct field: `Comments.SomeStruct.someField`
    /// * enum: `Comments.SomeEnum`
    /// * enum item: `Comments.SomeEnum.useful`
    /// * property: `Comments.isSomeProperty`
    /// * property setter: `Comments.isSomeProperty`
    /// * property getter: `Comments.isSomeProperty`
    /// * method: `Comments.someMethodWithAllComments(...)`
    /// * method with signature: `Comments.oneParameterCommentOnly(...)`
    /// * method with signature with no spaces: `Comments.oneParameterCommentOnly(...)`
    /// * parameter: `CommentsLinks.randomMethod(Comments.SomeEnum).inputParameter`
    /// * top level constant: `CommentsTypeCollection.typeCollectionConstant`
    /// * top level struct: `TypeCollectionStruct`
    /// * top level struct field: `TypeCollectionStruct.field`
    /// * top level enum: `TypeCollectionEnum`
    /// * top level enum item: `TypeCollectionEnum.item`
    /// * error: `Comments.SomethingWrongError`
    /// * type from aux sources, same package: `AuxClass`
    /// * type from aux sources, different package: `AuxStruct`
    ///     * we can also have
    ///     * nested lists
    ///
    /// Not working for Java:
    /// * typedef: `Comments.Usefulness`
    /// * top level typedef: `TypeCollectionTypedef`
    ///
    /// Not working for Swift:
    /// * named comment: []`Comments.veryUseful`
    /// - Parameter inputParameter: Sometimes takes `Comments.SomeEnum.useful`
    /// - Returns: Sometimes returns `Comments.SomeEnum.useful`
    /// - Throws: `Comments.SomethingWrongError` May or may not throw `Comments.SomethingWrongError`
    public func randomMethod(inputParameter: Comments.SomeEnum) throws -> Comments.SomeEnum {
        let c_inputParameter = moveToCType(inputParameter)
        let RESULT = smoke_CommentsLinks_randomMethod_SomeEnum(self.c_instance, c_inputParameter.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as Comments.SomethingWrongError
        } else {
            return moveFromCType(RESULT.returned_value)
        }
    }
    /// Links to method overloads:
    /// * other one: `CommentsLinks.randomMethod(Comments.SomeEnum)`
    /// * this one: `CommentsLinks.randomMethod(String, Bool)`
    /// * ambiguous one: `CommentsLinks.randomMethod(String, Bool)`
    /// - Parameters:
    ///   - text:
    ///   - flag:
    public func randomMethod(text: String, flag: Bool) -> Void {
        let c_text = moveToCType(text)
        let c_flag = moveToCType(flag)
        return moveFromCType(smoke_CommentsLinks_randomMethod_String_Boolean(self.c_instance, c_text.ref, c_flag.ref))
    }
}
internal func getRef(_ ref: CommentsLinks?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CommentsLinks_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CommentsLinks_release_handle)
        : RefHolder(handle_copy)
}
extension CommentsLinks: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func CommentsLinks_copyFromCType(_ handle: _baseRef) -> CommentsLinks {
    if let swift_pointer = smoke_CommentsLinks_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CommentsLinks {
        return re_constructed
    }
    let result = CommentsLinks(cCommentsLinks: smoke_CommentsLinks_copy_handle(handle))
    smoke_CommentsLinks_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CommentsLinks_moveFromCType(_ handle: _baseRef) -> CommentsLinks {
    if let swift_pointer = smoke_CommentsLinks_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CommentsLinks {
        return re_constructed
    }
    let result = CommentsLinks(cCommentsLinks: handle)
    smoke_CommentsLinks_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CommentsLinks_copyFromCType(_ handle: _baseRef) -> CommentsLinks? {
    guard handle != 0 else {
        return nil
    }
    return CommentsLinks_moveFromCType(handle) as CommentsLinks
}
internal func CommentsLinks_moveFromCType(_ handle: _baseRef) -> CommentsLinks? {
    guard handle != 0 else {
        return nil
    }
    return CommentsLinks_moveFromCType(handle) as CommentsLinks
}
internal func copyToCType(_ swiftClass: CommentsLinks) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsLinks) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CommentsLinks?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsLinks?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> CommentsLinks.RandomStruct {
    return CommentsLinks.RandomStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> CommentsLinks.RandomStruct {
    defer {
        smoke_CommentsLinks_RandomStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: CommentsLinks.RandomStruct) -> RefHolder {
    let c_randomField = moveToCType(swiftType.randomField)
    return RefHolder(smoke_CommentsLinks_RandomStruct_create_handle(c_randomField.ref))
}
internal func moveToCType(_ swiftType: CommentsLinks.RandomStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_CommentsLinks_RandomStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> CommentsLinks.RandomStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_CommentsLinks_RandomStruct_unwrap_optional_handle(handle)
    return CommentsLinks.RandomStruct(cHandle: unwrappedHandle) as CommentsLinks.RandomStruct
}
internal func moveFromCType(_ handle: _baseRef) -> CommentsLinks.RandomStruct? {
    defer {
        smoke_CommentsLinks_RandomStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: CommentsLinks.RandomStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_randomField = moveToCType(swiftType.randomField)
    return RefHolder(smoke_CommentsLinks_RandomStruct_create_optional_handle(c_randomField.ref))
}
internal func moveToCType(_ swiftType: CommentsLinks.RandomStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_CommentsLinks_RandomStruct_release_optional_handle)
}
