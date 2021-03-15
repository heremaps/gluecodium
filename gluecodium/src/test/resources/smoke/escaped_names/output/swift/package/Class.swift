//
//
import Foundation
public class Class: Interface {
    public init() {
        let _result = Class.constructor()
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        package_Class_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    public var property: Enum {
        get {
            return moveFromCType(package_Class_property_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(package_Class_property_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cClass: _baseRef) {
        guard cClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cClass
    }
    deinit {
        package_Class_remove_swift_object_from_wrapper_cache(c_instance)
        package_Class_release_handle(c_instance)
    }
    private static func constructor() -> _baseRef {
        return moveFromCType(package_Class_constructor())
    }
    public func fun(double: List) throws -> Struct {
        let c_double = foobar_moveToCType(double)
        let RESULT = package_Class_fun(self.c_instance, c_double.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as ExceptionError
        } else {
            return moveFromCType(RESULT.returned_value)
        }
    }
}
@_cdecl("_CBridgeInitpackage_Class")
internal func _CBridgeInitpackage_Class(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = Class(cClass: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: Class?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = package_Class_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: package_Class_release_handle)
        : RefHolder(handle_copy)
}
extension Class: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension Class: Hashable {
    /// :nodoc:
    public static func == (lhs: Class, rhs: Class) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func Class_copyFromCType(_ handle: _baseRef) -> Class {
    if let swift_pointer = package_Class_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Class {
        return re_constructed
    }
    if let swift_pointer = package_Class_get_typed(package_Class_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Class {
        package_Class_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func Class_moveFromCType(_ handle: _baseRef) -> Class {
    if let swift_pointer = package_Class_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Class {
        package_Class_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = package_Class_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Class {
        package_Class_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func Class_copyFromCType(_ handle: _baseRef) -> Class? {
    guard handle != 0 else {
        return nil
    }
    return Class_moveFromCType(handle) as Class
}
internal func Class_moveFromCType(_ handle: _baseRef) -> Class? {
    guard handle != 0 else {
        return nil
    }
    return Class_moveFromCType(handle) as Class
}
internal func copyToCType(_ swiftClass: Class) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Class) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Class?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Class?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
