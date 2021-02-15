//
//
import Foundation
public class SpecialAttributes {
    let c_instance : _baseRef
    init(cSpecialAttributes: _baseRef) {
        guard cSpecialAttributes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSpecialAttributes
    }
    deinit {
        smoke_SpecialAttributes_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SpecialAttributes_release_handle(c_instance)
    }
    @Deprecated("foo\nbar")
    public func withEscaping() -> Void {
        return moveFromCType(smoke_SpecialAttributes_withEscaping(self.c_instance))
    }
    @HackMerm -rf *
    public func withLineBreak() -> Void {
        return moveFromCType(smoke_SpecialAttributes_withLineBreak(self.c_instance))
    }
}
internal func getRef(_ ref: SpecialAttributes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SpecialAttributes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SpecialAttributes_release_handle)
        : RefHolder(handle_copy)
}
extension SpecialAttributes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension SpecialAttributes: Hashable {
    /// :nodoc:
    public static func == (lhs: SpecialAttributes, rhs: SpecialAttributes) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func SpecialAttributes_copyFromCType(_ handle: _baseRef) -> SpecialAttributes {
    if let swift_pointer = smoke_SpecialAttributes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SpecialAttributes {
        return re_constructed
    }
    let result = SpecialAttributes(cSpecialAttributes: smoke_SpecialAttributes_copy_handle(handle))
    smoke_SpecialAttributes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SpecialAttributes_moveFromCType(_ handle: _baseRef) -> SpecialAttributes {
    if let swift_pointer = smoke_SpecialAttributes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SpecialAttributes {
        smoke_SpecialAttributes_release_handle(handle)
        return re_constructed
    }
    let result = SpecialAttributes(cSpecialAttributes: handle)
    smoke_SpecialAttributes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SpecialAttributes_copyFromCType(_ handle: _baseRef) -> SpecialAttributes? {
    guard handle != 0 else {
        return nil
    }
    return SpecialAttributes_moveFromCType(handle) as SpecialAttributes
}
internal func SpecialAttributes_moveFromCType(_ handle: _baseRef) -> SpecialAttributes? {
    guard handle != 0 else {
        return nil
    }
    return SpecialAttributes_moveFromCType(handle) as SpecialAttributes
}
internal func copyToCType(_ swiftClass: SpecialAttributes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SpecialAttributes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SpecialAttributes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SpecialAttributes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
