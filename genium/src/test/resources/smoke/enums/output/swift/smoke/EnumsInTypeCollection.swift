//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public enum TCEnum : UInt32 {
    case first
    case second
}
internal func copyFromCType(_ cValue: UInt32) -> TCEnum {
    return TCEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> TCEnum {
    return copyFromCType(cValue)
}