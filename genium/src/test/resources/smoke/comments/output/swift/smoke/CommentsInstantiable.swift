//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: CommentsInstantiable?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CommentsInstantiable_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CommentsInstantiable_release_handle)
        : RefHolder(handle_copy)
}
public class CommentsInstantiable {
    /// This is some very useful constructor.
    /// - Parameter input: Very useful input parameter
    public init(input: String) {
        let _result = CommentsInstantiable.create(input: input)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    let c_instance : _baseRef
    init(cCommentsInstantiable: _baseRef) {
        guard cCommentsInstantiable != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCommentsInstantiable
    }
    deinit {
        smoke_CommentsInstantiable_release_handle(c_instance)
    }
    private static func create(input: String) -> _baseRef {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_CommentsInstantiable_create(c_input.ref))
    }
}
extension CommentsInstantiable: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func CommentsInstantiablecopyFromCType(_ handle: _baseRef) -> CommentsInstantiable {
    return CommentsInstantiable(cCommentsInstantiable: smoke_CommentsInstantiable_copy_handle(handle))
}
internal func CommentsInstantiablemoveFromCType(_ handle: _baseRef) -> CommentsInstantiable {
    return CommentsInstantiable(cCommentsInstantiable: handle)
}
internal func CommentsInstantiablecopyFromCType(_ handle: _baseRef) -> CommentsInstantiable? {
    guard handle != 0 else {
        return nil
    }
    return CommentsInstantiablemoveFromCType(handle) as CommentsInstantiable
}
internal func CommentsInstantiablemoveFromCType(_ handle: _baseRef) -> CommentsInstantiable? {
    guard handle != 0 else {
        return nil
    }
    return CommentsInstantiablemoveFromCType(handle) as CommentsInstantiable
}
internal func copyToCType(_ swiftClass: CommentsInstantiable) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsInstantiable) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CommentsInstantiable?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsInstantiable?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
