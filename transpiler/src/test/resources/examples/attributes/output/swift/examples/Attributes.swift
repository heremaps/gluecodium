//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Attributes) -> RefHolder<examples_AttributesRef> {
    if let instanceReference = ref as? _Attributes {
        return RefHolder<examples_AttributesRef>(instanceReference.c_instance)
    }
    var functions = examples_Attributes_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }
    let proxy = examples_Attributes_createProxy(functions)
    precondition(proxy.private_pointer != nil, "Out of memory")
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
    let c_instance : examples_AttributesRef

    required init?(cAttributes: examples_AttributesRef) {
        c_instance = cAttributes
    }

    deinit {
        examples_Attributes_release(c_instance)
    }
}
