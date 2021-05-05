//
//
import Foundation
/// First line.
/// Second line.
///
/// Another paragraph. **bold** and *italic* and `code`.
///
/// > blockquote
///
/// # Heading one
///
/// ## Heading two
///
/// ### Heading three
///
/// Unordered list:
/// - A
/// - B
///
/// Ordered list:
/// 1. foo
/// 2. bar
///
/// ---
///
/// [title](https://www.markdownguide.org/cheat-sheet/)
public class CommentsMarkdown {
    let c_instance : _baseRef
    init(cCommentsMarkdown: _baseRef) {
        guard cCommentsMarkdown != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCommentsMarkdown
    }
    deinit {
        smoke_CommentsMarkdown_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_CommentsMarkdown_release_handle(c_instance)
    }
}
internal func getRef(_ ref: CommentsMarkdown?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CommentsMarkdown_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CommentsMarkdown_release_handle)
        : RefHolder(handle_copy)
}
extension CommentsMarkdown: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension CommentsMarkdown: Hashable {
    /// :nodoc:
    public static func == (lhs: CommentsMarkdown, rhs: CommentsMarkdown) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func CommentsMarkdown_copyFromCType(_ handle: _baseRef) -> CommentsMarkdown {
    if let swift_pointer = smoke_CommentsMarkdown_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CommentsMarkdown {
        return re_constructed
    }
    let result = CommentsMarkdown(cCommentsMarkdown: smoke_CommentsMarkdown_copy_handle(handle))
    smoke_CommentsMarkdown_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CommentsMarkdown_moveFromCType(_ handle: _baseRef) -> CommentsMarkdown {
    if let swift_pointer = smoke_CommentsMarkdown_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CommentsMarkdown {
        smoke_CommentsMarkdown_release_handle(handle)
        return re_constructed
    }
    let result = CommentsMarkdown(cCommentsMarkdown: handle)
    smoke_CommentsMarkdown_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CommentsMarkdown_copyFromCType(_ handle: _baseRef) -> CommentsMarkdown? {
    guard handle != 0 else {
        return nil
    }
    return CommentsMarkdown_moveFromCType(handle) as CommentsMarkdown
}
internal func CommentsMarkdown_moveFromCType(_ handle: _baseRef) -> CommentsMarkdown? {
    guard handle != 0 else {
        return nil
    }
    return CommentsMarkdown_moveFromCType(handle) as CommentsMarkdown
}
internal func copyToCType(_ swiftClass: CommentsMarkdown) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsMarkdown) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CommentsMarkdown?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsMarkdown?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
