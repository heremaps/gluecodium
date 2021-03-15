//
//
import Foundation
/// This is some very useful class.
/// :nodoc:
public class ExcludedComments {
    /// This is some very useful typealias.
    /// :nodoc:
    public typealias Usefulness = Bool
    /// This is some very useful exception.
    /// :nodoc:
    public typealias SomethingWrongError = ExcludedComments.SomeEnum
    /// This is some very useful lambda that does it.
    /// :nodoc:
    public typealias SomeLambda = (String, Int32) -> Double
    /// This is some very useful constant.
    /// :nodoc:
    public static let veryUseful: ExcludedComments.Usefulness = true
    /// Some very useful property.
    /// :nodoc:
    public var isSomeProperty: ExcludedComments.Usefulness {
        get {
            return moveFromCType(smoke_ExcludedComments_isSomeProperty_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_ExcludedComments_isSomeProperty_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cExcludedComments: _baseRef) {
        guard cExcludedComments != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cExcludedComments
    }
    deinit {
        smoke_ExcludedComments_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ExcludedComments_release_handle(c_instance)
    }
    /// This is some very useful enum.
    /// :nodoc:
    public enum SomeEnum : UInt32, CaseIterable, Codable {
        /// Not quite useful
        /// :nodoc:
        case useless
    }
    /// This is some very useful struct.
    /// :nodoc:
    public struct SomeStruct {
        /// How useful this struct is
        /// remains to be seen
        /// :nodoc:
        public var someField: ExcludedComments.Usefulness
        /// This is how easy it is to construct.
        /// - Parameters
        ///   - someField: How useful this struct is
        ///       remains to be seen
        public init(someField: ExcludedComments.Usefulness) {
            self.someField = someField
        }
        internal init(cHandle: _baseRef) {
            someField = moveFromCType(smoke_ExcludedComments_SomeStruct_someField_get(cHandle))
        }
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter inputParameter: Very useful input parameter
    /// - Returns: Usefulness of the input
    /// - Throws: `ExcludedComments.SomethingWrongError` Sometimes it happens.
    /// :nodoc:
    public func someMethodWithAllComments(inputParameter: String) throws -> ExcludedComments.Usefulness {
        let c_inputParameter = moveToCType(inputParameter)
        let RESULT = smoke_ExcludedComments_someMethodWithAllComments(self.c_instance, c_inputParameter.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as ExcludedComments.SomethingWrongError
        } else {
            return moveFromCType(RESULT.returned_value)
        }
    }
    /// This is some very useful method that does nothing.
    /// :nodoc:
    public func someMethodWithoutReturnTypeOrInputParameters() -> Void {
        return moveFromCType(smoke_ExcludedComments_someMethodWithoutReturnTypeOrInputParameters(self.c_instance))
    }
}
internal func getRef(_ ref: ExcludedComments?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ExcludedComments_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ExcludedComments_release_handle)
        : RefHolder(handle_copy)
}
extension ExcludedComments: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension ExcludedComments: Hashable {
    /// :nodoc:
    public static func == (lhs: ExcludedComments, rhs: ExcludedComments) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func ExcludedComments_copyFromCType(_ handle: _baseRef) -> ExcludedComments {
    if let swift_pointer = smoke_ExcludedComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExcludedComments {
        return re_constructed
    }
    let result = ExcludedComments(cExcludedComments: smoke_ExcludedComments_copy_handle(handle))
    smoke_ExcludedComments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ExcludedComments_moveFromCType(_ handle: _baseRef) -> ExcludedComments {
    if let swift_pointer = smoke_ExcludedComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExcludedComments {
        smoke_ExcludedComments_release_handle(handle)
        return re_constructed
    }
    let result = ExcludedComments(cExcludedComments: handle)
    smoke_ExcludedComments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ExcludedComments_copyFromCType(_ handle: _baseRef) -> ExcludedComments? {
    guard handle != 0 else {
        return nil
    }
    return ExcludedComments_moveFromCType(handle) as ExcludedComments
}
internal func ExcludedComments_moveFromCType(_ handle: _baseRef) -> ExcludedComments? {
    guard handle != 0 else {
        return nil
    }
    return ExcludedComments_moveFromCType(handle) as ExcludedComments
}
internal func copyToCType(_ swiftClass: ExcludedComments) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExcludedComments) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ExcludedComments?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExcludedComments?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> ExcludedComments.SomeLambda {
    return moveFromCType(smoke_ExcludedComments_SomeLambda_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> ExcludedComments.SomeLambda {
    let refHolder = RefHolder(ref: handle, release: smoke_ExcludedComments_SomeLambda_release_handle)
    return { (p0: String, p1: Int32) -> Double in
        let _p0 = moveToCType(p0)
        let _p1 = moveToCType(p1)
        return moveFromCType(smoke_ExcludedComments_SomeLambda_call(refHolder.ref, _p0.ref, _p1.ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ExcludedComments.SomeLambda? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as ExcludedComments.SomeLambda
}
internal func moveFromCType(_ handle: _baseRef) -> ExcludedComments.SomeLambda? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as ExcludedComments.SomeLambda
}
internal func createFunctionalTable(_ swiftType: @escaping ExcludedComments.SomeLambda) -> smoke_ExcludedComments_SomeLambda_FunctionTable {
    class smoke_ExcludedComments_SomeLambda_Holder {
        let closure: ExcludedComments.SomeLambda
        init(_ closure: @escaping ExcludedComments.SomeLambda) {
            self.closure = closure
        }
    }
    var functions = smoke_ExcludedComments_SomeLambda_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_ExcludedComments_SomeLambda_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_ExcludedComments_SomeLambda_call = { swift_closure_pointer, p0, p1 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_ExcludedComments_SomeLambda_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0), moveFromCType(p1))).ref
    }
    return functions
}
internal func copyToCType(_ swiftType: @escaping ExcludedComments.SomeLambda) -> RefHolder {
    let handle = smoke_ExcludedComments_SomeLambda_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping ExcludedComments.SomeLambda) -> RefHolder {
    let handle = smoke_ExcludedComments_SomeLambda_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_ExcludedComments_SomeLambda_release_handle)
}
internal func copyToCType(_ swiftType: ExcludedComments.SomeLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_ExcludedComments_SomeLambda_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: ExcludedComments.SomeLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_ExcludedComments_SomeLambda_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_ExcludedComments_SomeLambda_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ExcludedComments.SomeStruct {
    return ExcludedComments.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ExcludedComments.SomeStruct {
    defer {
        smoke_ExcludedComments_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ExcludedComments.SomeStruct) -> RefHolder {
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_ExcludedComments_SomeStruct_create_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: ExcludedComments.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExcludedComments_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ExcludedComments.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ExcludedComments_SomeStruct_unwrap_optional_handle(handle)
    return ExcludedComments.SomeStruct(cHandle: unwrappedHandle) as ExcludedComments.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> ExcludedComments.SomeStruct? {
    defer {
        smoke_ExcludedComments_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ExcludedComments.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_ExcludedComments_SomeStruct_create_optional_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: ExcludedComments.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExcludedComments_SomeStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: ExcludedComments.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: ExcludedComments.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: ExcludedComments.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: ExcludedComments.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> ExcludedComments.SomeEnum {
    return ExcludedComments.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> ExcludedComments.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> ExcludedComments.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return ExcludedComments.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> ExcludedComments.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
extension ExcludedComments.SomeEnum : Error {
}
