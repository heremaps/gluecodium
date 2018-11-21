//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InheritanceRoot?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_InheritanceRoot_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_InheritanceRoot_release)
            : RefHolder(handle_copy)
    }
    var functions = smoke_InheritanceRoot_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_InheritanceRoot_rootMethod = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceRoot
        return swift_class.rootMethod()
    }
    functions.smoke_InheritanceRoot_rootAttribute_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceRoot
        return swift_class.rootAttribute.convertToCType()
    }
    functions.smoke_InheritanceRoot_rootAttribute_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceRoot
        defer {
            std_string_release(newValue)
        }
        return swift_class.rootAttribute = String(data: Data(bytes: std_string_data_get(newValue),
                                                count: Int(std_string_size_get(newValue))), encoding: .utf8)!
    }
    let proxy = smoke_InheritanceRoot_createProxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_InheritanceRoot_release) : RefHolder(proxy)
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

extension _InheritanceRoot: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
