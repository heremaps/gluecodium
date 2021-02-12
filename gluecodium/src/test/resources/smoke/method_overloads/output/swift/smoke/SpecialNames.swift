//
//
import Foundation
public class SpecialNames {
    let c_instance : _baseRef
    init(cSpecialNames: _baseRef) {
        guard cSpecialNames != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSpecialNames
    }
    deinit {
        smoke_SpecialNames_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SpecialNames_release_handle(c_instance)
    }
    public func create() -> Void {
        return moveFromCType(smoke_SpecialNames_create(self.c_instance))
    }
    public func release() -> Void {
        return moveFromCType(smoke_SpecialNames_release(self.c_instance))
    }
    public func createProxy() -> Void {
        return moveFromCType(smoke_SpecialNames_createProxy(self.c_instance))
    }
    public func Uppercase() -> Void {
        return moveFromCType(smoke_SpecialNames_Uppercase(self.c_instance))
    }
}
internal func getRef(_ ref: SpecialNames?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SpecialNames_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SpecialNames_release_handle)
        : RefHolder(handle_copy)
}
extension SpecialNames: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension SpecialNames: Hashable {
    // :nodoc:
    public static func == (lhs: SpecialNames, rhs: SpecialNames) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    // :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func SpecialNames_copyFromCType(_ handle: _baseRef) -> SpecialNames {
    if let swift_pointer = smoke_SpecialNames_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SpecialNames {
        return re_constructed
    }
    let result = SpecialNames(cSpecialNames: smoke_SpecialNames_copy_handle(handle))
    smoke_SpecialNames_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SpecialNames_moveFromCType(_ handle: _baseRef) -> SpecialNames {
    if let swift_pointer = smoke_SpecialNames_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SpecialNames {
        smoke_SpecialNames_release_handle(handle)
        return re_constructed
    }
    let result = SpecialNames(cSpecialNames: handle)
    smoke_SpecialNames_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SpecialNames_copyFromCType(_ handle: _baseRef) -> SpecialNames? {
    guard handle != 0 else {
        return nil
    }
    return SpecialNames_moveFromCType(handle) as SpecialNames
}
internal func SpecialNames_moveFromCType(_ handle: _baseRef) -> SpecialNames? {
    guard handle != 0 else {
        return nil
    }
    return SpecialNames_moveFromCType(handle) as SpecialNames
}
internal func copyToCType(_ swiftClass: SpecialNames) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SpecialNames) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SpecialNames?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SpecialNames?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
