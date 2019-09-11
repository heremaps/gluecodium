//
//
import Foundation
/// This is some very useful interface.
public protocol CommentsInterface : AnyObject {
    /// This is some very useful typedef.
    typealias Usefulness = Bool
    /// Some very useful property.
    var isSomeProperty: CommentsInterface.Usefulness { get set }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns: Usefulness of the input
    func someMethodWithAllComments(input: String) -> CommentsInterface.Usefulness
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns:
    func someMethodWithInputComments(input: String) -> CommentsInterface.Usefulness
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input:
    /// - Returns: Usefulness of the input
    func someMethodWithOutputComments(input: String) -> CommentsInterface.Usefulness
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input:
    /// - Returns:
    func someMethodWithNoComments(input: String) -> CommentsInterface.Usefulness
    /// This is some very useful method that does not measure the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    func someMethodWithoutReturnTypeWithAllComments(input: String) -> Void
    /// This is some very useful method that does not measure the usefulness of its input.
    /// - Parameter input:
    func someMethodWithoutReturnTypeWithNoComments(input: String) -> Void
    /// This is some very useful method that measures the usefulness of something.
    /// - Returns: Usefulness of the input
    func someMethodWithoutInputParametersWithAllComments() -> CommentsInterface.Usefulness
    /// This is some very useful method that measures the usefulness of something.
    /// - Returns:
    func someMethodWithoutInputParametersWithNoComments() -> CommentsInterface.Usefulness
    func someMethodWithNothing() -> Void
    /// This is some very useful method that does nothing.
    func someMethodWithoutReturnTypeOrInputParameters() -> Void
}
internal class _CommentsInterface: CommentsInterface {
    /// This is some very useful constant.
    public static let veryUseful: CommentsInterface.Usefulness = true
    /// Some very useful property.
    var isSomeProperty: CommentsInterface.Usefulness {
        get {
            return moveFromCType(smoke_CommentsInterface_someProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_CommentsInterface_someProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cCommentsInterface: _baseRef) {
        guard cCommentsInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCommentsInterface
    }
    deinit {
        smoke_CommentsInterface_release_handle(c_instance)
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns: Usefulness of the input
    public func someMethodWithAllComments(input: String) -> CommentsInterface.Usefulness {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_CommentsInterface_someMethodWithAllComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns:
    public func someMethodWithInputComments(input: String) -> CommentsInterface.Usefulness {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_CommentsInterface_someMethodWithInputComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input:
    /// - Returns: Usefulness of the input
    public func someMethodWithOutputComments(input: String) -> CommentsInterface.Usefulness {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_CommentsInterface_someMethodWithOutputComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input:
    /// - Returns:
    public func someMethodWithNoComments(input: String) -> CommentsInterface.Usefulness {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_CommentsInterface_someMethodWithNoComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that does not measure the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    public func someMethodWithoutReturnTypeWithAllComments(input: String) -> Void {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_CommentsInterface_someMethodWithoutReturnTypeWithAllComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that does not measure the usefulness of its input.
    /// - Parameter input:
    public func someMethodWithoutReturnTypeWithNoComments(input: String) -> Void {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_CommentsInterface_someMethodWithoutReturnTypeWithNoComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of something.
    /// - Returns: Usefulness of the input
    public func someMethodWithoutInputParametersWithAllComments() -> CommentsInterface.Usefulness {
        return moveFromCType(smoke_CommentsInterface_someMethodWithoutInputParametersWithAllComments(self.c_instance))
    }
    /// This is some very useful method that measures the usefulness of something.
    /// - Returns:
    public func someMethodWithoutInputParametersWithNoComments() -> CommentsInterface.Usefulness {
        return moveFromCType(smoke_CommentsInterface_someMethodWithoutInputParametersWithNoComments(self.c_instance))
    }
    public func someMethodWithNothing() -> Void {
        return moveFromCType(smoke_CommentsInterface_someMethodWithNothing(self.c_instance))
    }
    /// This is some very useful method that does nothing.
    public func someMethodWithoutReturnTypeOrInputParameters() -> Void {
        return moveFromCType(smoke_CommentsInterface_someMethodWithoutReturnTypeOrInputParameters(self.c_instance))
    }
}
@_cdecl("_CBridgeInitsmoke_CommentsInterface")
internal func _CBridgeInitsmoke_CommentsInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _CommentsInterface(cCommentsInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: CommentsInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_CommentsInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_CommentsInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_CommentsInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_CommentsInterface_someMethodWithAllComments = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        return copyToCType(swift_class.someMethodWithAllComments(input: moveFromCType(input))).ref
    }
    functions.smoke_CommentsInterface_someMethodWithInputComments = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        return copyToCType(swift_class.someMethodWithInputComments(input: moveFromCType(input))).ref
    }
    functions.smoke_CommentsInterface_someMethodWithOutputComments = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        return copyToCType(swift_class.someMethodWithOutputComments(input: moveFromCType(input))).ref
    }
    functions.smoke_CommentsInterface_someMethodWithNoComments = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        return copyToCType(swift_class.someMethodWithNoComments(input: moveFromCType(input))).ref
    }
    functions.smoke_CommentsInterface_someMethodWithoutReturnTypeWithAllComments = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        swift_class.someMethodWithoutReturnTypeWithAllComments(input: moveFromCType(input))
    }
    functions.smoke_CommentsInterface_someMethodWithoutReturnTypeWithNoComments = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        swift_class.someMethodWithoutReturnTypeWithNoComments(input: moveFromCType(input))
    }
    functions.smoke_CommentsInterface_someMethodWithoutInputParametersWithAllComments = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        return copyToCType(swift_class.someMethodWithoutInputParametersWithAllComments()).ref
    }
    functions.smoke_CommentsInterface_someMethodWithoutInputParametersWithNoComments = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        return copyToCType(swift_class.someMethodWithoutInputParametersWithNoComments()).ref
    }
    functions.smoke_CommentsInterface_someMethodWithNothing = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        swift_class.someMethodWithNothing()
    }
    functions.smoke_CommentsInterface_someMethodWithoutReturnTypeOrInputParameters = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        swift_class.someMethodWithoutReturnTypeOrInputParameters()
    }
    functions.smoke_CommentsInterface_someProperty_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        return copyToCType(swift_class.isSomeProperty).ref
    }
    functions.smoke_CommentsInterface_someProperty_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! CommentsInterface
        swift_class.isSomeProperty = moveFromCType(newValue)
    }
    let proxy = smoke_CommentsInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_CommentsInterface_release_handle) : RefHolder(proxy)
}
extension _CommentsInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func CommentsInterfacecopyFromCType(_ handle: _baseRef) -> CommentsInterface {
    if let swift_pointer = smoke_CommentsInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CommentsInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_CommentsInterface_get_typed(smoke_CommentsInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? CommentsInterface {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func CommentsInterfacemoveFromCType(_ handle: _baseRef) -> CommentsInterface {
    if let swift_pointer = smoke_CommentsInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CommentsInterface {
        smoke_CommentsInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_CommentsInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? CommentsInterface {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func CommentsInterfacecopyFromCType(_ handle: _baseRef) -> CommentsInterface? {
    guard handle != 0 else {
        return nil
    }
    return CommentsInterfacemoveFromCType(handle) as CommentsInterface
}
internal func CommentsInterfacemoveFromCType(_ handle: _baseRef) -> CommentsInterface? {
    guard handle != 0 else {
        return nil
    }
    return CommentsInterfacemoveFromCType(handle) as CommentsInterface
}
internal func copyToCType(_ swiftClass: CommentsInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CommentsInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CommentsInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
/// This is some very useful enum.
public enum SomeEnum : UInt32, CaseIterable {
    /// Not quite useful
    case useless
    /// Somewhat useful
    case useful
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
/// This is some very useful struct.
public struct SomeStruct {
    /// How useful this struct is
    public var someField: CommentsInterface.Usefulness
    public init(someField: CommentsInterface.Usefulness) {
        self.someField = someField
    }
    internal init(cHandle: _baseRef) {
        someField = moveFromCType(smoke_CommentsInterface_SomeStruct_someField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> SomeStruct {
    return SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> SomeStruct {
    defer {
        smoke_CommentsInterface_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SomeStruct) -> RefHolder {
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_CommentsInterface_SomeStruct_create_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_CommentsInterface_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_CommentsInterface_SomeStruct_unwrap_optional_handle(handle)
    return SomeStruct(cHandle: unwrappedHandle) as SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> SomeStruct? {
    defer {
        smoke_CommentsInterface_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_CommentsInterface_SomeStruct_create_optional_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_CommentsInterface_SomeStruct_release_optional_handle)
}
