//
//
import Foundation
public class SkipTypes {
    let c_instance : _baseRef
    init(cSkipTypes: _baseRef) {
        guard cSkipTypes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSkipTypes
    }
    deinit {
        smoke_SkipTypes_release_handle(c_instance)
    }
    public struct NotInJava {
        public var fooField: String
        public init(fooField: String) {
            self.fooField = fooField
        }
        internal init(cHandle: _baseRef) {
            fooField = moveFromCType(smoke_SkipTypes_NotInJava_fooField_get(cHandle))
        }
    }
    public struct NotInDart {
        public var fooField: String
        public init(fooField: String) {
            self.fooField = fooField
        }
        internal init(cHandle: _baseRef) {
            fooField = moveFromCType(smoke_SkipTypes_NotInDart_fooField_get(cHandle))
        }
    }
}
internal func getRef(_ ref: SkipTypes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SkipTypes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SkipTypes_release_handle)
        : RefHolder(handle_copy)
}
extension SkipTypes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func SkipTypes_copyFromCType(_ handle: _baseRef) -> SkipTypes {
    if let swift_pointer = smoke_SkipTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipTypes {
        return re_constructed
    }
    let result = SkipTypes(cSkipTypes: smoke_SkipTypes_copy_handle(handle))
    smoke_SkipTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SkipTypes_moveFromCType(_ handle: _baseRef) -> SkipTypes {
    if let swift_pointer = smoke_SkipTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SkipTypes {
        return re_constructed
    }
    let result = SkipTypes(cSkipTypes: handle)
    smoke_SkipTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SkipTypes_copyFromCType(_ handle: _baseRef) -> SkipTypes? {
    guard handle != 0 else {
        return nil
    }
    return SkipTypes_moveFromCType(handle) as SkipTypes
}
internal func SkipTypes_moveFromCType(_ handle: _baseRef) -> SkipTypes? {
    guard handle != 0 else {
        return nil
    }
    return SkipTypes_moveFromCType(handle) as SkipTypes
}
internal func copyToCType(_ swiftClass: SkipTypes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipTypes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SkipTypes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipTypes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> SkipTypes.NotInJava {
    return SkipTypes.NotInJava(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> SkipTypes.NotInJava {
    defer {
        smoke_SkipTypes_NotInJava_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SkipTypes.NotInJava) -> RefHolder {
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_SkipTypes_NotInJava_create_handle(c_fooField.ref))
}
internal func moveToCType(_ swiftType: SkipTypes.NotInJava) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SkipTypes_NotInJava_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> SkipTypes.NotInJava? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_SkipTypes_NotInJava_unwrap_optional_handle(handle)
    return SkipTypes.NotInJava(cHandle: unwrappedHandle) as SkipTypes.NotInJava
}
internal func moveFromCType(_ handle: _baseRef) -> SkipTypes.NotInJava? {
    defer {
        smoke_SkipTypes_NotInJava_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SkipTypes.NotInJava?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_SkipTypes_NotInJava_create_optional_handle(c_fooField.ref))
}
internal func moveToCType(_ swiftType: SkipTypes.NotInJava?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SkipTypes_NotInJava_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> SkipTypes.NotInDart {
    return SkipTypes.NotInDart(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> SkipTypes.NotInDart {
    defer {
        smoke_SkipTypes_NotInDart_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SkipTypes.NotInDart) -> RefHolder {
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_SkipTypes_NotInDart_create_handle(c_fooField.ref))
}
internal func moveToCType(_ swiftType: SkipTypes.NotInDart) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SkipTypes_NotInDart_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> SkipTypes.NotInDart? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_SkipTypes_NotInDart_unwrap_optional_handle(handle)
    return SkipTypes.NotInDart(cHandle: unwrappedHandle) as SkipTypes.NotInDart
}
internal func moveFromCType(_ handle: _baseRef) -> SkipTypes.NotInDart? {
    defer {
        smoke_SkipTypes_NotInDart_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SkipTypes.NotInDart?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_fooField = moveToCType(swiftType.fooField)
    return RefHolder(smoke_SkipTypes_NotInDart_create_optional_handle(c_fooField.ref))
}
internal func moveToCType(_ swiftType: SkipTypes.NotInDart?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SkipTypes_NotInDart_release_optional_handle)
}
