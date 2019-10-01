//
//
import Foundation
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
internal func getRef(_ ref: Basic?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_Basic_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_Basic_release_handle)
        : RefHolder(handle_copy)
}
extension Basic: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func Basic_copyFromCType(_ handle: _baseRef) -> Basic {
    return Basic(cBasic: examples_Basic_copy_handle(handle))
}
internal func Basic_moveFromCType(_ handle: _baseRef) -> Basic {
    return Basic(cBasic: handle)
}
internal func Basic_copyFromCType(_ handle: _baseRef) -> Basic? {
    guard handle != 0 else {
        return nil
    }
    return Basic_moveFromCType(handle) as Basic
}
internal func Basic_moveFromCType(_ handle: _baseRef) -> Basic? {
    guard handle != 0 else {
        return nil
    }
    return Basic_moveFromCType(handle) as Basic
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
