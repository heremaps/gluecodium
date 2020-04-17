//
//
import Foundation
public class SkipFunctions {
    let c_instance : _baseRef
    init(cSkipFunctions: _baseRef) {
        guard cSkipFunctions != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSkipFunctions
    }
    deinit {
        smoke_SkipFunctions_release_handle(c_instance)
    }
    public static func notInJava(input: String) -> String {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_SkipFunctions_notInJava(c_input.ref))
    }
    public static func notInDart(input: Float) -> Float {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_SkipFunctions_notInDart(c_input.ref))
    }
}
internal func getRef(_ ref: SkipFunctions?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SkipFunctions_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SkipFunctions_release_handle)
        : RefHolder(handle_copy)
}
extension SkipFunctions: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func SkipFunctions_copyFromCType(_ handle: _baseRef) -> SkipFunctions {
    return SkipFunctions(cSkipFunctions: smoke_SkipFunctions_copy_handle(handle))
}
internal func SkipFunctions_moveFromCType(_ handle: _baseRef) -> SkipFunctions {
    return SkipFunctions(cSkipFunctions: handle)
}
internal func SkipFunctions_copyFromCType(_ handle: _baseRef) -> SkipFunctions? {
    guard handle != 0 else {
        return nil
    }
    return SkipFunctions_moveFromCType(handle) as SkipFunctions
}
internal func SkipFunctions_moveFromCType(_ handle: _baseRef) -> SkipFunctions? {
    guard handle != 0 else {
        return nil
    }
    return SkipFunctions_moveFromCType(handle) as SkipFunctions
}
internal func copyToCType(_ swiftClass: SkipFunctions) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipFunctions) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SkipFunctions?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SkipFunctions?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
