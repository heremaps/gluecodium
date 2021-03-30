//
//
import Foundation
@OnClass
public class AttributesClass {
    @OnConstInClass
    public static let pi: Bool = false
    @OnPropertyInClass
    public var prop: String {
        get {
            let c_result_handle = smoke_AttributesClass_prop_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_AttributesClass_prop_set(self.c_instance, c_value.ref)
        }
    }
    let c_instance : _baseRef
    init(cAttributesClass: _baseRef) {
        guard cAttributesClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cAttributesClass
    }
    deinit {
        smoke_AttributesClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_AttributesClass_release_handle(c_instance)
    }
    @OnFunctionInClass
    public func veryFun(@OnParameterInClass param: String) -> Void {
        let c_param = moveToCType(param)
        smoke_AttributesClass_veryFun(self.c_instance, c_param.ref)
    }
}
internal func getRef(_ ref: AttributesClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_AttributesClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_AttributesClass_release_handle)
        : RefHolder(handle_copy)
}
extension AttributesClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension AttributesClass: Hashable {
    /// :nodoc:
    public static func == (lhs: AttributesClass, rhs: AttributesClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func AttributesClass_copyFromCType(_ handle: _baseRef) -> AttributesClass {
    if let swift_pointer = smoke_AttributesClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesClass {
        return re_constructed
    }
    let result = AttributesClass(cAttributesClass: smoke_AttributesClass_copy_handle(handle))
    smoke_AttributesClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func AttributesClass_moveFromCType(_ handle: _baseRef) -> AttributesClass {
    if let swift_pointer = smoke_AttributesClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesClass {
        smoke_AttributesClass_release_handle(handle)
        return re_constructed
    }
    let result = AttributesClass(cAttributesClass: handle)
    smoke_AttributesClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func AttributesClass_copyFromCType(_ handle: _baseRef) -> AttributesClass? {
    guard handle != 0 else {
        return nil
    }
    return AttributesClass_moveFromCType(handle) as AttributesClass
}
internal func AttributesClass_moveFromCType(_ handle: _baseRef) -> AttributesClass? {
    guard handle != 0 else {
        return nil
    }
    return AttributesClass_moveFromCType(handle) as AttributesClass
}
internal func copyToCType(_ swiftClass: AttributesClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: AttributesClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: AttributesClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: AttributesClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
