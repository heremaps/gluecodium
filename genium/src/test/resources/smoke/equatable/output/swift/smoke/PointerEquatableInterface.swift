//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: PointerEquatableInterface?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_PointerEquatableInterface_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_PointerEquatableInterface_release_handle)
        : RefHolder(handle_copy)
}
public class PointerEquatableInterface {
    let c_instance : _baseRef
    init(cPointerEquatableInterface: _baseRef) {
        guard cPointerEquatableInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cPointerEquatableInterface
    }
    deinit {
        smoke_PointerEquatableInterface_release_handle(c_instance)
    }
}
extension PointerEquatableInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension PointerEquatableInterface: Hashable {
    public static func == (lhs: PointerEquatableInterface, rhs: PointerEquatableInterface) -> Bool {
        return smoke_PointerEquatableInterface_equal(lhs.c_handle, rhs.c_handle)
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(smoke_PointerEquatableInterface_hash(c_handle))
    }
}
internal func PointerEquatableInterfacecopyFromCType(_ handle: _baseRef) -> PointerEquatableInterface {
    return PointerEquatableInterface(cPointerEquatableInterface: smoke_PointerEquatableInterface_copy_handle(handle))
}
internal func PointerEquatableInterfacemoveFromCType(_ handle: _baseRef) -> PointerEquatableInterface {
    return PointerEquatableInterface(cPointerEquatableInterface: handle)
}
internal func PointerEquatableInterfacecopyFromCType(_ handle: _baseRef) -> PointerEquatableInterface? {
    guard handle != 0 else {
        return nil
    }
    return PointerEquatableInterfacemoveFromCType(handle) as PointerEquatableInterface
}
internal func PointerEquatableInterfacemoveFromCType(_ handle: _baseRef) -> PointerEquatableInterface? {
    guard handle != 0 else {
        return nil
    }
    return PointerEquatableInterfacemoveFromCType(handle) as PointerEquatableInterface
}
internal func copyToCType(_ swiftClass: PointerEquatableInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PointerEquatableInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: PointerEquatableInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PointerEquatableInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
