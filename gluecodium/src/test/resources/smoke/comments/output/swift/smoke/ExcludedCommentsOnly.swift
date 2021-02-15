//
//
import Foundation
/// :nodoc:
public class ExcludedCommentsOnly {
    /// :nodoc:
    public typealias Usefulness = Bool
    /// :nodoc:
    public typealias SomethingWrongError = ExcludedCommentsOnly.SomeEnum
    /// :nodoc:
    public typealias SomeLambda = (String, Int32) -> Double
    /// :nodoc:
    public static let veryUseful: ExcludedCommentsOnly.Usefulness = true
    /// :nodoc:
    public var isSomeProperty: ExcludedCommentsOnly.Usefulness {
        get {
            return moveFromCType(smoke_ExcludedCommentsOnly_isSomeProperty_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_ExcludedCommentsOnly_isSomeProperty_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cExcludedCommentsOnly: _baseRef) {
        guard cExcludedCommentsOnly != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cExcludedCommentsOnly
    }
    deinit {
        smoke_ExcludedCommentsOnly_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ExcludedCommentsOnly_release_handle(c_instance)
    }
    /// :nodoc:
    public enum SomeEnum : UInt32, CaseIterable, Codable {
        /// :nodoc:
        case useless
    }
    /// :nodoc:
    public struct SomeStruct {
        /// :nodoc:
        public var someField: ExcludedCommentsOnly.Usefulness
        public init(someField: ExcludedCommentsOnly.Usefulness) {
            self.someField = someField
        }
        internal init(cHandle: _baseRef) {
            someField = moveFromCType(smoke_ExcludedCommentsOnly_SomeStruct_someField_get(cHandle))
        }
    }
    ///
    /// - Parameter inputParameter:
    /// - Returns:
    /// - Throws: `ExcludedCommentsOnly.SomethingWrongError`
    /// :nodoc:
    public func someMethodWithAllComments(inputParameter: String) throws -> ExcludedCommentsOnly.Usefulness {
        let c_inputParameter = moveToCType(inputParameter)
        let RESULT = smoke_ExcludedCommentsOnly_someMethodWithAllComments(self.c_instance, c_inputParameter.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as ExcludedCommentsOnly.SomethingWrongError
        } else {
            return moveFromCType(RESULT.returned_value)
        }
    }
    ///
    /// :nodoc:
    public func someMethodWithoutReturnTypeOrInputParameters() -> Void {
        return moveFromCType(smoke_ExcludedCommentsOnly_someMethodWithoutReturnTypeOrInputParameters(self.c_instance))
    }
}
internal func getRef(_ ref: ExcludedCommentsOnly?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ExcludedCommentsOnly_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ExcludedCommentsOnly_release_handle)
        : RefHolder(handle_copy)
}
extension ExcludedCommentsOnly: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension ExcludedCommentsOnly: Hashable {
    /// :nodoc:
    public static func == (lhs: ExcludedCommentsOnly, rhs: ExcludedCommentsOnly) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func ExcludedCommentsOnly_copyFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly {
    if let swift_pointer = smoke_ExcludedCommentsOnly_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExcludedCommentsOnly {
        return re_constructed
    }
    let result = ExcludedCommentsOnly(cExcludedCommentsOnly: smoke_ExcludedCommentsOnly_copy_handle(handle))
    smoke_ExcludedCommentsOnly_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ExcludedCommentsOnly_moveFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly {
    if let swift_pointer = smoke_ExcludedCommentsOnly_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ExcludedCommentsOnly {
        smoke_ExcludedCommentsOnly_release_handle(handle)
        return re_constructed
    }
    let result = ExcludedCommentsOnly(cExcludedCommentsOnly: handle)
    smoke_ExcludedCommentsOnly_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ExcludedCommentsOnly_copyFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly? {
    guard handle != 0 else {
        return nil
    }
    return ExcludedCommentsOnly_moveFromCType(handle) as ExcludedCommentsOnly
}
internal func ExcludedCommentsOnly_moveFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly? {
    guard handle != 0 else {
        return nil
    }
    return ExcludedCommentsOnly_moveFromCType(handle) as ExcludedCommentsOnly
}
internal func copyToCType(_ swiftClass: ExcludedCommentsOnly) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExcludedCommentsOnly) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ExcludedCommentsOnly?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ExcludedCommentsOnly?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly.SomeLambda {
    return moveFromCType(smoke_ExcludedCommentsOnly_SomeLambda_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly.SomeLambda {
    let refHolder = RefHolder(ref: handle, release: smoke_ExcludedCommentsOnly_SomeLambda_release_handle)
    return { (p0: String, p1: Int32) -> Double in
        let _p0 = moveToCType(p0)
        let _p1 = moveToCType(p1)
        return moveFromCType(smoke_ExcludedCommentsOnly_SomeLambda_call(refHolder.ref, _p0.ref, _p1.ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly.SomeLambda? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as ExcludedCommentsOnly.SomeLambda
}
internal func moveFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly.SomeLambda? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as ExcludedCommentsOnly.SomeLambda
}
internal func createFunctionalTable(_ swiftType: @escaping ExcludedCommentsOnly.SomeLambda) -> smoke_ExcludedCommentsOnly_SomeLambda_FunctionTable {
    class smoke_ExcludedCommentsOnly_SomeLambda_Holder {
        let closure: ExcludedCommentsOnly.SomeLambda
        init(_ closure: @escaping ExcludedCommentsOnly.SomeLambda) {
            self.closure = closure
        }
    }
    var functions = smoke_ExcludedCommentsOnly_SomeLambda_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_ExcludedCommentsOnly_SomeLambda_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_ExcludedCommentsOnly_SomeLambda_call = { swift_closure_pointer, p0, p1 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_ExcludedCommentsOnly_SomeLambda_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0), moveFromCType(p1))).ref
    }
    return functions
}
internal func copyToCType(_ swiftType: @escaping ExcludedCommentsOnly.SomeLambda) -> RefHolder {
    let handle = smoke_ExcludedCommentsOnly_SomeLambda_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping ExcludedCommentsOnly.SomeLambda) -> RefHolder {
    let handle = smoke_ExcludedCommentsOnly_SomeLambda_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_ExcludedCommentsOnly_SomeLambda_release_handle)
}
internal func copyToCType(_ swiftType: ExcludedCommentsOnly.SomeLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_ExcludedCommentsOnly_SomeLambda_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: ExcludedCommentsOnly.SomeLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_ExcludedCommentsOnly_SomeLambda_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_ExcludedCommentsOnly_SomeLambda_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly.SomeStruct {
    return ExcludedCommentsOnly.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly.SomeStruct {
    defer {
        smoke_ExcludedCommentsOnly_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ExcludedCommentsOnly.SomeStruct) -> RefHolder {
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_ExcludedCommentsOnly_SomeStruct_create_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: ExcludedCommentsOnly.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExcludedCommentsOnly_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_ExcludedCommentsOnly_SomeStruct_unwrap_optional_handle(handle)
    return ExcludedCommentsOnly.SomeStruct(cHandle: unwrappedHandle) as ExcludedCommentsOnly.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly.SomeStruct? {
    defer {
        smoke_ExcludedCommentsOnly_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ExcludedCommentsOnly.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_someField = moveToCType(swiftType.someField)
    return RefHolder(smoke_ExcludedCommentsOnly_SomeStruct_create_optional_handle(c_someField.ref))
}
internal func moveToCType(_ swiftType: ExcludedCommentsOnly.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_ExcludedCommentsOnly_SomeStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: ExcludedCommentsOnly.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: ExcludedCommentsOnly.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: ExcludedCommentsOnly.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: ExcludedCommentsOnly.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> ExcludedCommentsOnly.SomeEnum {
    return ExcludedCommentsOnly.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> ExcludedCommentsOnly.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return ExcludedCommentsOnly.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> ExcludedCommentsOnly.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
extension ExcludedCommentsOnly.SomeEnum : Error {
}
