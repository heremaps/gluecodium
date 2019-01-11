//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: EnumMethods?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_EnumMethods_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_EnumMethods_release_handle)
        : RefHolder(handle_copy)
}
public class EnumMethods {
    let c_instance : _baseRef
    init(cEnumMethods: _baseRef) {
        guard cEnumMethods != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEnumMethods
    }
    deinit {
        examples_EnumMethods_release_handle(c_instance)
    }
    public static func methodWithEnumeration(input: ShoeSizes) -> ShoeSizes {
        return moveFromCType(examples_EnumMethods_methodWithEnumeration(input.rawValue))
    }
}
extension EnumMethods: NativeBase {
    var c_handle: _baseRef { return c_instance }
}