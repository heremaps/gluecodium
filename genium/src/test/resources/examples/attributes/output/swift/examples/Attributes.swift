//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Attributes?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }
    var functions = examples_Attributes_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = examples_Attributes_createProxy(functions)
    return owning ? RefHolder(ref: proxy, release: examples_Attributes_release) : RefHolder(proxy)
}

public protocol Attributes : AnyObject {

    var builtInTypeAttribute: UInt32 { get set }

    var readonlyAttribute: Float { get }
}

internal class _Attributes: Attributes {



    var builtInTypeAttribute: UInt32 {
        get {
            return examples_Attributes_builtInTypeAttribute_get(c_instance)
        }
        set {
            return examples_Attributes_builtInTypeAttribute_set(c_instance, newValue)
        }
    }

    var readonlyAttribute: Float {
        get {
            return examples_Attributes_readonlyAttribute_get(c_instance)
        }

    }
    let c_instance : _baseRef

    init?(cAttributes: _baseRef) {
        guard cAttributes != 0 else {
            return nil
        }
        c_instance = cAttributes
    }

    deinit {
        examples_Attributes_release(c_instance)
    }
}

extension _Attributes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
