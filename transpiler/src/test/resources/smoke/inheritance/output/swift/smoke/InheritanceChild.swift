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

internal func getRef(_ ref: InheritanceChild) -> RefHolder {
    if let instanceReference = ref as? _InheritanceChild {
        return RefHolder(instanceReference.c_instance)
    }
    var functions = smoke_InheritanceChild_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }
    functions.smoke_InheritanceRoot_rootMethod = {(swiftClass_pointer) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! InheritanceChild
        return swiftClass.rootMethod()
    }
    functions.smoke_InheritanceChild_childMethod = {(swiftClass_pointer) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! InheritanceChild
        return swiftClass.childMethod()
    }
    let proxy = smoke_InheritanceChild_createProxy(functions)
    precondition(proxy.private_pointer != nil, "Out of memory")
    return RefHolder(ref: proxy, release: smoke_InheritanceChild_release)
}

public protocol InheritanceChild : InheritanceRoot {
    var rootAttribute: String { get set }
    func rootMethod() -> Void
    func childMethod() -> Void
}

internal class _InheritanceChild: InheritanceChild {
    var rootAttribute: String {
        get {
            let result_string_handle = smoke_InheritanceRoot_rootAttribute_get(c_instance)
            precondition(result_string_handle.private_pointer != nil, "Out of memory")
            defer {
                std_string_release(result_string_handle)
            }
            return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                     count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)!
        }
        set {
            return smoke_InheritanceRoot_rootAttribute_set(c_instance, newValue)
        }
    }
    let c_instance : _baseRef
    init?(cInheritanceChild: _baseRef) {
        c_instance = cInheritanceChild
    }
    deinit {
        smoke_InheritanceChild_release(c_instance)
    }
    public func rootMethod() -> Void {
        return smoke_InheritanceRoot_rootMethod(c_instance)
    }
    public func childMethod() -> Void {
        return smoke_InheritanceChild_childMethod(c_instance)
    }
}
