//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Attributes) -> RefHolder {
    if let instanceReference = ref as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }

    var functions = examples_Attributes_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }

    let proxy = examples_Attributes_createProxy(functions)
    return RefHolder(ref: proxy, release: examples_Attributes_release)
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
