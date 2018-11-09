//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: EnumsInTypeCollectionInterface?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class EnumsInTypeCollectionInterface {
    let c_instance : _baseRef

    public init?(cEnumsInTypeCollectionInterface: _baseRef) {
        guard cEnumsInTypeCollectionInterface != 0 else {
            return nil
        }
        c_instance = cEnumsInTypeCollectionInterface
    }

    deinit {
        smoke_EnumsInTypeCollectionInterface_release(c_instance)
    }
    public static func flipEnumValue(input: TCEnum) -> TCEnum {
        let cResult = smoke_EnumsInTypeCollectionInterface_flipEnumValue(input.rawValue)
        return TCEnum(rawValue: cResult)!
    }

}

extension EnumsInTypeCollectionInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
