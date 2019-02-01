//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Attributes?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = examples_Attributes_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: examples_Attributes_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = examples_Attributes_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.examples_Attributes_builtInTypeAttribute_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! Attributes
        return copyToCType(swift_class.builtInTypeAttribute).ref
    }
    functions.examples_Attributes_builtInTypeAttribute_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! Attributes
        swift_class.builtInTypeAttribute = moveFromCType(newValue)
    }
    functions.examples_Attributes_readonlyAttribute_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! Attributes
        return copyToCType(swift_class.readonlyAttribute).ref
    }
    let proxy = examples_Attributes_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: examples_Attributes_release_handle) : RefHolder(proxy)
}
public protocol Attributes : AnyObject {
    var builtInTypeAttribute: UInt32 { get set }
    var readonlyAttribute: Float { get }
}
internal class _Attributes: Attributes {
    var builtInTypeAttribute: UInt32 {
        get {
            return moveFromCType(examples_Attributes_builtInTypeAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(examples_Attributes_builtInTypeAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    var readonlyAttribute: Float {
        get {
            return moveFromCType(examples_Attributes_readonlyAttribute_get(self.c_instance))
        }
    }
    let c_instance : _baseRef
    init(cAttributes: _baseRef) {
        guard cAttributes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cAttributes
    }
    deinit {
        examples_Attributes_release_handle(c_instance)
    }
}
extension _Attributes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func AttributescopyFromCType(_ handle: _baseRef) -> Attributes {
    if let swift_pointer = examples_Attributes_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Attributes {
        return re_constructed
    }
    return _Attributes(cAttributes: examples_Attributes_copy_handle(handle))
}
internal func AttributesmoveFromCType(_ handle: _baseRef) -> Attributes {
    if let swift_pointer = examples_Attributes_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Attributes {
        examples_Attributes_release_handle(handle)
        return re_constructed
    }
    return _Attributes(cAttributes: handle)
}
internal func AttributescopyFromCType(_ handle: _baseRef) -> Attributes? {
    guard handle != 0 else {
        return nil
    }
    return AttributesmoveFromCType(handle) as Attributes
}
internal func AttributesmoveFromCType(_ handle: _baseRef) -> Attributes? {
    guard handle != 0 else {
        return nil
    }
    return AttributesmoveFromCType(handle) as Attributes
}
internal func copyToCType(_ swiftClass: Attributes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Attributes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Attributes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Attributes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}