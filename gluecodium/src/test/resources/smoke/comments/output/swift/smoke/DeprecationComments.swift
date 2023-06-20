//
//
import Foundation
/// This is some very useful interface.
@available(*, deprecated, message: "Unfortunately, this interface is deprecated. Use `Comments` instead.")
public protocol DeprecationComments : AnyObject {
    /// This is some very useful typedef.
    @available(*, deprecated, message: "Unfortunately, this typedef is deprecated. Use `Comments.Usefulness` instead.")
    typealias Usefulness = Bool
    @available(*, deprecated, message: "Unfortunately, this exception is deprecated, please use `Comments.SomethingWrongError` instead.")
    typealias SomethingWrongError = SomeEnum
    /// Some very useful property.
    @available(*, deprecated, message: "Unfortunately, this property is deprecated.\nUse `Comments.isSomeProperty` instead.")
    var isSomeProperty: DeprecationComments.Usefulness { get set }
    /// Describes the property but not accessors.
    @available(*, deprecated, message: "Will be removed in v3.2.1.")
    var propertyButNotAccessors: String { get set }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns: Usefulness of the input
    @available(*, deprecated, message: "Unfortunately, this method is deprecated.\nUse `Comments.someMethodWithAllComments(...)` instead.")
    func someMethodWithAllComments(input: String) -> DeprecationComments.Usefulness
}
internal class _DeprecationComments: DeprecationComments {
    /// This is some very useful constant.
    @available(*, deprecated, message: "Unfortunately, this constant is deprecated. Use `Comments.veryUseful` instead.")
    public static let veryUseful: DeprecationComments.Usefulness = true
    /// Some very useful property.
    @available(*, deprecated, message: "Unfortunately, this property is deprecated.\nUse `Comments.isSomeProperty` instead.")
    var isSomeProperty: DeprecationComments.Usefulness {
        get {
            let c_result_handle = smoke_DeprecationComments_isSomeProperty_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_DeprecationComments_isSomeProperty_set(self.c_instance, c_value.ref)
        }
    }
    /// Describes the property but not accessors.
    @available(*, deprecated, message: "Will be removed in v3.2.1.")
    var propertyButNotAccessors: String {
        get {
            let c_result_handle = smoke_DeprecationComments_propertyButNotAccessors_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_DeprecationComments_propertyButNotAccessors_set(self.c_instance, c_value.ref)
        }
    }
    let c_instance : _baseRef
    init(cDeprecationComments: _baseRef) {
        guard cDeprecationComments != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cDeprecationComments
    }
    deinit {
        smoke_DeprecationComments_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_DeprecationComments_release_handle(c_instance)
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns: Usefulness of the input
    @available(*, deprecated, message: "Unfortunately, this method is deprecated.\nUse `Comments.someMethodWithAllComments(...)` instead.")
    public func someMethodWithAllComments(input: String) -> DeprecationComments.Usefulness {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_DeprecationComments_someMethodWithAllComments(self.c_instance, c_input.ref)
        return moveFromCType(c_result_handle)
    }
}
/// This is some very useful enum.
@available(*, deprecated, message: "Unfortunately, this enum is deprecated. Use `Comments.SomeEnum` instead.")
public enum SomeEnum : UInt32, CaseIterable, Codable {
    /// Not quite useful
    @available(*, deprecated, message: "Unfortunately, this item is deprecated.\nUse `Comments.SomeEnum.useless` instead.")
    case useless
    public static var allCases: [SomeEnum] {
        return [.useless]
    }
    /// A type that can be used as a key for encoding and decoding.
    public enum Key: CodingKey {
        case rawValue
    }
    /// The error which is thrown if initialisation with decoder has failed
    public enum CodingError: Error {
        case unknownValue
    }
    /// Creates a new instance by decoding from the given decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .useless
        default:
            throw CodingError.unknownValue
        }
    }
    /// Encodes this value into the given encoder
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .useless:
            try container.encode(0, forKey: .rawValue)
        }
    }
}
/// This is some very useful struct.
@available(*, deprecated, message: "Unfortunately, this struct is deprecated. Use `Comments.SomeStruct` instead.")
public struct SomeStruct {
    /// How useful this struct is.
    @available(*, deprecated, message: "Unfortunately, this field is deprecated.\nUse `Comments.SomeStruct.someField` instead.")
    public var someField: DeprecationComments.Usefulness
    public init() {
        self.someField = false
    }
    @available(*, deprecated)
    public init(someField: DeprecationComments.Usefulness = false) {
        self.someField = someField
    }
    internal init(cHandle: _baseRef) {
        someField = moveFromCType(smoke_DeprecationComments_SomeStruct_someField_get(cHandle))
    }
}
@_cdecl("_CBridgeInitsmoke_DeprecationComments")
internal func _CBridgeInitsmoke_DeprecationComments(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _DeprecationComments(cDeprecationComments: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: DeprecationComments?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_DeprecationComments_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_DeprecationComments_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_DeprecationComments_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_DeprecationComments_someMethodWithAllComments = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! DeprecationComments
        return copyToCType(swift_class.someMethodWithAllComments(input: moveFromCType(input))).ref
    }
    functions.smoke_DeprecationComments_isSomeProperty_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! DeprecationComments
        return copyToCType(swift_class.isSomeProperty).ref
    }
    functions.smoke_DeprecationComments_isSomeProperty_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! DeprecationComments
        swift_class.isSomeProperty = moveFromCType(value)
    }
    functions.smoke_DeprecationComments_propertyButNotAccessors_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! DeprecationComments
        return copyToCType(swift_class.propertyButNotAccessors).ref
    }
    functions.smoke_DeprecationComments_propertyButNotAccessors_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! DeprecationComments
        swift_class.propertyButNotAccessors = moveFromCType(value)
    }
    let proxy = smoke_DeprecationComments_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_DeprecationComments_release_handle) : RefHolder(proxy)
}
extension _DeprecationComments: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func DeprecationComments_copyFromCType(_ handle: _baseRef) -> DeprecationComments {
    if let swift_pointer = smoke_DeprecationComments_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DeprecationComments {
        return re_constructed
    }
    if let swift_pointer = smoke_DeprecationComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DeprecationComments {
        return re_constructed
    }
    if let swift_pointer = smoke_DeprecationComments_get_typed(smoke_DeprecationComments_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? DeprecationComments {
        smoke_DeprecationComments_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func DeprecationComments_moveFromCType(_ handle: _baseRef) -> DeprecationComments {
    if let swift_pointer = smoke_DeprecationComments_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DeprecationComments {
        smoke_DeprecationComments_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_DeprecationComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DeprecationComments {
        smoke_DeprecationComments_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_DeprecationComments_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? DeprecationComments {
        smoke_DeprecationComments_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func DeprecationComments_copyFromCType(_ handle: _baseRef) -> DeprecationComments? {
    guard handle != 0 else {
        return nil
    }
    return DeprecationComments_moveFromCType(handle) as DeprecationComments
}
internal func DeprecationComments_moveFromCType(_ handle: _baseRef) -> DeprecationComments? {
    guard handle != 0 else {
        return nil
    }
    return DeprecationComments_moveFromCType(handle) as DeprecationComments
}
internal func copyToCType(_ swiftClass: DeprecationComments) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DeprecationComments) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: DeprecationComments?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DeprecationComments?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> SomeStruct {
    return SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> SomeStruct {
    defer {
        smoke_DeprecationComments_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SomeStruct) -> RefHolder {
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_DeprecationComments_SomeStruct_create_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DeprecationComments_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DeprecationComments_SomeStruct_unwrap_optional_handle(handle)
    return SomeStruct(cHandle: unwrappedHandle) as SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> SomeStruct? {
    defer {
        smoke_DeprecationComments_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_DeprecationComments_SomeStruct_create_optional_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DeprecationComments_SomeStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> SomeEnum {
    return SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
extension SomeEnum : Error {
}
