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
    /// - Parameter p0: Very useful input parameter
    /// - Parameter p1: Slightly less useful input parameter
    /// - Returns: Usefulness of the input
    public typealias SomeLambda = (String, Int32) -> Double


    /// This is some very useful constant.
    public static let veryUseful: Comments.Usefulness = true
    /// Some very useful property.
    /// Note: without these comments user may not be able to use it correctly.
    /// Note: that's serious.
    /// Therefore, these lines above getter/setter need to be rendered in the output files.
    public var isSomeProperty: Comments.Usefulness {
        get {
            let c_result_handle = smoke_Comments_isSomeProperty_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_Comments_isSomeProperty_set(self.c_instance, c_value.ref)
        }
    }
    /// OnlyGetterProperty, which does not have a setter.
    /// The generated documentation for this property should only be added to property or getter.
    public var onlyGetterProperty: Int32 {
        get {
            let c_result_handle = smoke_Comments_onlyGetterProperty_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
    }
    /// A flag that determines if `Comments.onlyGetterProperty` is visible on the screen.
    /// By default it is set to `false`. In this case the mentioned thing is not visible on the
    /// screen except the case when another flag called `Comments.isSomeProperty` forces it.
    /// When set to `true` then it is always visible.
    ///
    /// The additional information about usage of the visibility flag is described here. It contains a lot
    /// of references. For instance, if `Comments.isSomeProperty` is `nil`
    /// then it is not visible even if flag is set to `true`.
    public var isIsVisible: Bool {
        get {
            let c_result_handle = smoke_Comments_isIsVisible_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_Comments_isIsVisible_set(self.c_instance, c_value.ref)
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
        smoke_Comments_remove_swift_object_from_wrapper_cache(c_instance)
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

        /// This is some struct method that does nothing.
        public func someStructMethod() -> Void {
            let c_self_handle = moveToCType(self)
            smoke_Comments_SomeStruct_someStructMethod(c_self_handle.ref)
        }
        /// This is some static struct method that does nothing.
        public static func someStaticStructMethod() -> Void {
            smoke_Comments_SomeStruct_someStaticStructMethod()
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
        }
        let c_result_handle = RESULT.returned_value
        return moveFromCType(c_result_handle)
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    /// - Returns:
    public func someMethodWithInputComments(input: String) -> Comments.Usefulness {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_Comments_someMethodWithInputComments(self.c_instance, c_input.ref)
        return moveFromCType(c_result_handle)
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input:
    /// - Returns: Usefulness of the input
    public func someMethodWithOutputComments(input: String) -> Comments.Usefulness {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_Comments_someMethodWithOutputComments(self.c_instance, c_input.ref)
        return moveFromCType(c_result_handle)
    }
    /// This is some very useful method that measures the usefulness of its input.
    /// - Parameter input:
    /// - Returns:
    public func someMethodWithNoComments(input: String) -> Comments.Usefulness {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_Comments_someMethodWithNoComments(self.c_instance, c_input.ref)
        return moveFromCType(c_result_handle)
    }
    /// This is some very useful method that does not measure the usefulness of its input.
    /// - Parameter input: Very useful input parameter
    public func someMethodWithoutReturnTypeWithAllComments(input: String) -> Void {
        let c_input = moveToCType(input)
        smoke_Comments_someMethodWithoutReturnTypeWithAllComments(self.c_instance, c_input.ref)
    }
    /// This is some very useful method that does not measure the usefulness of its input.
    /// - Parameter input:
    public func someMethodWithoutReturnTypeWithNoComments(input: String) -> Void {
        let c_input = moveToCType(input)
        smoke_Comments_someMethodWithoutReturnTypeWithNoComments(self.c_instance, c_input.ref)
    }
    /// This is some very useful method that measures the usefulness of something.
    /// - Returns: Usefulness of the input
    public func someMethodWithoutInputParametersWithAllComments() -> Comments.Usefulness {
        let c_result_handle = smoke_Comments_someMethodWithoutInputParametersWithAllComments(self.c_instance)
        return moveFromCType(c_result_handle)
    }
    /// This is some very useful method that measures the usefulness of something.
    /// - Returns:
    public func someMethodWithoutInputParametersWithNoComments() -> Comments.Usefulness {
        let c_result_handle = smoke_Comments_someMethodWithoutInputParametersWithNoComments(self.c_instance)
        return moveFromCType(c_result_handle)
    }
    public func someMethodWithNothing() -> Void {
        smoke_Comments_someMethodWithNothing(self.c_instance)
    }
    /// This is some very useful method that does nothing.
    public func someMethodWithoutReturnTypeOrInputParameters() -> Void {
        smoke_Comments_someMethodWithoutReturnTypeOrInputParameters(self.c_instance)
    }
    ///
    /// - Parameters:
    ///   - undocumented:
    ///   - documented: nicely documented
    /// - Returns:
    public func oneParameterCommentOnly(undocumented: String, documented: String) -> String {
        let c_undocumented = moveToCType(undocumented)
        let c_documented = moveToCType(documented)
        let c_result_handle = smoke_Comments_oneParameterCommentOnly(self.c_instance, c_undocumented.ref, c_documented.ref)
        return moveFromCType(c_result_handle)
    }
    ///
    /// - Parameter undocumented:
    /// - Returns: nicely documented
    public func returnCommentOnly(undocumented: String) -> String {
        let c_undocumented = moveToCType(undocumented)
        let c_result_handle = smoke_Comments_returnCommentOnly(self.c_instance, c_undocumented.ref)
        return moveFromCType(c_result_handle)
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
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension Comments: Hashable {
    /// :nodoc:
    public static func == (lhs: Comments, rhs: Comments) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }

    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}

internal func Comments_copyFromCType(_ handle: _baseRef) -> Comments {
    if let swift_pointer = smoke_Comments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Comments {
        return re_constructed
    }
    let result = Comments(cComments: smoke_Comments_copy_handle(handle))
    smoke_Comments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func Comments_moveFromCType(_ handle: _baseRef) -> Comments {
    if let swift_pointer = smoke_Comments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Comments {
        smoke_Comments_release_handle(handle)
        return re_constructed
    }
    let result = Comments(cComments: handle)
    smoke_Comments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
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

internal func Comments_SomeLambda_copyFromCType(_ handle: _baseRef) -> Comments.SomeLambda {
    return Comments_SomeLambda_moveFromCType(smoke_Comments_SomeLambda_copy_handle(handle))
}
internal func Comments_SomeLambda_moveFromCType(_ handle: _baseRef) -> Comments.SomeLambda {
    let refHolder = RefHolder(ref: handle, release: smoke_Comments_SomeLambda_release_handle)
    return { (p0: String, p1: Int32) -> Double in
        let _p0 = moveToCType(p0)
        let _p1 = moveToCType(p1)
        return moveFromCType(smoke_Comments_SomeLambda_call(refHolder.ref, _p0.ref, _p1.ref))
    }
}

internal func Comments_SomeLambda_copyFromCType(_ handle: _baseRef) -> Comments.SomeLambda? {
    guard handle != 0 else {
        return nil
    }
    return Comments_SomeLambda_copyFromCType(handle) as Comments.SomeLambda
}
internal func Comments_SomeLambda_moveFromCType(_ handle: _baseRef) -> Comments.SomeLambda? {
    guard handle != 0 else {
        return nil
    }
    return Comments_SomeLambda_moveFromCType(handle) as Comments.SomeLambda
}

internal func Comments_SomeLambda_createFunctionalTable(_ swiftType: @escaping Comments.SomeLambda) -> smoke_Comments_SomeLambda_FunctionTable {
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

internal func Comments_SomeLambda_copyToCType(_ swiftType: @escaping Comments.SomeLambda) -> RefHolder {
    let handle = smoke_Comments_SomeLambda_create_proxy(Comments_SomeLambda_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Comments_SomeLambda_moveToCType(_ swiftType: @escaping Comments.SomeLambda) -> RefHolder {
    let handle = smoke_Comments_SomeLambda_create_proxy(Comments_SomeLambda_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Comments_SomeLambda_release_handle)
}

internal func Comments_SomeLambda_copyToCType(_ swiftType: Comments.SomeLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_Comments_SomeLambda_create_optional_proxy(Comments_SomeLambda_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Comments_SomeLambda_moveToCType(_ swiftType: Comments.SomeLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_Comments_SomeLambda_create_optional_proxy(Comments_SomeLambda_createFunctionalTable(swiftType))
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
