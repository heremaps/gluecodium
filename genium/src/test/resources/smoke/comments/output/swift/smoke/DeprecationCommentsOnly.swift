//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: DeprecationCommentsOnly?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_DeprecationCommentsOnly_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_DeprecationCommentsOnly_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_DeprecationCommentsOnly_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_DeprecationCommentsOnly_someMethodWithAllComments = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! DeprecationCommentsOnly
        return copyToCType(swift_class.someMethodWithAllComments(input: moveFromCType(input))).ref
    }
    functions.smoke_DeprecationCommentsOnly_someProperty_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! DeprecationCommentsOnly
        return copyToCType(swift_class.isSomeProperty).ref
    }
    functions.smoke_DeprecationCommentsOnly_someProperty_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! DeprecationCommentsOnly
        swift_class.isSomeProperty = moveFromCType(newValue)
    }
    let proxy = smoke_DeprecationCommentsOnly_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_DeprecationCommentsOnly_release_handle) : RefHolder(proxy)
}
@available(*, deprecated, message: "Unfortunately, this interface is deprecated.")
public protocol DeprecationCommentsOnly : AnyObject {
    @available(*, deprecated, message: "Unfortunately, this typedef is deprecated.")
    typealias Usefulness = Bool
    @available(*, deprecated, message: "Unfortunately, this property is deprecated.")
    var isSomeProperty: DeprecationCommentsOnly.Usefulness { get set }
    ///
    /// - Parameter input: Very useful input parameter
    /// - Returns: Usefulness of the input
    @available(*, deprecated, message: "Unfortunately, this method is deprecated.")
    func someMethodWithAllComments(input: String) -> DeprecationCommentsOnly.Usefulness
}
internal class _DeprecationCommentsOnly: DeprecationCommentsOnly {
    @available(*, deprecated, message: "Unfortunately, this constant is deprecated.")
    public static let veryUseful: DeprecationCommentsOnly.Usefulness = true
    @available(*, deprecated, message: "Unfortunately, this property is deprecated.")
    var isSomeProperty: DeprecationCommentsOnly.Usefulness {
        get {
            return moveFromCType(smoke_DeprecationCommentsOnly_someProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_DeprecationCommentsOnly_someProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cDeprecationCommentsOnly: _baseRef) {
        guard cDeprecationCommentsOnly != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cDeprecationCommentsOnly
    }
    deinit {
        smoke_DeprecationCommentsOnly_release_handle(c_instance)
    }
    ///
    /// - Parameter input: Very useful input parameter
    /// - Returns: Usefulness of the input
    @available(*, deprecated, message: "Unfortunately, this method is deprecated.")
    public func someMethodWithAllComments(input: String) -> DeprecationCommentsOnly.Usefulness {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_DeprecationCommentsOnly_someMethodWithAllComments(self.c_instance, c_input.ref))
    }
}
extension _DeprecationCommentsOnly: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func DeprecationCommentsOnlycopyFromCType(_ handle: _baseRef) -> DeprecationCommentsOnly {
    if let swift_pointer = smoke_DeprecationCommentsOnly_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DeprecationCommentsOnly {
        return re_constructed
    }
    return _DeprecationCommentsOnly(cDeprecationCommentsOnly: smoke_DeprecationCommentsOnly_copy_handle(handle))
}
internal func DeprecationCommentsOnlymoveFromCType(_ handle: _baseRef) -> DeprecationCommentsOnly {
    if let swift_pointer = smoke_DeprecationCommentsOnly_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DeprecationCommentsOnly {
        smoke_DeprecationCommentsOnly_release_handle(handle)
        return re_constructed
    }
    return _DeprecationCommentsOnly(cDeprecationCommentsOnly: handle)
}
internal func DeprecationCommentsOnlycopyFromCType(_ handle: _baseRef) -> DeprecationCommentsOnly? {
    guard handle != 0 else {
        return nil
    }
    return DeprecationCommentsOnlymoveFromCType(handle) as DeprecationCommentsOnly
}
internal func DeprecationCommentsOnlymoveFromCType(_ handle: _baseRef) -> DeprecationCommentsOnly? {
    guard handle != 0 else {
        return nil
    }
    return DeprecationCommentsOnlymoveFromCType(handle) as DeprecationCommentsOnly
}
internal func copyToCType(_ swiftClass: DeprecationCommentsOnly) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DeprecationCommentsOnly) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: DeprecationCommentsOnly?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DeprecationCommentsOnly?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
@available(*, deprecated, message: "Unfortunately, this enum is deprecated.")
public enum SomeEnum : UInt32, CaseIterable {
    @available(*, deprecated, message: "Unfortunately, this item is deprecated.")
    case useless
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
@available(*, deprecated, message: "Unfortunately, this struct is deprecated.")
public struct SomeStruct {
    @available(*, deprecated, message: "Unfortunately, this field is deprecated.")
    public var someField: DeprecationCommentsOnly.Usefulness
    public init(someField: DeprecationCommentsOnly.Usefulness) {
        self.someField = someField
    }
    internal init(cHandle: _baseRef) {
        someField = moveFromCType(smoke_DeprecationCommentsOnly_SomeStruct_someField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> SomeStruct {
    return SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> SomeStruct {
    defer {
        smoke_DeprecationCommentsOnly_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SomeStruct) -> RefHolder {
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_DeprecationCommentsOnly_SomeStruct_create_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DeprecationCommentsOnly_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DeprecationCommentsOnly_SomeStruct_unwrap_optional_handle(handle)
    return SomeStruct(cHandle: unwrappedHandle) as SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> SomeStruct? {
    defer {
        smoke_DeprecationCommentsOnly_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_DeprecationCommentsOnly_SomeStruct_create_optional_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DeprecationCommentsOnly_SomeStruct_release_optional_handle)
}
