//
//
import Foundation
/// Something lorem something ipsum.
///
/// | Tables | Are | Cool |
/// |----------|:-------------:|------:|
/// | col 1 is |  `CommentsTable` | $1600 |
/// | col 2 is |`Comments.SomeEnum`|   $12 |
/// | col 3 is |`Comments.SomeEnum.useful`|    $1 |
public class CommentsTableLinks {
    let c_instance : _baseRef
    init(cCommentsTableLinks: _baseRef) {
        guard cCommentsTableLinks != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCommentsTableLinks
    }
    deinit {
        smoke_CommentsTableLinks_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_CommentsTableLinks_release_handle(c_instance)
    }
}
internal func getRef(_ ref: CommentsTableLinks?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CommentsTableLinks_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CommentsTableLinks_release_handle)
        : RefHolder(handle_copy)
}
extension CommentsTableLinks: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension CommentsTableLinks: Hashable {
    /// :nodoc:
    public static func == (lhs: CommentsTableLinks, rhs: CommentsTableLinks) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func CommentsTableLinks_copyFromCType(_ handle: _baseRef) -> CommentsTableLinks {
    if let swift_pointer = smoke_CommentsTableLinks_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CommentsTableLinks {
        return re_constructed
    }
    let result = CommentsTableLinks(cCommentsTableLinks: smoke_CommentsTableLinks_copy_handle(handle))
    smoke_CommentsTableLinks_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CommentsTableLinks_moveFromCType(_ handle: _baseRef) -> CommentsTableLinks {
    if let swift_pointer = smoke_CommentsTableLinks_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CommentsTableLinks {
        smoke_CommentsTableLinks_release_handle(handle)
        return re_constructed
    }
    let result = CommentsTableLinks(cCommentsTableLinks: handle)
    smoke_CommentsTableLinks_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CommentsTableLinks_copyFromCType(_ handle: _baseRef) -> CommentsTableLinks? {
    guard handle != 0 else {
        return nil
    }
    return CommentsTableLinks_moveFromCType(handle) as CommentsTableLinks
}
internal func CommentsTableLinks_moveFromCType(_ handle: _baseRef) -> CommentsTableLinks? {
    guard handle != 0 else {
        return nil
    }
    return CommentsTableLinks_moveFromCType(handle) as CommentsTableLinks
}
internal func copyToCType(_ swiftClass: CommentsTableLinks) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsTableLinks) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CommentsTableLinks?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsTableLinks?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
