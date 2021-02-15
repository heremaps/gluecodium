//
//
import Foundation
@available(*, deprecated)
@OnClass
public class AttributesWithDeprecated {
    @available(*, deprecated)
    @OnConstInClass
    public static let pi: Bool = false
    @available(*, deprecated)
    @OnPropertyInClass
    public var prop: String {
        get {
            return moveFromCType(smoke_AttributesWithDeprecated_prop_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_AttributesWithDeprecated_prop_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cAttributesWithDeprecated: _baseRef) {
        guard cAttributesWithDeprecated != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cAttributesWithDeprecated
    }
    deinit {
        smoke_AttributesWithDeprecated_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_AttributesWithDeprecated_release_handle(c_instance)
    }
    public struct SomeStruct {
        @available(*, deprecated)
        @OnField
        public var field: String
        public init(field: String) {
            self.field = field
        }
        internal init(cHandle: _baseRef) {
            field = moveFromCType(smoke_AttributesWithDeprecated_SomeStruct_field_get(cHandle))
        }
    }
    ///
    @available(*, deprecated)
    @OnFunctionInClass
    public func veryFun() -> Void {
        return moveFromCType(smoke_AttributesWithDeprecated_veryFun(self.c_instance))
    }
}
internal func getRef(_ ref: AttributesWithDeprecated?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_AttributesWithDeprecated_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_AttributesWithDeprecated_release_handle)
        : RefHolder(handle_copy)
}
extension AttributesWithDeprecated: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension AttributesWithDeprecated: Hashable {
    /// :nodoc:
    public static func == (lhs: AttributesWithDeprecated, rhs: AttributesWithDeprecated) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func AttributesWithDeprecated_copyFromCType(_ handle: _baseRef) -> AttributesWithDeprecated {
    if let swift_pointer = smoke_AttributesWithDeprecated_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesWithDeprecated {
        return re_constructed
    }
    let result = AttributesWithDeprecated(cAttributesWithDeprecated: smoke_AttributesWithDeprecated_copy_handle(handle))
    smoke_AttributesWithDeprecated_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func AttributesWithDeprecated_moveFromCType(_ handle: _baseRef) -> AttributesWithDeprecated {
    if let swift_pointer = smoke_AttributesWithDeprecated_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesWithDeprecated {
        smoke_AttributesWithDeprecated_release_handle(handle)
        return re_constructed
    }
    let result = AttributesWithDeprecated(cAttributesWithDeprecated: handle)
    smoke_AttributesWithDeprecated_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func AttributesWithDeprecated_copyFromCType(_ handle: _baseRef) -> AttributesWithDeprecated? {
    guard handle != 0 else {
        return nil
    }
    return AttributesWithDeprecated_moveFromCType(handle) as AttributesWithDeprecated
}
internal func AttributesWithDeprecated_moveFromCType(_ handle: _baseRef) -> AttributesWithDeprecated? {
    guard handle != 0 else {
        return nil
    }
    return AttributesWithDeprecated_moveFromCType(handle) as AttributesWithDeprecated
}
internal func copyToCType(_ swiftClass: AttributesWithDeprecated) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: AttributesWithDeprecated) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: AttributesWithDeprecated?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: AttributesWithDeprecated?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> AttributesWithDeprecated.SomeStruct {
    return AttributesWithDeprecated.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> AttributesWithDeprecated.SomeStruct {
    defer {
        smoke_AttributesWithDeprecated_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: AttributesWithDeprecated.SomeStruct) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_AttributesWithDeprecated_SomeStruct_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: AttributesWithDeprecated.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_AttributesWithDeprecated_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> AttributesWithDeprecated.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_AttributesWithDeprecated_SomeStruct_unwrap_optional_handle(handle)
    return AttributesWithDeprecated.SomeStruct(cHandle: unwrappedHandle) as AttributesWithDeprecated.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> AttributesWithDeprecated.SomeStruct? {
    defer {
        smoke_AttributesWithDeprecated_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: AttributesWithDeprecated.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_AttributesWithDeprecated_SomeStruct_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: AttributesWithDeprecated.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_AttributesWithDeprecated_SomeStruct_release_optional_handle)
}
