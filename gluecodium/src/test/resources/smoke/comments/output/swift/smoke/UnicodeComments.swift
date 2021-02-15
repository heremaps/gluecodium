//
//
import Foundation
public class UnicodeComments {
    let c_instance : _baseRef
    init(cUnicodeComments: _baseRef) {
        guard cUnicodeComments != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cUnicodeComments
    }
    deinit {
        smoke_UnicodeComments_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_UnicodeComments_release_handle(c_instance)
    }
    /// Süßölgefäß
    /// - Parameter input: שלום
    /// - Returns: товарищ
    /// - Throws: `Comments.SomethingWrongError` ネコ
    public func someMethodWithAllComments(input: String) throws -> Comments.Usefulness {
        let c_input = moveToCType(input)
        let RESULT = smoke_UnicodeComments_someMethodWithAllComments(self.c_instance, c_input.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as Comments.SomethingWrongError
        } else {
            return moveFromCType(RESULT.returned_value)
        }
    }
}
internal func getRef(_ ref: UnicodeComments?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_UnicodeComments_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_UnicodeComments_release_handle)
        : RefHolder(handle_copy)
}
extension UnicodeComments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension UnicodeComments: Hashable {
    /// :nodoc:
    public static func == (lhs: UnicodeComments, rhs: UnicodeComments) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func UnicodeComments_copyFromCType(_ handle: _baseRef) -> UnicodeComments {
    if let swift_pointer = smoke_UnicodeComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? UnicodeComments {
        return re_constructed
    }
    let result = UnicodeComments(cUnicodeComments: smoke_UnicodeComments_copy_handle(handle))
    smoke_UnicodeComments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func UnicodeComments_moveFromCType(_ handle: _baseRef) -> UnicodeComments {
    if let swift_pointer = smoke_UnicodeComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? UnicodeComments {
        smoke_UnicodeComments_release_handle(handle)
        return re_constructed
    }
    let result = UnicodeComments(cUnicodeComments: handle)
    smoke_UnicodeComments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func UnicodeComments_copyFromCType(_ handle: _baseRef) -> UnicodeComments? {
    guard handle != 0 else {
        return nil
    }
    return UnicodeComments_moveFromCType(handle) as UnicodeComments
}
internal func UnicodeComments_moveFromCType(_ handle: _baseRef) -> UnicodeComments? {
    guard handle != 0 else {
        return nil
    }
    return UnicodeComments_moveFromCType(handle) as UnicodeComments
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
