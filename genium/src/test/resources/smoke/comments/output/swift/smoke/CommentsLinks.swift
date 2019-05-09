//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: CommentsLinks?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CommentsLinks_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CommentsLinks_release_handle)
        : RefHolder(handle_copy)
}
/// The nested types like `CommentsLinks.randomMethod(...)` don't need full name prefix, but it's
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
    public enum TooUseful : UInt32, CaseIterable {
        case twice
        case threeTimes
    }
    /// Link types:
    /// * constant: `Comments.veryUseful`
    /// * struct: `Comments.SomeStruct`
    /// * struct field: `Comments.SomeStruct.someField`
    /// * enum: `Comments.SomeEnum`
    /// * enum item: `Comments.SomeEnum.useful`
    /// * attribute: `Comments.someAttribute`
    /// * method: `Comments.instanceMethod(...)`
    /// * top level constant: `CommentsTypeCollection.typeCollectionConstant`
    /// * top level struct: `TypeCollectionStruct`
    /// * top level struct field: `TypeCollectionStruct.field`
    /// * top level enum: `TypeCollectionEnum`
    /// * top level enum item: `TypeCollectionEnum.item`
    ///
    /// Not working for Java:
    /// * typedef: `Comments.Usefulness`
    /// * array: `Comments.SomeArray`
    /// * map: `Comments.SomeMap`
    /// * top level typedef: `TypeCollectionTypedef`
    ///
    /// Not working for Swift:
    /// * named comment: []`Comments.veryUseful`
    ///
    /// Not working:
    /// * error: [TooUsefulException]
    /// * input parameter: [inputParameter]
    /// * output parameter: [outputParameter]
    /// - Throws: CommentsLinks.TooUseful
    public func randomMethod(inputParameter: Comments.SomeEnum) throws -> Comments.SomeEnum {
        let c_inputParameter = moveToCType(inputParameter)
        let RESULT = smoke_CommentsLinks_randomMethod(self.c_instance, c_inputParameter.ref)
        if (RESULT.has_value) {
            return moveFromCType(RESULT.returned_value)
        } else {
            throw CommentsLinks.TooUseful(rawValue: RESULT.error_code)!
        }
    }
}
extension CommentsLinks: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func CommentsLinkscopyFromCType(_ handle: _baseRef) -> CommentsLinks {
    return CommentsLinks(cCommentsLinks: smoke_CommentsLinks_copy_handle(handle))
}
internal func CommentsLinksmoveFromCType(_ handle: _baseRef) -> CommentsLinks {
    return CommentsLinks(cCommentsLinks: handle)
}
internal func CommentsLinkscopyFromCType(_ handle: _baseRef) -> CommentsLinks? {
    guard handle != 0 else {
        return nil
    }
    return CommentsLinksmoveFromCType(handle) as CommentsLinks
}
internal func CommentsLinksmoveFromCType(_ handle: _baseRef) -> CommentsLinks? {
    guard handle != 0 else {
        return nil
    }
    return CommentsLinksmoveFromCType(handle) as CommentsLinks
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
internal func copyToCType(_ swiftEnum: CommentsLinks.TooUseful) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: CommentsLinks.TooUseful) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: CommentsLinks.TooUseful?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: CommentsLinks.TooUseful?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> CommentsLinks.TooUseful {
    return CommentsLinks.TooUseful(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> CommentsLinks.TooUseful {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> CommentsLinks.TooUseful? {
    guard handle != 0 else {
        return nil
    }
    return CommentsLinks.TooUseful(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> CommentsLinks.TooUseful? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}