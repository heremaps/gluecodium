//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: EnumsInTypeCollectionInterface?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_EnumsInTypeCollectionInterface_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_EnumsInTypeCollectionInterface_release_handle)
        : RefHolder(handle_copy)
}
public class EnumsInTypeCollectionInterface {
    let c_instance : _baseRef
    init(cEnumsInTypeCollectionInterface: _baseRef) {
        guard cEnumsInTypeCollectionInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEnumsInTypeCollectionInterface
    }
    deinit {
        smoke_EnumsInTypeCollectionInterface_release_handle(c_instance)
    }
    public static func flipEnumValue(input: TCEnum) -> TCEnum {
        return moveFromCType(smoke_EnumsInTypeCollectionInterface_flipEnumValue(input.rawValue))
    }
}
extension EnumsInTypeCollectionInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func EnumsInTypeCollectionInterfacecopyFromCType(_ handle: _baseRef) -> EnumsInTypeCollectionInterface {
    return EnumsInTypeCollectionInterface(cEnumsInTypeCollectionInterface: handle)
}
internal func EnumsInTypeCollectionInterfacemoveFromCType(_ handle: _baseRef) -> EnumsInTypeCollectionInterface {
    return EnumsInTypeCollectionInterfacecopyFromCType(handle)
}
internal func EnumsInTypeCollectionInterfacecopyFromCType(_ handle: _baseRef) -> EnumsInTypeCollectionInterface? {
    guard handle != 0 else {
        return nil
    }
    return EnumsInTypeCollectionInterfacemoveFromCType(handle) as EnumsInTypeCollectionInterface
}
internal func EnumsInTypeCollectionInterfacemoveFromCType(_ handle: _baseRef) -> EnumsInTypeCollectionInterface? {
    return EnumsInTypeCollectionInterfacecopyFromCType(handle)
}