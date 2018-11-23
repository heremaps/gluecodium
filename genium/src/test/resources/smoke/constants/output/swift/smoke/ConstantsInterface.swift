//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: ConstantsInterface?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}

public class ConstantsInterface {

    public static let boolConstant: Bool = true
    public static let intConstant: Int32 = -11
    public static let uintConstant: UInt32 = 4294967295
    public static let floatConstant: Float = 2.71
    public static let doubleConstant: Double = -3.14
    public static let stringConstant: String = "Foo bar"
    public static let enumConstant: ConstantsInterface.StateEnum = ConstantsInterface.StateEnum.on

    let c_instance : _baseRef
    init?(cConstantsInterface: _baseRef) {
        guard cConstantsInterface != 0 else {
            return nil
        }
        c_instance = cConstantsInterface
    }
    deinit {
        smoke_ConstantsInterface_release_handle(c_instance)
    }
    public enum StateEnum : UInt32 {
        case off
        case on
    }
}

extension ConstantsInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
