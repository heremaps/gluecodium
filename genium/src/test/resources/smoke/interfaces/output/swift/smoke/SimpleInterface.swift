//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation


internal func getRef(_ ref: SimpleInterface) -> RefHolder {
    if let instanceReference = ref as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }

    var functions = smoke_SimpleInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }

    functions.smoke_SimpleInterface_setStringValue = {(swiftClass_pointer, stringValue) in
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
    return RefHolder(ref: proxy, release: smoke_SimpleInterface_release)
}






public protocol SimpleInterface : AnyObject {


    func setStringValue(stringValue: String) -> Void
    func getStringValue() -> String?

}

internal class _SimpleInterface: SimpleInterface {


    let c_instance : _baseRef

    init?(cSimpleInterface: _baseRef) {
        guard cSimpleInterface != 0 else {
            return nil
        }
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
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }

}

extension _SimpleInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
