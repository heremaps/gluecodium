//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation


internal func getRef(_ ref: ProfileManagerInterface) -> RefHolder {
    if let instanceReference = ref as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }

    var functions = examples_ProfileManagerInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }

    functions.examples_ProfileManagerInterface_createProfile = {(swiftClass_pointer, username) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! ProfileManagerInterface
        defer {
            std_string_release(username)
        }
        return swiftClass.createProfile(username: String(data: Data(bytes: std_string_data_get(username),
                                                count: Int(std_string_size_get(username))), encoding: .utf8)!)
    }
    let proxy = examples_ProfileManagerInterface_createProxy(functions)
    return RefHolder(ref: proxy, release: examples_ProfileManagerInterface_release)
}






public protocol ProfileManagerInterface : AnyObject {


    func createProfile(username: String) -> Void

}

internal class _ProfileManagerInterface: ProfileManagerInterface {


    let c_instance : _baseRef

    init?(cProfileManagerInterface: _baseRef) {
        guard cProfileManagerInterface != 0 else {
            return nil
        }
        c_instance = cProfileManagerInterface
    }

    deinit {
        examples_ProfileManagerInterface_release(c_instance)
    }
    public func createProfile(username: String) -> Void {
        return examples_ProfileManagerInterface_createProfile(c_instance, username)
    }

}

extension _ProfileManagerInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
