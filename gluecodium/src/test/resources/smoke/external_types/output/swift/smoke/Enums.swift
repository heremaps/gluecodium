//
//
import Foundation
public class Enums {
    let c_instance : _baseRef
    init(cEnums: _baseRef) {
        guard cEnums != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEnums
    }
    deinit {
        smoke_Enums_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_Enums_release_handle(c_instance)
    }
    public enum ExternalEnum : UInt32, CaseIterable, Codable {
        case fooValue
        case barValue
    }
    public enum VeryExternalEnum : UInt32, CaseIterable, Codable {
        case foo
        case bar
    }
    public static func methodWithExternalEnum(input: Enums.ExternalEnum) -> Void {
        let c_input = foobar_moveToCType(input)
        return moveFromCType(smoke_Enums_methodWithExternalEnum(c_input.ref))
    }
}
internal func getRef(_ ref: Enums?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Enums_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Enums_release_handle)
        : RefHolder(handle_copy)
}
extension Enums: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension Enums: Hashable {
    // :nodoc:
    public static func == (lhs: Enums, rhs: Enums) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    // :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func foobar_Enums_copyFromCType(_ handle: _baseRef) -> Enums {
    if let swift_pointer = smoke_Enums_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Enums {
        return re_constructed
    }
    let result = Enums(cEnums: smoke_Enums_copy_handle(handle))
    smoke_Enums_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_Enums_moveFromCType(_ handle: _baseRef) -> Enums {
    if let swift_pointer = smoke_Enums_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Enums {
        smoke_Enums_release_handle(handle)
        return re_constructed
    }
    let result = Enums(cEnums: handle)
    smoke_Enums_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_Enums_copyFromCType(_ handle: _baseRef) -> Enums? {
    guard handle != 0 else {
        return nil
    }
    return foobar_Enums_moveFromCType(handle) as Enums
}
internal func foobar_Enums_moveFromCType(_ handle: _baseRef) -> Enums? {
    guard handle != 0 else {
        return nil
    }
    return foobar_Enums_moveFromCType(handle) as Enums
}
internal func foobar_copyToCType(_ swiftClass: Enums) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: Enums) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: Enums?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: Enums?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftEnum: Enums.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: Enums.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: Enums.ExternalEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: Enums.ExternalEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> Enums.ExternalEnum {
    return Enums.ExternalEnum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> Enums.ExternalEnum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Enums.ExternalEnum? {
    guard handle != 0 else {
        return nil
    }
    return Enums.ExternalEnum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Enums.ExternalEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftEnum: Enums.VeryExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: Enums.VeryExternalEnum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: Enums.VeryExternalEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: Enums.VeryExternalEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> Enums.VeryExternalEnum {
    return Enums.VeryExternalEnum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> Enums.VeryExternalEnum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> Enums.VeryExternalEnum? {
    guard handle != 0 else {
        return nil
    }
    return Enums.VeryExternalEnum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> Enums.VeryExternalEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
