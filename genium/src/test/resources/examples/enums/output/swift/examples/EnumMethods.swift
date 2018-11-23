//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: EnumMethods?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class EnumMethods {
    let c_instance : _baseRef

    init?(cEnumMethods: _baseRef) {
        guard cEnumMethods != 0 else {
            return nil
        }
        c_instance = cEnumMethods
    }

    deinit {
        examples_EnumMethods_release_handle(c_instance)
    }
    public static func methodWithEnumeration(input: ShoeSizes) -> ShoeSizes {
        let cResult = examples_EnumMethods_methodWithEnumeration(input.rawValue)
        return ShoeSizes(rawValue: cResult)!
    }

}

extension EnumMethods: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
