//
//
import Foundation
public struct Constants {
    public static let boolConstant: Bool = true
    public static let intConstant: Int32 = -11
    public static let uintConstant: UInt32 = 4294967295
    public static let floatConstant: Float = 2.71
    public static let doubleConstant: Double = -3.14
    public static let stringConstant: String = "Foo bar"
    public static let enumConstant: Constants.StateEnum = Constants.StateEnum.on
    public enum StateEnum : UInt32, CaseIterable, Codable {
        case off
        case on
    }
}
internal func copyToCType(_ swiftEnum: Constants.StateEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Constants.StateEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Constants.StateEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Constants.StateEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Constants.StateEnum {
    return Constants.StateEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Constants.StateEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Constants.StateEnum? {
    guard handle != 0 else {
        return nil
    }
    return Constants.StateEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Constants.StateEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
