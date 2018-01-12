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


internal func getRef(_ ref: SimpleInterface) -> RefHolder {
    if let instanceReference = ref as? _SimpleInterface {
        return RefHolder(instanceReference.c_instance)
    }
    var functions = smoke_SimpleInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }
    functions.smoke_SimpleInterface_setStringValue = {(swiftClass_pointer, stringValue) in
        precondition(stringValue.private_pointer != nil, "Out of memory")
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! SimpleInterface
        defer {
            std_string_release(stringValue)
        }
        return swiftClass.setStringValue(stringValue: String(data: Data(bytes: std_string_data_get(stringValue),
                                                count: Int(std_string_size_get(stringValue))), encoding: .utf8)!)
    }
    functions.smoke_SimpleInterface_getStringValue = {(swiftClass_pointer) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! SimpleInterface
        return (swiftClass.getStringValue()!).convertToCType()
    }
    let proxy = smoke_SimpleInterface_createProxy(functions)
    precondition(proxy.private_pointer != nil, "Out of memory")
    return RefHolder(ref: proxy, release: smoke_SimpleInterface_release)
}

public protocol SimpleInterface : AnyObject {


    func setStringValue(stringValue: String) -> Void
    func getStringValue() -> String?

}

internal class _SimpleInterface: SimpleInterface {


    let c_instance : _baseRef

    init?(cSimpleInterface: _baseRef) {
        c_instance = cSimpleInterface
    }

    deinit {
        smoke_SimpleInterface_release(c_instance)
    }
    public func setStringValue(stringValue: String) -> Void {
        return smoke_SimpleInterface_setStringValue(c_instance, stringValue)
    }

    public func getStringValue() -> String? {
        let result_string_handle = smoke_SimpleInterface_getStringValue(c_instance)
        precondition(result_string_handle.private_pointer != nil, "Out of memory")
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }

}
