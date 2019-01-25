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
            let c_input = moveToCType(input)
        return moveFromCType(examples_Typedefs_typedefMethod(c_input.ref))
    }
}
extension Typedefs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func TypedefscopyFromCType(_ handle: _baseRef) -> Typedefs {
    return Typedefs(cTypedefs: examples_Typedefs_copy_handle(handle))
}
internal func TypedefsmoveFromCType(_ handle: _baseRef) -> Typedefs {
    return Typedefs(cTypedefs: handle)
}
internal func TypedefscopyFromCType(_ handle: _baseRef) -> Typedefs? {
    guard handle != 0 else {
        return nil
    }
    return TypedefsmoveFromCType(handle) as Typedefs
}
internal func TypedefsmoveFromCType(_ handle: _baseRef) -> Typedefs? {
    guard handle != 0 else {
        return nil
    }
    return TypedefsmoveFromCType(handle) as Typedefs
}
internal func copyToCType(_ swiftClass: Typedefs) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Typedefs) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Typedefs?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Typedefs?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}