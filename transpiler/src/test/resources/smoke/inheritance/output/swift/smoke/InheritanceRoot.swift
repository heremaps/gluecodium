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

internal func getRef(_ ref: InheritanceRoot) -> RefHolder {
    if let instanceReference = ref as? _InheritanceRoot {
        return RefHolder(instanceReference.c_instance)
    }
    var functions = smoke_InheritanceRoot_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }
    functions.smoke_InheritanceRoot_rootMethod = {(swiftClass_pointer) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! InheritanceRoot
        return swiftClass.rootMethod()
    }
    let proxy = smoke_InheritanceRoot_createProxy(functions)
    return RefHolder(ref: proxy, release: smoke_InheritanceRoot_release)
}

public protocol InheritanceRoot : AnyObject {
    var rootAttribute: String { get set }
    func rootMethod() -> Void
}

internal class _InheritanceRoot: InheritanceRoot {
    var rootAttribute: String {
        get {
            let result_string_handle = smoke_InheritanceRoot_rootAttribute_get(c_instance)
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
    init?(cInheritanceRoot: _baseRef) {
        guard cInheritanceRoot != 0 else {
            return nil
        }
        c_instance = cInheritanceRoot
    }
    deinit {
        smoke_InheritanceRoot_release(c_instance)
    }
    public func rootMethod() -> Void {
        return smoke_InheritanceRoot_rootMethod(c_instance)
    }
}
