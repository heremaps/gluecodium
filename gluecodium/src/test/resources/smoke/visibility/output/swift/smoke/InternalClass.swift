//
//
import Foundation
internal class InternalClass {
    let c_instance : _baseRef
    init(cInternalClass: _baseRef) {
        guard cInternalClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInternalClass
    }
    deinit {
        smoke_InternalClass_release_handle(c_instance)
    }
}
internal func getRef(_ ref: InternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_InternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_InternalClass_release_handle)
        : RefHolder(handle_copy)
}
extension InternalClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InternalClass_copyFromCType(_ handle: _baseRef) -> InternalClass {
    if let swift_pointer = smoke_InternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalClass {
        return re_constructed
    }
    let result = InternalClass(cInternalClass: smoke_InternalClass_copy_handle(handle))
    smoke_InternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func InternalClass_moveFromCType(_ handle: _baseRef) -> InternalClass {
    if let swift_pointer = smoke_InternalClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InternalClass {
        return re_constructed
    }
    let result = InternalClass(cInternalClass: handle)
    smoke_InternalClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func InternalClass_copyFromCType(_ handle: _baseRef) -> InternalClass? {
    guard handle != 0 else {
        return nil
    }
    return InternalClass_moveFromCType(handle) as InternalClass
}
internal func InternalClass_moveFromCType(_ handle: _baseRef) -> InternalClass? {
    guard handle != 0 else {
        return nil
    }
    return InternalClass_moveFromCType(handle) as InternalClass
}
internal func copyToCType(_ swiftClass: InternalClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
