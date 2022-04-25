//
//
import Foundation
/// Something lorem something ipsum.
///
/// |  Tables  |      Are      |  Cool |
/// |----------|:-------------:|------:|
/// | col 1 is | left-aligned  | $1600 |
/// | col 2 is |   centered    |   $12 |
/// | col 3 is | right-aligned |    $1 |
public class CommentsTable {
    let c_instance : _baseRef
    init(cCommentsTable: _baseRef) {
        guard cCommentsTable != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCommentsTable
    }
    deinit {
        smoke_CommentsTable_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_CommentsTable_release_handle(c_instance)
    }
}
internal func getRef(_ ref: CommentsTable?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CommentsTable_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CommentsTable_release_handle)
        : RefHolder(handle_copy)
}
extension CommentsTable: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension CommentsTable: Hashable {
    /// :nodoc:
    public static func == (lhs: CommentsTable, rhs: CommentsTable) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func CommentsTable_copyFromCType(_ handle: _baseRef) -> CommentsTable {
    if let swift_pointer = smoke_CommentsTable_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CommentsTable {
        return re_constructed
    }
    let result = CommentsTable(cCommentsTable: smoke_CommentsTable_copy_handle(handle))
    smoke_CommentsTable_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CommentsTable_moveFromCType(_ handle: _baseRef) -> CommentsTable {
    if let swift_pointer = smoke_CommentsTable_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CommentsTable {
        smoke_CommentsTable_release_handle(handle)
        return re_constructed
    }
    let result = CommentsTable(cCommentsTable: handle)
    smoke_CommentsTable_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CommentsTable_copyFromCType(_ handle: _baseRef) -> CommentsTable? {
    guard handle != 0 else {
        return nil
    }
    return CommentsTable_moveFromCType(handle) as CommentsTable
}
internal func CommentsTable_moveFromCType(_ handle: _baseRef) -> CommentsTable? {
    guard handle != 0 else {
        return nil
    }
    return CommentsTable_moveFromCType(handle) as CommentsTable
}
internal func copyToCType(_ swiftClass: CommentsTable) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsTable) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CommentsTable?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsTable?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
