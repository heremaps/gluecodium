//
//
import Foundation
/// Class comment
@OnClass
public class AttributesWithComments {
    /// Const comment
    @OnConstInClass
    public static let pi: Bool = false
    /// Property comment
    @OnPropertyInClass
    public var prop: String {
        get {
            return moveFromCType(smoke_AttributesWithComments_prop_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_AttributesWithComments_prop_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cAttributesWithComments: _baseRef) {
        guard cAttributesWithComments != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cAttributesWithComments
    }
    deinit {
        smoke_AttributesWithComments_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_AttributesWithComments_release_handle(c_instance)
    }
    public struct SomeStruct {
        /// Field comment
        @OnField
        public var field: String
        public init(field: String) {
            self.field = field
        }
        internal init(cHandle: _baseRef) {
            field = moveFromCType(smoke_AttributesWithComments_SomeStruct_field_get(cHandle))
        }
    }
    /// Function comment
    @OnFunctionInClass
    public func veryFun() -> Void {
        return moveFromCType(smoke_AttributesWithComments_veryFun(self.c_instance))
    }
}
internal func getRef(_ ref: AttributesWithComments?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_AttributesWithComments_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_AttributesWithComments_release_handle)
        : RefHolder(handle_copy)
}
extension AttributesWithComments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension AttributesWithComments: Hashable {
    /// :nodoc:
    public static func == (lhs: AttributesWithComments, rhs: AttributesWithComments) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func AttributesWithComments_copyFromCType(_ handle: _baseRef) -> AttributesWithComments {
    if let swift_pointer = smoke_AttributesWithComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesWithComments {
        return re_constructed
    }
    let result = AttributesWithComments(cAttributesWithComments: smoke_AttributesWithComments_copy_handle(handle))
    smoke_AttributesWithComments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func AttributesWithComments_moveFromCType(_ handle: _baseRef) -> AttributesWithComments {
    if let swift_pointer = smoke_AttributesWithComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesWithComments {
        smoke_AttributesWithComments_release_handle(handle)
        return re_constructed
    }
    let result = AttributesWithComments(cAttributesWithComments: handle)
    smoke_AttributesWithComments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func AttributesWithComments_copyFromCType(_ handle: _baseRef) -> AttributesWithComments? {
    guard handle != 0 else {
        return nil
    }
    return AttributesWithComments_moveFromCType(handle) as AttributesWithComments
}
internal func AttributesWithComments_moveFromCType(_ handle: _baseRef) -> AttributesWithComments? {
    guard handle != 0 else {
        return nil
    }
    return AttributesWithComments_moveFromCType(handle) as AttributesWithComments
}
internal func copyToCType(_ swiftClass: AttributesWithComments) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: AttributesWithComments) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: AttributesWithComments?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: AttributesWithComments?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> AttributesWithComments.SomeStruct {
    return AttributesWithComments.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> AttributesWithComments.SomeStruct {
    defer {
        smoke_AttributesWithComments_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: AttributesWithComments.SomeStruct) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_AttributesWithComments_SomeStruct_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: AttributesWithComments.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_AttributesWithComments_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> AttributesWithComments.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_AttributesWithComments_SomeStruct_unwrap_optional_handle(handle)
    return AttributesWithComments.SomeStruct(cHandle: unwrappedHandle) as AttributesWithComments.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> AttributesWithComments.SomeStruct? {
    defer {
        smoke_AttributesWithComments_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: AttributesWithComments.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_AttributesWithComments_SomeStruct_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: AttributesWithComments.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_AttributesWithComments_SomeStruct_release_optional_handle)
}
