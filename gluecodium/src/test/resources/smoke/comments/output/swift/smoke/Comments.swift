//
//
import Foundation
/// This is some very useful interface.
public class Comments {
    /// This is some very useful typedef.
    public typealias Usefulness = Bool
    /// This is some very useful exception.
    public typealias SomethingWrongError = Comments.SomeEnum
    /// This is some very useful lambda that does it.
    public typealias SomeLambda = (String, Int32) -> Double
    /// This is some very useful constant.
    public static let veryUseful: Comments.Usefulness = true
    /// Some very useful property.
    public var isSomeProperty: Comments.Usefulness {
        get {
            return moveFromCType(smoke_Comments_someProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Comments_someProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cComments: _baseRef) {
        guard cComments != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cComments
    }
    deinit {
        smoke_Comments_release_handle(c_instance)
    }
    /// This is some very useful enum.
    public enum SomeEnum : UInt32, CaseIterable, Codable {
        /// Not quite useful
        case useless
        /// Somewhat useful
        case useful
    }
    /// This is some very useful struct.
    public struct SomeStruct {
        /// How useful this struct is
        /// remains to be seen
        public var someField: Comments.Usefulness
        /// Can be `nil`
        public var nullableField: String?
        /// This is how easy it is to construct.
        /// - Parameters
        ///   - someField: How useful this struct is
        ///       remains to be seen
        ///   - nullableField: Can be `nil`
        public init(someField: Comments.Usefulness, nullableField: String? = nil) {
            self.someField = someField
            self.nullableField = nullableField
        }
        internal init(cHandle: _baseRef) {
            someField = moveFromCType(smoke_Comments_SomeStruct_someField_get(cHandle))
            nullableField = moveFromCType(smoke_Comments_SomeStruct_nullableField_get(cHandle))
        }
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter inputParameter: Very useful input parameter
    /// - Returns: Usefulness of the input
    /// - Throws: `Comments.SomethingWrongError` Sometimes it happens.
    public func someMethodWithAllComments(inputParameter: String) throws -> Comments.Usefulness {
        let c_inputParameter = moveToCType(inputParameter)
        let RESULT = smoke_Comments_someMethodWithAllComments(self.c_instance, c_inputParameter.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as Comments.SomethingWrongError
        } else {
            return moveFromCType(RESULT.returned_value)
        }
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns:
    public func someMethodWithInputComments(input: String) -> Comments.Usefulness {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithInputComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input:
    /// - Returns: Usefulness of the input
    public func someMethodWithOutputComments(input: String) -> Comments.Usefulness {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithOutputComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input:
    /// - Returns:
    public func someMethodWithNoComments(input: String) -> Comments.Usefulness {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithNoComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that does not measure the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    public func someMethodWithoutReturnTypeWithAllComments(input: String) -> Void {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithoutReturnTypeWithAllComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that does not measure the usefulness of its input.
    /// - Parameter input:
    public func someMethodWithoutReturnTypeWithNoComments(input: String) -> Void {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Comments_someMethodWithoutReturnTypeWithNoComments(self.c_instance, c_input.ref))
    }
    /// This is some very useful method that measures the usefulness of something.
    /// - Returns: Usefulness of the input
    public func someMethodWithoutInputParametersWithAllComments() -> Comments.Usefulness {
        return moveFromCType(smoke_Comments_someMethodWithoutInputParametersWithAllComments(self.c_instance))
    }
    /// This is some very useful method that measures the usefulness of something.
    /// - Returns:
    public func someMethodWithoutInputParametersWithNoComments() -> Comments.Usefulness {
        return moveFromCType(smoke_Comments_someMethodWithoutInputParametersWithNoComments(self.c_instance))
    }
    public func someMethodWithNothing() -> Void {
        return moveFromCType(smoke_Comments_someMethodWithNothing(self.c_instance))
    }
    /// This is some very useful method that does nothing.
    public func someMethodWithoutReturnTypeOrInputParameters() -> Void {
        return moveFromCType(smoke_Comments_someMethodWithoutReturnTypeOrInputParameters(self.c_instance))
    }
    ///
    /// - Parameters:
    ///   - undocumented:
    ///   - documented: nicely documented
    /// - Returns:
    public func oneParameterCommentOnly(undocumented: String, documented: String) -> String {
        let c_undocumented = moveToCType(undocumented)
        let c_documented = moveToCType(documented)
        return moveFromCType(smoke_Comments_oneParameterCommentOnly(self.c_instance, c_undocumented.ref, c_documented.ref))
    }
    ///
    /// - Parameter undocumented:
    /// - Returns: nicely documented
    public func returnCommentOnly(undocumented: String) -> String {
        let c_undocumented = moveToCType(undocumented)
        return moveFromCType(smoke_Comments_returnCommentOnly(self.c_instance, c_undocumented.ref))
    }
}
internal func getRef(_ ref: Comments?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Comments_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Comments_release_handle)
        : RefHolder(handle_copy)
}
extension Comments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func Comments_copyFromCType(_ handle: _baseRef) -> Comments {
    return Comments(cComments: smoke_Comments_copy_handle(handle))
}
internal func Comments_moveFromCType(_ handle: _baseRef) -> Comments {
    return Comments(cComments: handle)
}
internal func Comments_copyFromCType(_ handle: _baseRef) -> Comments? {
    guard handle != 0 else {
        return nil
    }
    return Comments_moveFromCType(handle) as Comments
}
internal func Comments_moveFromCType(_ handle: _baseRef) -> Comments? {
    guard handle != 0 else {
        return nil
    }
    return Comments_moveFromCType(handle) as Comments
}
internal func copyToCType(_ swiftClass: Comments) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Comments) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Comments?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Comments?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> Comments.SomeLambda {
    return moveFromCType(smoke_Comments_SomeLambda_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> Comments.SomeLambda {
    let refHolder = RefHolder(ref: handle, release: smoke_Comments_SomeLambda_release_handle)
    return { (p0: String, p1: Int32) -> Double in
        return moveFromCType(smoke_Comments_SomeLambda_call(refHolder.ref, moveToCType(p0).ref, moveToCType(p1).ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Comments.SomeLambda? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as Comments.SomeLambda
}
internal func moveFromCType(_ handle: _baseRef) -> Comments.SomeLambda? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as Comments.SomeLambda
}
internal func createFunctionalTable(_ swiftType: @escaping Comments.SomeLambda) -> smoke_Comments_SomeLambda_FunctionTable {
    class smoke_Comments_SomeLambda_Holder {
        let closure: Comments.SomeLambda
        init(_ closure: @escaping Comments.SomeLambda) {
            self.closure = closure
        }
    }
    var functions = smoke_Comments_SomeLambda_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_Comments_SomeLambda_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_Comments_SomeLambda_call = { swift_closure_pointer, p0, p1 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_Comments_SomeLambda_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0), moveFromCType(p1))).ref
    }
    return functions
}
internal func copyToCType(_ swiftType: @escaping Comments.SomeLambda) -> RefHolder {
    let handle = smoke_Comments_SomeLambda_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping Comments.SomeLambda) -> RefHolder {
    let handle = smoke_Comments_SomeLambda_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Comments_SomeLambda_release_handle)
}
internal func copyToCType(_ swiftType: Comments.SomeLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Comments_SomeLambda_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: Comments.SomeLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Comments_SomeLambda_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Comments_SomeLambda_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Comments.SomeStruct {
    return Comments.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Comments.SomeStruct {
    defer {
        smoke_Comments_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Comments.SomeStruct) -> RefHolder {
    let c_someField = moveToCType(swiftType.someField)
    let c_nullableField = moveToCType(swiftType.nullableField)
    return RefHolder(smoke_Comments_SomeStruct_create_handle(c_someField.ref, c_nullableField.ref))
}
internal func moveToCType(_ swiftType: Comments.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Comments_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Comments.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Comments_SomeStruct_unwrap_optional_handle(handle)
    return Comments.SomeStruct(cHandle: unwrappedHandle) as Comments.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Comments.SomeStruct? {
    defer {
        smoke_Comments_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Comments.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_someField = moveToCType(swiftType.someField)
    let c_nullableField = moveToCType(swiftType.nullableField)
    return RefHolder(smoke_Comments_SomeStruct_create_optional_handle(c_someField.ref, c_nullableField.ref))
}
internal func moveToCType(_ swiftType: Comments.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Comments_SomeStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: Comments.SomeEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Comments.SomeEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Comments.SomeEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Comments.SomeEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Comments.SomeEnum {
    return Comments.SomeEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Comments.SomeEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Comments.SomeEnum? {
    guard handle != 0 else {
        return nil
    }
    return Comments.SomeEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Comments.SomeEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
extension Comments.SomeEnum : Error {
}
