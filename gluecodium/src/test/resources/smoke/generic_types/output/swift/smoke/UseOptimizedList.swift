//
//
import Foundation
public class UseOptimizedList {
    public static var lazyOnes: CollectionOf<UnreasonablyLazyClass> {
        get {
            let c_result_handle = smoke_UseOptimizedList_lazyOnes_get()
            return CollectionOf<UnreasonablyLazyClass>(
                handle: c_result_handle,
                size: smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get_size(c_result_handle),
                elementGetter: { index in UnreasonablyLazyClass_moveFromCType(smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get(c_result_handle, index)) },
                releaser: { smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_release_handle(c_result_handle) }
            )
        }
    }
    let c_instance : _baseRef
    init(cUseOptimizedList: _baseRef) {
        guard cUseOptimizedList != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cUseOptimizedList
    }
    deinit {
        smoke_UseOptimizedList_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_UseOptimizedList_release_handle(c_instance)
    }
    public static func fetchTheBigOnes() -> CollectionOf<VeryBigStruct> {
        let c_result_handle = smoke_UseOptimizedList_fetchTheBigOnes()
        return CollectionOf<VeryBigStruct>(
            handle: c_result_handle,
            size: smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get_size(c_result_handle),
            elementGetter: { index in moveFromCType(smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get(c_result_handle, index)) },
            releaser: { smoke_UseOptimizedList_smoke_VeryBigStructLazyList_release_handle(c_result_handle) }
        )
    }
}
internal func getRef(_ ref: UseOptimizedList?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_UseOptimizedList_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_UseOptimizedList_release_handle)
        : RefHolder(handle_copy)
}
extension UseOptimizedList: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension UseOptimizedList: Hashable {
    /// :nodoc:
    public static func == (lhs: UseOptimizedList, rhs: UseOptimizedList) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func UseOptimizedList_copyFromCType(_ handle: _baseRef) -> UseOptimizedList {
    if let swift_pointer = smoke_UseOptimizedList_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? UseOptimizedList {
        return re_constructed
    }
    let result = UseOptimizedList(cUseOptimizedList: smoke_UseOptimizedList_copy_handle(handle))
    smoke_UseOptimizedList_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func UseOptimizedList_moveFromCType(_ handle: _baseRef) -> UseOptimizedList {
    if let swift_pointer = smoke_UseOptimizedList_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? UseOptimizedList {
        smoke_UseOptimizedList_release_handle(handle)
        return re_constructed
    }
    let result = UseOptimizedList(cUseOptimizedList: handle)
    smoke_UseOptimizedList_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func UseOptimizedList_copyFromCType(_ handle: _baseRef) -> UseOptimizedList? {
    guard handle != 0 else {
        return nil
    }
    return UseOptimizedList_moveFromCType(handle) as UseOptimizedList
}
internal func UseOptimizedList_moveFromCType(_ handle: _baseRef) -> UseOptimizedList? {
    guard handle != 0 else {
        return nil
    }
    return UseOptimizedList_moveFromCType(handle) as UseOptimizedList
}
internal func copyToCType(_ swiftClass: UseOptimizedList) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: UseOptimizedList) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: UseOptimizedList?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: UseOptimizedList?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
