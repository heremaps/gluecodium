//
//
import Foundation
public class ConstantsInterface {
    public static let boolConstant: Bool = true
    public static let intConstant: Int32 = -11
    public static let uintConstant: UInt32 = 4294967295
    public static let floatConstant: Float = 2.71
    public static let doubleConstant: Double = -3.14
    public static let stringConstant: String = "Foo bar"
    public static let enumConstant: ConstantsInterface.StateEnum = ConstantsInterface.StateEnum.on
    let c_instance : _baseRef
    init(cConstantsInterface: _baseRef) {
        guard cConstantsInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cConstantsInterface
    }
    deinit {
        smoke_ConstantsInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ConstantsInterface_release_handle(c_instance)
    }
    public enum StateEnum : UInt32, CaseIterable, Codable {
        case off
        case on
    }
}
internal func getRef(_ ref: ConstantsInterface?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ConstantsInterface_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ConstantsInterface_release_handle)
        : RefHolder(handle_copy)
}
extension ConstantsInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension ConstantsInterface: Hashable {
    /// :nodoc:
    public static func == (lhs: ConstantsInterface, rhs: ConstantsInterface) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func ConstantsInterface_copyFromCType(_ handle: _baseRef) -> ConstantsInterface {
    if let swift_pointer = smoke_ConstantsInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ConstantsInterface {
        return re_constructed
    }
    let result = ConstantsInterface(cConstantsInterface: smoke_ConstantsInterface_copy_handle(handle))
    smoke_ConstantsInterface_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ConstantsInterface_moveFromCType(_ handle: _baseRef) -> ConstantsInterface {
    if let swift_pointer = smoke_ConstantsInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ConstantsInterface {
        smoke_ConstantsInterface_release_handle(handle)
        return re_constructed
    }
    let result = ConstantsInterface(cConstantsInterface: handle)
    smoke_ConstantsInterface_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ConstantsInterface_copyFromCType(_ handle: _baseRef) -> ConstantsInterface? {
    guard handle != 0 else {
        return nil
    }
    return ConstantsInterface_moveFromCType(handle) as ConstantsInterface
}
internal func ConstantsInterface_moveFromCType(_ handle: _baseRef) -> ConstantsInterface? {
    guard handle != 0 else {
        return nil
    }
    return ConstantsInterface_moveFromCType(handle) as ConstantsInterface
}
internal func copyToCType(_ swiftClass: ConstantsInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ConstantsInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ConstantsInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ConstantsInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftEnum: ConstantsInterface.StateEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: ConstantsInterface.StateEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: ConstantsInterface.StateEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: ConstantsInterface.StateEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> ConstantsInterface.StateEnum {
    return ConstantsInterface.StateEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> ConstantsInterface.StateEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> ConstantsInterface.StateEnum? {
    guard handle != 0 else {
        return nil
    }
    return ConstantsInterface.StateEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> ConstantsInterface.StateEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
