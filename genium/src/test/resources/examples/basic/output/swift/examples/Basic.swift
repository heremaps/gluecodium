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
            let c_inputString = moveToCType(inputString)
        return moveFromCType(examples_Basic_basicMethod(c_inputString.ref))
    }
}
extension Basic: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func BasiccopyFromCType(_ handle: _baseRef) -> Basic {
    return Basic(cBasic: examples_Basic_copy_handle(handle))
}
internal func BasicmoveFromCType(_ handle: _baseRef) -> Basic {
    return Basic(cBasic: handle)
}
internal func BasiccopyFromCType(_ handle: _baseRef) -> Basic? {
    guard handle != 0 else {
        return nil
    }
    return BasicmoveFromCType(handle) as Basic
}
internal func BasicmoveFromCType(_ handle: _baseRef) -> Basic? {
    guard handle != 0 else {
        return nil
    }
    return BasicmoveFromCType(handle) as Basic
}
internal func copyToCType(_ swiftClass: Basic) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Basic) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Basic?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Basic?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}