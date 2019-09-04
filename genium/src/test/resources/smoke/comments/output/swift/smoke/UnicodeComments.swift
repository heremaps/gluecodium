//
//
import Foundation
internal func getRef(_ ref: UnicodeComments?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_UnicodeComments_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_UnicodeComments_release_handle)
        : RefHolder(handle_copy)
}
public class UnicodeComments {
    let c_instance : _baseRef
    init(cUnicodeComments: _baseRef) {
        guard cUnicodeComments != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cUnicodeComments
    }
    deinit {
        smoke_UnicodeComments_release_handle(c_instance)
    }
    /// Süßölgefäß
    /// - Parameter input: שלום
    /// - Returns: товарищ
    /// - Throws: `Comments.SomethingWrongError` ネコ
    public func someMethodWithAllComments(input: String) throws -> Comments.Usefulness {
        let c_input = moveToCType(input)
        let RESULT = smoke_UnicodeComments_someMethodWithAllComments(self.c_instance, c_input.ref)
        if (RESULT.has_value) {
            return moveFromCType(RESULT.returned_value)
        } else {
            throw Comments.SomethingWrongError(rawValue: RESULT.error_code)!
        }
    }
}
extension UnicodeComments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func UnicodeCommentscopyFromCType(_ handle: _baseRef) -> UnicodeComments {
    return UnicodeComments(cUnicodeComments: smoke_UnicodeComments_copy_handle(handle))
}
internal func UnicodeCommentsmoveFromCType(_ handle: _baseRef) -> UnicodeComments {
    return UnicodeComments(cUnicodeComments: handle)
}
internal func UnicodeCommentscopyFromCType(_ handle: _baseRef) -> UnicodeComments? {
    guard handle != 0 else {
        return nil
    }
    return UnicodeCommentsmoveFromCType(handle) as UnicodeComments
}
internal func UnicodeCommentsmoveFromCType(_ handle: _baseRef) -> UnicodeComments? {
    guard handle != 0 else {
        return nil
    }
    return UnicodeCommentsmoveFromCType(handle) as UnicodeComments
}
internal func copyToCType(_ swiftClass: UnicodeComments) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: UnicodeComments) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: UnicodeComments?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: UnicodeComments?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
