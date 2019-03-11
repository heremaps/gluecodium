//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InheritanceChild) -> RefHolder {
    if let instanceReference = ref as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }
    var functions = examples_InheritanceChild_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }
    functions.examples_InheritanceParent_parentMethod = {(swiftClass_pointer, input) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! InheritanceChild
        defer {
            std_string_release(input)
        }
        return (swiftClass.parentMethod(input: String(data: Data(bytes: std_string_data_get(input),
                                                count: Int(std_string_size_get(input))), encoding: .utf8)!)!).convertToCType()
    }
    functions.examples_InheritanceChild_childMethod = {(swiftClass_pointer, input) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! InheritanceChild
        return swiftClass.childMethod(input: input)
    }
    let proxy = examples_InheritanceChild_createProxy(functions)
    return RefHolder(ref: proxy, release: examples_InheritanceChild_release)
}

public protocol InheritanceChild : InheritanceParent {
    func parentMethod(input: String) -> String?
    func childMethod(input: UInt8) -> Int16
}

internal class _InheritanceChild: InheritanceChild {
    let c_instance : _baseRef
    init?(cInheritanceChild: _baseRef) {
        guard cInheritanceChild != 0 else {
            return nil
        }
        c_instance = cInheritanceChild
    }
    deinit {
        examples_InheritanceChild_release(c_instance)
    }
    public func parentMethod(input: String) -> String? {
        let result_string_handle = examples_InheritanceParent_parentMethod(c_instance, input)
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }
    public func childMethod(input: UInt8) -> Int16 {
        return examples_InheritanceChild_childMethod(c_instance, input)
    }
}

extension _InheritanceChild: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
