//
//
import Foundation
public class MultipleAttributesSwift {
    let c_instance : _baseRef
    init(cMultipleAttributesSwift: _baseRef) {
        guard cMultipleAttributesSwift != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cMultipleAttributesSwift
    }
    deinit {
        smoke_MultipleAttributesSwift_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_MultipleAttributesSwift_release_handle(c_instance)
    }
    @Foo
    @Bar
    public func noLists2() -> Void {
        return moveFromCType(smoke_MultipleAttributesSwift_noLists2(self.c_instance))
    }
    @Foo
    @Bar
    @Baz
    public func noLists3() -> Void {
        return moveFromCType(smoke_MultipleAttributesSwift_noLists3(self.c_instance))
    }
    @Foo
    @Bar
    @Baz
    public func listFirst() -> Void {
        return moveFromCType(smoke_MultipleAttributesSwift_listFirst(self.c_instance))
    }
    @Foo
    @Bar
    @Baz
    public func listSecond() -> Void {
        return moveFromCType(smoke_MultipleAttributesSwift_listSecond(self.c_instance))
    }
    @Foo
    @Bar
    @Baz
    @Fizz
    public func twoLists() -> Void {
        return moveFromCType(smoke_MultipleAttributesSwift_twoLists(self.c_instance))
    }
}
internal func getRef(_ ref: MultipleAttributesSwift?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_MultipleAttributesSwift_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_MultipleAttributesSwift_release_handle)
        : RefHolder(handle_copy)
}
extension MultipleAttributesSwift: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension MultipleAttributesSwift: Hashable {
    /// :nodoc:
    public static func == (lhs: MultipleAttributesSwift, rhs: MultipleAttributesSwift) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func MultipleAttributesSwift_copyFromCType(_ handle: _baseRef) -> MultipleAttributesSwift {
    if let swift_pointer = smoke_MultipleAttributesSwift_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? MultipleAttributesSwift {
        return re_constructed
    }
    let result = MultipleAttributesSwift(cMultipleAttributesSwift: smoke_MultipleAttributesSwift_copy_handle(handle))
    smoke_MultipleAttributesSwift_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func MultipleAttributesSwift_moveFromCType(_ handle: _baseRef) -> MultipleAttributesSwift {
    if let swift_pointer = smoke_MultipleAttributesSwift_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? MultipleAttributesSwift {
        smoke_MultipleAttributesSwift_release_handle(handle)
        return re_constructed
    }
    let result = MultipleAttributesSwift(cMultipleAttributesSwift: handle)
    smoke_MultipleAttributesSwift_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func MultipleAttributesSwift_copyFromCType(_ handle: _baseRef) -> MultipleAttributesSwift? {
    guard handle != 0 else {
        return nil
    }
    return MultipleAttributesSwift_moveFromCType(handle) as MultipleAttributesSwift
}
internal func MultipleAttributesSwift_moveFromCType(_ handle: _baseRef) -> MultipleAttributesSwift? {
    guard handle != 0 else {
        return nil
    }
    return MultipleAttributesSwift_moveFromCType(handle) as MultipleAttributesSwift
}
internal func copyToCType(_ swiftClass: MultipleAttributesSwift) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: MultipleAttributesSwift) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: MultipleAttributesSwift?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: MultipleAttributesSwift?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
