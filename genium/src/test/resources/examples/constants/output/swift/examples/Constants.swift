//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public enum StateEnum : UInt32 {
    case off
    case on
}
internal func copyFromCType(_ cValue: UInt32) -> StateEnum {
    return StateEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> StateEnum {
    return copyFromCType(cValue)
}
public struct Constants {
    public static let boolConstant: Bool = true
    public static let intConstant: Int32 = 42
    public static let floatConstant: Float = 3.14
    public static let stringConstant: String = "Foo bar"
    public static let enumConstant: StateEnum = StateEnum.on
}
internal func copyFromCType(_ handle: _baseRef) -> Constants {
    return Constants()
}
internal func moveFromCType(_ handle: _baseRef) -> Constants {
    return copyFromCType(handle)
}