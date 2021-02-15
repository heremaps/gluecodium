//
//
import Foundation
public class SimpleClass {
    let c_instance : _baseRef
    init(cSimpleClass: _baseRef) {
        guard cSimpleClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSimpleClass
    }
    deinit {
        smoke_SimpleClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SimpleClass_release_handle(c_instance)
    }
    public func getStringValue() -> String {
        return moveFromCType(smoke_SimpleClass_getStringValue(self.c_instance))
    }
    public func useSimpleClass(input: SimpleClass) -> SimpleClass {
        let c_input = moveToCType(input)
        return SimpleClass_moveFromCType(smoke_SimpleClass_useSimpleClass(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: SimpleClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SimpleClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SimpleClass_release_handle)
        : RefHolder(handle_copy)
}
extension SimpleClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension SimpleClass: Hashable {
    /// :nodoc:
    public static func == (lhs: SimpleClass, rhs: SimpleClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func SimpleClass_copyFromCType(_ handle: _baseRef) -> SimpleClass {
    if let swift_pointer = smoke_SimpleClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SimpleClass {
        return re_constructed
    }
    let result = SimpleClass(cSimpleClass: smoke_SimpleClass_copy_handle(handle))
    smoke_SimpleClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SimpleClass_moveFromCType(_ handle: _baseRef) -> SimpleClass {
    if let swift_pointer = smoke_SimpleClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SimpleClass {
        smoke_SimpleClass_release_handle(handle)
        return re_constructed
    }
    let result = SimpleClass(cSimpleClass: handle)
    smoke_SimpleClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SimpleClass_copyFromCType(_ handle: _baseRef) -> SimpleClass? {
    guard handle != 0 else {
        return nil
    }
    return SimpleClass_moveFromCType(handle) as SimpleClass
}
internal func SimpleClass_moveFromCType(_ handle: _baseRef) -> SimpleClass? {
    guard handle != 0 else {
        return nil
    }
    return SimpleClass_moveFromCType(handle) as SimpleClass
}
internal func copyToCType(_ swiftClass: SimpleClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SimpleClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SimpleClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SimpleClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
