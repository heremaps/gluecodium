//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: Typedefs?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class Typedefs {

    public typealias ExampleAlias = UInt32
    let c_instance : _baseRef

    init?(cTypedefs: _baseRef) {
        guard cTypedefs != 0 else {
            return nil
        }
        c_instance = cTypedefs
    }

    deinit {
        examples_Typedefs_release(c_instance)
    }
    public static func typedefMethod(input: Typedefs.ExampleAlias) -> Typedefs.ExampleAlias {
        return examples_Typedefs_typedefMethod(input)
    }

}

extension Typedefs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
