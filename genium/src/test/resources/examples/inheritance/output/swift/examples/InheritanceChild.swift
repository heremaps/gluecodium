//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InheritanceChild?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = examples_InheritanceChild_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: examples_InheritanceChild_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = examples_InheritanceChild_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.examples_InheritanceParent_parentMethod = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceChild
        defer {
            std_string_release_handle(input)
        }
        return swift_class.parentMethod(input: String(data: Data(bytes: std_string_data_get(input),
                                                count: Int(std_string_size_get(input))), encoding: .utf8)!).convertToCType()
    }
    functions.examples_InheritanceChild_childMethod = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceChild
        return swift_class.childMethod(input: input)
    }
    let proxy = examples_InheritanceChild_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: examples_InheritanceChild_release_handle) : RefHolder(proxy)
}

public protocol InheritanceChild : InheritanceParent {
    func parentMethod(input: String) -> String
    func childMethod(input: UInt8) -> Int16
}

internal class _InheritanceChild: InheritanceChild {
    let c_instance : _baseRef
    init(cInheritanceChild: _baseRef) {
        guard cInheritanceChild != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInheritanceChild
    }
    deinit {
        examples_InheritanceChild_release_handle(c_instance)
    }
    public func parentMethod(input: String) -> String {
        let result_string_handle = examples_InheritanceParent_parentMethod(c_instance, input)
        defer {
            std_string_release_handle(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)!
    }
    public func childMethod(input: UInt8) -> Int16 {
        return examples_InheritanceChild_childMethod(c_instance, input)
    }
}

extension _InheritanceChild: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
