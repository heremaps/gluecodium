//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: PublicInterface) -> RefHolder {
    if let instanceReference = ref as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }
    var functions = smoke_PublicInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }
    let proxy = smoke_PublicInterface_createProxy(functions)
    return RefHolder(ref: proxy, release: smoke_PublicInterface_release)
}

public protocol PublicInterface : AnyObject {
}

internal class _PublicInterface: PublicInterface {
    let c_instance : _baseRef
    init?(cPublicInterface: _baseRef) {
        guard cPublicInterface != 0 else {
            return nil
        }
        c_instance = cPublicInterface
    }
    deinit {
        smoke_PublicInterface_release(c_instance)
    }
}

extension _PublicInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

internal struct InternalStruct {
    public var stringField: String
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init?(cInternalStruct: _baseRef) {
        do {
            let stringFieldHandle = smoke_PublicInterface_InternalStruct_stringField_get(cInternalStruct)
            defer {
                std_string_release(stringFieldHandle)
            }
            stringField = String(cString: std_string_data_get(stringFieldHandle))
        }
    }
    internal func convertToCType() -> _baseRef {
        let result = smoke_PublicInterface_InternalStruct_create()
        fillFunction(result)
        return result
    }
    internal func fillFunction(_ cInternalStruct: _baseRef) -> Void {
        smoke_PublicInterface_InternalStruct_stringField_set(cInternalStruct, stringField)
    }
}
