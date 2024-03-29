//
//
import Foundation
public class Constructors {
    public typealias ConstructorExplodedError = Constructors.ErrorEnum
    public init() {
        let _result = Constructors.create()
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_Constructors_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    public init(other: Constructors) {
        let _result = Constructors.create(other: other)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_Constructors_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    public init(foo: String, bar: UInt64) {
        let _result = Constructors.create(foo: foo, bar: bar)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_Constructors_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    public init(input: String) throws {
        let _result = try Constructors.create(input: input)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_Constructors_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    public init(input: [Double]) {
        let _result = Constructors.create(input: input)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_Constructors_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    let c_instance : _baseRef
    init(cConstructors: _baseRef) {
        guard cConstructors != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cConstructors
    }
    deinit {
        smoke_Constructors_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_Constructors_release_handle(c_instance)
    }
    public enum ErrorEnum : UInt32, CaseIterable, Codable {
        case none
        case crashed
    }
    private static func create() -> _baseRef {
        let c_result_handle = smoke_Constructors_create_()
        return moveFromCType(c_result_handle)
    }
    private static func create(other: Constructors) -> _baseRef {
        let c_other = moveToCType(other)
        let c_result_handle = smoke_Constructors_create_Constructors(c_other.ref)
        return moveFromCType(c_result_handle)
    }
    private static func create(foo: String, bar: UInt64) -> _baseRef {
        let c_foo = moveToCType(foo)
        let c_bar = moveToCType(bar)
        let c_result_handle = smoke_Constructors_create_String_ULong(c_foo.ref, c_bar.ref)
        return moveFromCType(c_result_handle)
    }
    private static func create(input: String) throws -> _baseRef {
        let c_input = moveToCType(input)
        let RESULT = smoke_Constructors_create_String(c_input.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as Constructors.ConstructorExplodedError
        }
        let c_result_handle = RESULT.returned_value
        return moveFromCType(c_result_handle)
    }
    private static func create(input: [Double]) -> _baseRef {
        let c_input = foobar_moveToCType(input)
        let c_result_handle = smoke_Constructors_create__3Double_4(c_input.ref)
        return moveFromCType(c_result_handle)
    }
}
@_cdecl("_CBridgeInitsmoke_Constructors")
internal func _CBridgeInitsmoke_Constructors(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = Constructors(cConstructors: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: Constructors?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Constructors_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Constructors_release_handle)
        : RefHolder(handle_copy)
}
extension Constructors: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension Constructors: Hashable {
    /// :nodoc:
    public static func == (lhs: Constructors, rhs: Constructors) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func Constructors_copyFromCType(_ handle: _baseRef) -> Constructors {
    if let swift_pointer = smoke_Constructors_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Constructors {
        return re_constructed
    }
    if let swift_pointer = smoke_Constructors_get_typed(smoke_Constructors_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Constructors {
        smoke_Constructors_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func Constructors_moveFromCType(_ handle: _baseRef) -> Constructors {
    if let swift_pointer = smoke_Constructors_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Constructors {
        smoke_Constructors_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_Constructors_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Constructors {
        smoke_Constructors_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func Constructors_copyFromCType(_ handle: _baseRef) -> Constructors? {
    guard handle != 0 else {
        return nil
    }
    return Constructors_moveFromCType(handle) as Constructors
}
internal func Constructors_moveFromCType(_ handle: _baseRef) -> Constructors? {
    guard handle != 0 else {
        return nil
    }
    return Constructors_moveFromCType(handle) as Constructors
}
internal func copyToCType(_ swiftClass: Constructors) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Constructors) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Constructors?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Constructors?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftEnum: Constructors.ErrorEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Constructors.ErrorEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Constructors.ErrorEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Constructors.ErrorEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Constructors.ErrorEnum {
    return Constructors.ErrorEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Constructors.ErrorEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Constructors.ErrorEnum? {
    guard handle != 0 else {
        return nil
    }
    return Constructors.ErrorEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Constructors.ErrorEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
extension Constructors.ErrorEnum : Error {
}
