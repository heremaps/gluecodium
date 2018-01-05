//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InheritanceChild) -> RefHolder<examples_InheritanceChildRef> {
    if let instanceReference = ref as? _InheritanceChild {
        return RefHolder<examples_InheritanceChildRef>(instanceReference.c_instance)
    }
    var functions = examples_InheritanceChild_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }
    functions.examples_InheritanceChild_childMethod = {(swiftClass_pointer, input) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! InheritanceChild
        return swiftClass.childMethod(input: input)
    }
    let proxy = examples_InheritanceChild_createProxy(functions)
    precondition(proxy.private_pointer != nil, "Out of memory")
    return RefHolder(ref: proxy, release: examples_InheritanceChild_release)
}

public protocol InheritanceChild : InheritanceParent {
    func childMethod(input: UInt8) -> Int16
}

internal class _InheritanceChild: InheritanceChild {
    let c_instance : examples_InheritanceChildRef
    required init?(cInheritanceChild: examples_InheritanceChildRef) {
        c_instance = cInheritanceChild
    }
    deinit {
        examples_InheritanceChild_release(c_instance)
    }
    public func childMethod(input: UInt8) -> Int16 {
        return examples_InheritanceChild_childMethod(c_instance, input)
    }
}
