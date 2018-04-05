//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InheritanceRoot) -> RefHolder {
    if let instanceReference = ref as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }
    var functions = smoke_InheritanceRoot_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(ref).toOpaque()
    functions.release = {swiftClass_pointer in
        if let swiftClass = swiftClass_pointer {
            Unmanaged<AnyObject>.fromOpaque(swiftClass).release()
        }
    }
    functions.smoke_InheritanceRoot_rootMethod = {(swiftClass_pointer) in
        let swiftClass = Unmanaged<AnyObject>.fromOpaque(swiftClass_pointer!).takeUnretainedValue() as! InheritanceRoot
        return swiftClass.rootMethod()
    }
    let proxy = smoke_InheritanceRoot_createProxy(functions)
    return RefHolder(ref: proxy, release: smoke_InheritanceRoot_release)
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
