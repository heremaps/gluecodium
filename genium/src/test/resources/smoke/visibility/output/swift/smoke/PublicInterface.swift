//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: PublicInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_PublicInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_PublicInterface_release)
            : RefHolder(handle_copy)
    }
    var functions = smoke_PublicInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_PublicInterface_createProxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_PublicInterface_release) : RefHolder(proxy)
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
    internal init(cInternalStruct: _baseRef) {
        do {
            let stringField_handle = smoke_PublicInterface_InternalStruct_stringField_get(cInternalStruct)
            defer {
                std_string_release(stringField_handle)
            }
            stringField = String(cString: std_string_data_get(stringField_handle))
        }
    }
    internal func convertToCType() -> _baseRef {
        let stringField_handle = stringField
        return smoke_PublicInterface_InternalStruct_create(stringField_handle)
    }
}
