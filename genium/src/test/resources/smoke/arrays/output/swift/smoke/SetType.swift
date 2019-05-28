//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: SetType?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SetType_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SetType_release_handle)
        : RefHolder(handle_copy)
}
public class SetType {
    public typealias IntSet = Set<Int32>
    public typealias StringSet = Set<String>
    public typealias EnumSet = Set<SetType.SomeEnum>
    let c_instance : _baseRef
    init(cSetType: _baseRef) {
        guard cSetType != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSetType
    }
    deinit {
        smoke_SetType_release_handle(c_instance)
    }
    public enum SomeEnum : UInt32, CaseIterable {
        case off
        case on
    }
    public static func stringSetRoundTrip(input: SetType.StringSet) -> SetType.StringSet {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_SetType_stringSetRoundTrip(c_input.ref))
    }
    public static func enumSetRoundTrip(input: SetType.EnumSet) -> SetType.EnumSet {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_SetType_enumSetRoundTrip(c_input.ref))
    }
    public static func nullableIntSetRoundTrip(input: SetType.IntSet?) -> SetType.IntSet? {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_SetType_nullableIntSetRoundTrip(c_input.ref))
    }
}
extension SetType: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func SetTypecopyFromCType(_ handle: _baseRef) -> SetType {
    return SetType(cSetType: smoke_SetType_copy_handle(handle))
}
internal func SetTypemoveFromCType(_ handle: _baseRef) -> SetType {
    return SetType(cSetType: handle)
}
internal func SetTypecopyFromCType(_ handle: _baseRef) -> SetType? {
    guard handle != 0 else {
        return nil
    }
    return SetTypemoveFromCType(handle) as SetType
}
internal func SetTypemoveFromCType(_ handle: _baseRef) -> SetType? {
    guard handle != 0 else {
        return nil
    }
    return SetTypemoveFromCType(handle) as SetType
}
internal func copyToCType(_ swiftClass: SetType) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SetType) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SetType?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SetType?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftEnum: SetType.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: SetType.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: SetType.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: SetType.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> SetType.SomeEnum {
    return SetType.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> SetType.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> SetType.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return SetType.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> SetType.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
