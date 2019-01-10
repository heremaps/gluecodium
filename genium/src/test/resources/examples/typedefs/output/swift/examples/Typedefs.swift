//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Typedefs?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_Typedefs_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_Typedefs_release_handle)
        : RefHolder(handle_copy)
}
public class Typedefs {

    public typealias ExampleAlias = UInt32
    let c_instance : _baseRef

    init(cTypedefs: _baseRef) {
        guard cTypedefs != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cTypedefs
    }

    deinit {
        examples_Typedefs_release_handle(c_instance)
    }
    public static func typedefMethod(input: Typedefs.ExampleAlias) -> Typedefs.ExampleAlias {
        return examples_Typedefs_typedefMethod(input)
    }

}

extension Typedefs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
