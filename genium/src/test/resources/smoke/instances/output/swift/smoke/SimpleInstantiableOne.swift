//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: SimpleInstantiableOne?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class SimpleInstantiableOne {
    let c_instance : _baseRef

    public init?(cSimpleInstantiableOne: _baseRef) {
        guard cSimpleInstantiableOne != 0 else {
            return nil
        }
        c_instance = cSimpleInstantiableOne
    }

    deinit {
        smoke_SimpleInstantiableOne_release(c_instance)
    }
    public func setStringValue(stringValue: String) -> Void {
        return smoke_SimpleInstantiableOne_setStringValue(c_instance, stringValue)
    }

    public func getStringValue() -> String {
        let result_string_handle = smoke_SimpleInstantiableOne_getStringValue(c_instance)
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)!
    }

}

extension SimpleInstantiableOne: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
