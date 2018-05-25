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
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }

    functions.smoke_SimpleInterface_setStringValue = {(swift_class_pointer, stringValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SimpleInterface
        defer {
            std_string_release(stringValue)
        }
        return swift_class.setStringValue(stringValue: String(data: Data(bytes: std_string_data_get(stringValue),
                                                count: Int(std_string_size_get(stringValue))), encoding: .utf8)!)
    }
    functions.smoke_SimpleInterface_getStringValue = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! SimpleInterface
        return swift_class.getStringValue().convertToCType()
    }
    let proxy = smoke_SimpleInterface_createProxy(functions)
    return RefHolder(ref: proxy, release: smoke_SimpleInterface_release)
}






public protocol SimpleInterface : AnyObject {


    func setStringValue(stringValue: String) -> Void
    func getStringValue() -> String

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

    public func getStringValue() -> String {
        let result_string_handle = smoke_SimpleInterface_getStringValue(c_instance)
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)!
    }

}

extension _SimpleInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
