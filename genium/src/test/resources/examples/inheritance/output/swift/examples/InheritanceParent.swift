//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation


internal func getRef(_ ref: InheritanceParent) -> RefHolder {
    if let instanceReference = ref as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }

    var functions = examples_InheritanceParent_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }

    functions.examples_InheritanceParent_parentMethod = {(swiftClass_pointer, input) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! InheritanceParent
        defer {
            std_string_release(input)
        }
        return (swiftClass.parentMethod(input: String(data: Data(bytes: std_string_data_get(input),
                                                count: Int(std_string_size_get(input))), encoding: .utf8)!)!).convertToCType()
    }
    let proxy = examples_InheritanceParent_createProxy(functions)
    return RefHolder(ref: proxy, release: examples_InheritanceParent_release)
}

public protocol InheritanceParent : AnyObject {


    func parentMethod(input: String) -> String?

}

internal class _InheritanceParent: InheritanceParent {


    let c_instance : _baseRef

    init?(cInheritanceParent: _baseRef) {
        guard cInheritanceParent != 0 else {
            return nil
        }
        c_instance = cInheritanceParent
    }

    deinit {
        examples_InheritanceParent_release(c_instance)
    }
    public func parentMethod(input: String) -> String? {
        let result_string_handle = examples_InheritanceParent_parentMethod(c_instance, input)
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }

}

extension _InheritanceParent: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
