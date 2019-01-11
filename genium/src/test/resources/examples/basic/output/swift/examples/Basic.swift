//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Basic?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_Basic_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_Basic_release_handle)
        : RefHolder(handle_copy)
}
public class Basic {
    let c_instance : _baseRef
    init(cBasic: _baseRef) {
        guard cBasic != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cBasic
    }
    deinit {
        examples_Basic_release_handle(c_instance)
    }
    public static func basicMethod(inputString: String) -> String {
        return moveFromCType(examples_Basic_basicMethod(inputString))
    }
}
extension Basic: NativeBase {
    var c_handle: _baseRef { return c_instance }
}