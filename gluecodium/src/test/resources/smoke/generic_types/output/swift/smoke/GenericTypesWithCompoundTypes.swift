//
//
import Foundation
public class GenericTypesWithCompoundTypes {
    let c_instance : _baseRef
    init(cGenericTypesWithCompoundTypes: _baseRef) {
        guard cGenericTypesWithCompoundTypes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cGenericTypesWithCompoundTypes
    }
    deinit {
        smoke_GenericTypesWithCompoundTypes_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_GenericTypesWithCompoundTypes_release_handle(c_instance)
    }
    public enum SomeEnum : UInt32, CaseIterable, Codable {
        case foo
        case bar
    }
    public enum ExternalEnum : UInt32, CaseIterable, Codable {
        case on
        case off
    }
    public struct BasicStruct {
        public var value: Double
        public init(value: Double) {
            self.value = value
        }
        internal init(cHandle: _baseRef) {
            value = moveFromCType(smoke_GenericTypesWithCompoundTypes_BasicStruct_value_get(cHandle))
        }
    }
    public struct ExternalStruct {
        public var string: String
        public init(string: String) {
            self.string = string
        }
        internal init(cHandle: _baseRef) {
            string = moveFromCType(smoke_GenericTypesWithCompoundTypes_ExternalStruct_string_get(cHandle))
        }
    }
    public func methodWithStructList(input: [GenericTypesWithCompoundTypes.BasicStruct]) -> [GenericTypesWithCompoundTypes.ExternalStruct] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithCompoundTypes_methodWithStructList(self.c_instance, c_input.ref))
    }
    public func methodWithStructMap(input: [String: GenericTypesWithCompoundTypes.BasicStruct]) -> [String: GenericTypesWithCompoundTypes.ExternalStruct] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithCompoundTypes_methodWithStructMap(self.c_instance, c_input.ref))
    }
    public func methodWithEnumList(input: [GenericTypesWithCompoundTypes.SomeEnum]) -> [GenericTypesWithCompoundTypes.ExternalEnum] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithCompoundTypes_methodWithEnumList(self.c_instance, c_input.ref))
    }
    public func methodWithEnumMapKey(input: [GenericTypesWithCompoundTypes.SomeEnum: Bool]) -> [GenericTypesWithCompoundTypes.ExternalEnum: Bool] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithCompoundTypes_methodWithEnumMapKey(self.c_instance, c_input.ref))
    }
    public func methodWithEnumMapValue(input: [Int32: GenericTypesWithCompoundTypes.SomeEnum]) -> [Int32: GenericTypesWithCompoundTypes.ExternalEnum] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithCompoundTypes_methodWithEnumMapValue(self.c_instance, c_input.ref))
    }
    public func methodWithEnumSet(input: Set<GenericTypesWithCompoundTypes.SomeEnum>) -> Set<GenericTypesWithCompoundTypes.ExternalEnum> {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithCompoundTypes_methodWithEnumSet(self.c_instance, c_input.ref))
    }
    public func methodWithInstancesList(input: [DummyClass]) -> [DummyInterface] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithCompoundTypes_methodWithInstancesList(self.c_instance, c_input.ref))
    }
    public func methodWithInstancesMap(input: [Int32: DummyClass]) -> [Int32: DummyInterface] {
        let c_input = foobar_moveToCType(input)
        return foobar_moveFromCType(smoke_GenericTypesWithCompoundTypes_methodWithInstancesMap(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: GenericTypesWithCompoundTypes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_GenericTypesWithCompoundTypes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_GenericTypesWithCompoundTypes_release_handle)
        : RefHolder(handle_copy)
}
extension GenericTypesWithCompoundTypes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension GenericTypesWithCompoundTypes: Hashable {
    public static func == (lhs: GenericTypesWithCompoundTypes, rhs: GenericTypesWithCompoundTypes) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func foobar_GenericTypesWithCompoundTypes_copyFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes {
    if let swift_pointer = smoke_GenericTypesWithCompoundTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? GenericTypesWithCompoundTypes {
        return re_constructed
    }
    let result = GenericTypesWithCompoundTypes(cGenericTypesWithCompoundTypes: smoke_GenericTypesWithCompoundTypes_copy_handle(handle))
    smoke_GenericTypesWithCompoundTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_GenericTypesWithCompoundTypes_moveFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes {
    if let swift_pointer = smoke_GenericTypesWithCompoundTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? GenericTypesWithCompoundTypes {
        smoke_GenericTypesWithCompoundTypes_release_handle(handle)
        return re_constructed
    }
    let result = GenericTypesWithCompoundTypes(cGenericTypesWithCompoundTypes: handle)
    smoke_GenericTypesWithCompoundTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_GenericTypesWithCompoundTypes_copyFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes? {
    guard handle != 0 else {
        return nil
    }
    return foobar_GenericTypesWithCompoundTypes_moveFromCType(handle) as GenericTypesWithCompoundTypes
}
internal func foobar_GenericTypesWithCompoundTypes_moveFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes? {
    guard handle != 0 else {
        return nil
    }
    return foobar_GenericTypesWithCompoundTypes_moveFromCType(handle) as GenericTypesWithCompoundTypes
}
internal func foobar_copyToCType(_ swiftClass: GenericTypesWithCompoundTypes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: GenericTypesWithCompoundTypes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: GenericTypesWithCompoundTypes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: GenericTypesWithCompoundTypes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.BasicStruct {
    return GenericTypesWithCompoundTypes.BasicStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.BasicStruct {
    defer {
        smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: GenericTypesWithCompoundTypes.BasicStruct) -> RefHolder {
    let c_value = moveToCType(swiftType.value)
    return RefHolder(smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle(c_value.ref))
}
internal func foobar_moveToCType(_ swiftType: GenericTypesWithCompoundTypes.BasicStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.BasicStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_GenericTypesWithCompoundTypes_BasicStruct_unwrap_optional_handle(handle)
    return GenericTypesWithCompoundTypes.BasicStruct(cHandle: unwrappedHandle) as GenericTypesWithCompoundTypes.BasicStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.BasicStruct? {
    defer {
        smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: GenericTypesWithCompoundTypes.BasicStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_value = moveToCType(swiftType.value)
    return RefHolder(smoke_GenericTypesWithCompoundTypes_BasicStruct_create_optional_handle(c_value.ref))
}
internal func foobar_moveToCType(_ swiftType: GenericTypesWithCompoundTypes.BasicStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_GenericTypesWithCompoundTypes_BasicStruct_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.ExternalStruct {
    return GenericTypesWithCompoundTypes.ExternalStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.ExternalStruct {
    defer {
        smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: GenericTypesWithCompoundTypes.ExternalStruct) -> RefHolder {
    let c_string = moveToCType(swiftType.string)
    return RefHolder(smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle(c_string.ref))
}
internal func foobar_moveToCType(_ swiftType: GenericTypesWithCompoundTypes.ExternalStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.ExternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_GenericTypesWithCompoundTypes_ExternalStruct_unwrap_optional_handle(handle)
    return GenericTypesWithCompoundTypes.ExternalStruct(cHandle: unwrappedHandle) as GenericTypesWithCompoundTypes.ExternalStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.ExternalStruct? {
    defer {
        smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: GenericTypesWithCompoundTypes.ExternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_string = moveToCType(swiftType.string)
    return RefHolder(smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_optional_handle(c_string.ref))
}
internal func foobar_moveToCType(_ swiftType: GenericTypesWithCompoundTypes.ExternalStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_optional_handle)
}
internal func foobar_copyToCType(_ swiftEnum: GenericTypesWithCompoundTypes.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: GenericTypesWithCompoundTypes.SomeEnum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: GenericTypesWithCompoundTypes.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: GenericTypesWithCompoundTypes.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> GenericTypesWithCompoundTypes.SomeEnum {
    return GenericTypesWithCompoundTypes.SomeEnum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> GenericTypesWithCompoundTypes.SomeEnum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return GenericTypesWithCompoundTypes.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftEnum: GenericTypesWithCompoundTypes.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: GenericTypesWithCompoundTypes.ExternalEnum) -> PrimitiveHolder<UInt32> {
    return foobar_copyToCType(swiftEnum)
}
internal func foobar_copyToCType(_ swiftEnum: GenericTypesWithCompoundTypes.ExternalEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func foobar_moveToCType(_ swiftEnum: GenericTypesWithCompoundTypes.ExternalEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func foobar_copyFromCType(_ cValue: UInt32) -> GenericTypesWithCompoundTypes.ExternalEnum {
    return GenericTypesWithCompoundTypes.ExternalEnum(rawValue: cValue)!
}
internal func foobar_moveFromCType(_ cValue: UInt32) -> GenericTypesWithCompoundTypes.ExternalEnum {
    return foobar_copyFromCType(cValue)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.ExternalEnum? {
    guard handle != 0 else {
        return nil
    }
    return GenericTypesWithCompoundTypes.ExternalEnum(rawValue: uint32_t_value_get(handle))!
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> GenericTypesWithCompoundTypes.ExternalEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
