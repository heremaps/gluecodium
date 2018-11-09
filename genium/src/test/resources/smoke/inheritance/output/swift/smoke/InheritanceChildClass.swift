//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InheritanceChildClass?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}

public class InheritanceChildClass: InheritanceRoot {
    public var rootAttribute: String {
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
    public init?(cInheritanceChildClass: _baseRef) {
        guard cInheritanceChildClass != 0 else {
            return nil
        }
        c_instance = cInheritanceChildClass
    }
    deinit {
        smoke_InheritanceChildClass_release(c_instance)
    }
    public func rootMethod() -> Void {
        return smoke_InheritanceRoot_rootMethod(c_instance)
    }
    public func childClassMethod() -> Void {
        return smoke_InheritanceChildClass_childClassMethod(c_instance)
    }
}

extension InheritanceChildClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
