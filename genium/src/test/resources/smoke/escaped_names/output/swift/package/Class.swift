//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Class?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = package_Class_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: package_Class_release_handle)
        : RefHolder(handle_copy)
}
public class Class: Interface {
    public init() {
        let _result = Class.constructor()
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    public var property: Enum {
        get {
            return moveFromCType(package_Class_property_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(package_Class_property_set(self.c_instance, c_newValue.ref))
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
        package_Class_release_handle(c_instance)
    }
    private static func constructor() -> _baseRef {
        return moveFromCType(package_Class_constructor())
    }
    public func fun(double: List) throws -> Struct {
        let c_double = moveToCType(double)
        let RESULT = package_Class_fun(self.c_instance, c_double.ref)
        if (RESULT.has_value) {
            return moveFromCType(RESULT.returned_value)
        } else {
            throw Enum(rawValue: RESULT.error_code)!
        }
    }
}
extension Class: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ClasscopyFromCType(_ handle: _baseRef) -> Class {
    return Class(cClass: package_Class_copy_handle(handle))
}
internal func ClassmoveFromCType(_ handle: _baseRef) -> Class {
    return Class(cClass: handle)
}
internal func ClasscopyFromCType(_ handle: _baseRef) -> Class? {
    guard handle != 0 else {
        return nil
    }
    return ClassmoveFromCType(handle) as Class
}
internal func ClassmoveFromCType(_ handle: _baseRef) -> Class? {
    guard handle != 0 else {
        return nil
    }
    return ClassmoveFromCType(handle) as Class
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
