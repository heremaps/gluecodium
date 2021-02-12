//
//
import Foundation
public class NestedReferences {
    let c_instance : _baseRef
    init(cNestedReferences: _baseRef) {
        guard cNestedReferences != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cNestedReferences
    }
    deinit {
        smoke_NestedReferences_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_NestedReferences_release_handle(c_instance)
    }
    public struct NestedReferences {
        public var stringField: String
        public init(stringField: String) {
            self.stringField = stringField
        }
        internal init(cHandle: _baseRef) {
            stringField = moveFromCType(smoke_NestedReferences_NestedReferences_stringField_get(cHandle))
        }
    }
    public func insideOut(struct1: NestedReferences.NestedReferences, struct2: NestedReferences.NestedReferences) -> NestedReferences {
        let c_struct1 = moveToCType(struct1)
        let c_struct2 = moveToCType(struct2)
        return NestedReferences_moveFromCType(smoke_NestedReferences_insideOut(self.c_instance, c_struct1.ref, c_struct2.ref))
    }
}
internal func getRef(_ ref: NestedReferences?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_NestedReferences_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_NestedReferences_release_handle)
        : RefHolder(handle_copy)
}
extension NestedReferences: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension NestedReferences: Hashable {
    // :nodoc:
    public static func == (lhs: NestedReferences, rhs: NestedReferences) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    // :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func NestedReferences_copyFromCType(_ handle: _baseRef) -> NestedReferences {
    if let swift_pointer = smoke_NestedReferences_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? NestedReferences {
        return re_constructed
    }
    let result = NestedReferences(cNestedReferences: smoke_NestedReferences_copy_handle(handle))
    smoke_NestedReferences_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func NestedReferences_moveFromCType(_ handle: _baseRef) -> NestedReferences {
    if let swift_pointer = smoke_NestedReferences_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? NestedReferences {
        smoke_NestedReferences_release_handle(handle)
        return re_constructed
    }
    let result = NestedReferences(cNestedReferences: handle)
    smoke_NestedReferences_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func NestedReferences_copyFromCType(_ handle: _baseRef) -> NestedReferences? {
    guard handle != 0 else {
        return nil
    }
    return NestedReferences_moveFromCType(handle) as NestedReferences
}
internal func NestedReferences_moveFromCType(_ handle: _baseRef) -> NestedReferences? {
    guard handle != 0 else {
        return nil
    }
    return NestedReferences_moveFromCType(handle) as NestedReferences
}
internal func copyToCType(_ swiftClass: NestedReferences) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: NestedReferences) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: NestedReferences?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: NestedReferences?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> NestedReferences.NestedReferences {
    return NestedReferences.NestedReferences(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> NestedReferences.NestedReferences {
    defer {
        smoke_NestedReferences_NestedReferences_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: NestedReferences.NestedReferences) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_NestedReferences_NestedReferences_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: NestedReferences.NestedReferences) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_NestedReferences_NestedReferences_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> NestedReferences.NestedReferences? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_NestedReferences_NestedReferences_unwrap_optional_handle(handle)
    return NestedReferences.NestedReferences(cHandle: unwrappedHandle) as NestedReferences.NestedReferences
}
internal func moveFromCType(_ handle: _baseRef) -> NestedReferences.NestedReferences? {
    defer {
        smoke_NestedReferences_NestedReferences_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: NestedReferences.NestedReferences?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_NestedReferences_NestedReferences_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: NestedReferences.NestedReferences?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_NestedReferences_NestedReferences_release_optional_handle)
}
