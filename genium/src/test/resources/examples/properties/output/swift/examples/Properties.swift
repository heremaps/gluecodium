//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Properties?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = examples_Properties_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: examples_Properties_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = examples_Properties_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.examples_Properties_builtInTypeAttribute_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! Properties
        return copyToCType(swift_class.builtInTypeAttribute).ref
    }
    functions.examples_Properties_builtInTypeAttribute_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! Properties
        swift_class.builtInTypeAttribute = moveFromCType(newValue)
    }
    functions.examples_Properties_readonlyAttribute_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! Properties
        return copyToCType(swift_class.readonlyAttribute).ref
    }
    let proxy = examples_Properties_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: examples_Properties_release_handle) : RefHolder(proxy)
}
public protocol Properties : AnyObject {
    var builtInTypeAttribute: UInt32 { get set }
    var readonlyAttribute: Float { get }
}
internal class _Properties: Properties {
    var builtInTypeAttribute: UInt32 {
        get {
            return moveFromCType(examples_Properties_builtInTypeAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(examples_Properties_builtInTypeAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    var readonlyAttribute: Float {
        get {
            return moveFromCType(examples_Properties_readonlyAttribute_get(self.c_instance))
        }
    }
    let c_instance : _baseRef
    init(cProperties: _baseRef) {
        guard cProperties != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cProperties
    }
    deinit {
        examples_Properties_release_handle(c_instance)
    }
}
extension _Properties: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func PropertiescopyFromCType(_ handle: _baseRef) -> Properties {
    if let swift_pointer = examples_Properties_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Properties {
        return re_constructed
    }
    return _Properties(cProperties: examples_Properties_copy_handle(handle))
}
internal func PropertiesmoveFromCType(_ handle: _baseRef) -> Properties {
    if let swift_pointer = examples_Properties_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Properties {
        examples_Properties_release_handle(handle)
        return re_constructed
    }
    return _Properties(cProperties: handle)
}
internal func PropertiescopyFromCType(_ handle: _baseRef) -> Properties? {
    guard handle != 0 else {
        return nil
    }
    return PropertiesmoveFromCType(handle) as Properties
}
internal func PropertiesmoveFromCType(_ handle: _baseRef) -> Properties? {
    guard handle != 0 else {
        return nil
    }
    return PropertiesmoveFromCType(handle) as Properties
}
internal func copyToCType(_ swiftClass: Properties) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Properties) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Properties?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Properties?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}