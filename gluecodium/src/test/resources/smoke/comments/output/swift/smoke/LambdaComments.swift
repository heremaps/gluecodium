//
//
import Foundation

public class LambdaComments {

    /// The first line of the doc.
    /// - Parameter p0: The first input parameter
    public typealias WithNoNamedParameters = (String) -> String

    /// The first line of the doc.
    public typealias WithNoDocsForParameters = (String) -> String

    /// The first line of the doc.
    /// - Parameter inputParameter: The first input parameter. The second sentence of the first input parameter.
    /// - Returns: The string.
    public typealias WithNamedParameters = (_ inputParameter: String) -> String

    /// The first line of the doc.
    /// - Returns: The string.
    public typealias MixedDocNameParameters = (_ inputParameter: String, _ secondInputParameter: String) -> String

    public typealias NoCommentsNoNamedParams = (String, String) -> String

    public typealias NoCommentsWithNamedParams = (_ first: String, _ second: String) -> String


    let c_instance : _baseRef

    init(cLambdaComments: _baseRef) {
        guard cLambdaComments != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cLambdaComments
    }

    deinit {
        smoke_LambdaComments_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_LambdaComments_release_handle(c_instance)
    }


}



internal func getRef(_ ref: LambdaComments?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_LambdaComments_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_LambdaComments_release_handle)
        : RefHolder(handle_copy)
}

extension LambdaComments: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension LambdaComments: Hashable {
    /// :nodoc:
    public static func == (lhs: LambdaComments, rhs: LambdaComments) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }

    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}

internal func LambdaComments_copyFromCType(_ handle: _baseRef) -> LambdaComments {
    if let swift_pointer = smoke_LambdaComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LambdaComments {
        return re_constructed
    }
    let result = LambdaComments(cLambdaComments: smoke_LambdaComments_copy_handle(handle))
    smoke_LambdaComments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func LambdaComments_moveFromCType(_ handle: _baseRef) -> LambdaComments {
    if let swift_pointer = smoke_LambdaComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LambdaComments {
        smoke_LambdaComments_release_handle(handle)
        return re_constructed
    }
    let result = LambdaComments(cLambdaComments: handle)
    smoke_LambdaComments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func LambdaComments_copyFromCType(_ handle: _baseRef) -> LambdaComments? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_moveFromCType(handle) as LambdaComments
}
internal func LambdaComments_moveFromCType(_ handle: _baseRef) -> LambdaComments? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_moveFromCType(handle) as LambdaComments
}

internal func copyToCType(_ swiftClass: LambdaComments) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: LambdaComments) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftClass: LambdaComments?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: LambdaComments?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func LambdaComments_WithNoNamedParameters_copyFromCType(_ handle: _baseRef) -> LambdaComments.WithNoNamedParameters {
    return LambdaComments_WithNoNamedParameters_moveFromCType(smoke_LambdaComments_WithNoNamedParameters_copy_handle(handle))
}
internal func LambdaComments_WithNoNamedParameters_moveFromCType(_ handle: _baseRef) -> LambdaComments.WithNoNamedParameters {
    let refHolder = RefHolder(ref: handle, release: smoke_LambdaComments_WithNoNamedParameters_release_handle)
    return { (p0: String) -> String in
        let _p0 = moveToCType(p0)
        return moveFromCType(smoke_LambdaComments_WithNoNamedParameters_call(refHolder.ref, _p0.ref))
    }
}

internal func LambdaComments_WithNoNamedParameters_copyFromCType(_ handle: _baseRef) -> LambdaComments.WithNoNamedParameters? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_WithNoNamedParameters_copyFromCType(handle) as LambdaComments.WithNoNamedParameters
}
internal func LambdaComments_WithNoNamedParameters_moveFromCType(_ handle: _baseRef) -> LambdaComments.WithNoNamedParameters? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_WithNoNamedParameters_moveFromCType(handle) as LambdaComments.WithNoNamedParameters
}

internal func LambdaComments_WithNoNamedParameters_createFunctionalTable(_ swiftType: @escaping LambdaComments.WithNoNamedParameters) -> smoke_LambdaComments_WithNoNamedParameters_FunctionTable {
    class smoke_LambdaComments_WithNoNamedParameters_Holder {
        let closure: LambdaComments.WithNoNamedParameters
        init(_ closure: @escaping LambdaComments.WithNoNamedParameters) {
            self.closure = closure
        }
    }

    var functions = smoke_LambdaComments_WithNoNamedParameters_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_LambdaComments_WithNoNamedParameters_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_LambdaComments_WithNoNamedParameters_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_LambdaComments_WithNoNamedParameters_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0))).ref
    }

    return functions
}

internal func LambdaComments_WithNoNamedParameters_copyToCType(_ swiftType: @escaping LambdaComments.WithNoNamedParameters) -> RefHolder {
    let handle = smoke_LambdaComments_WithNoNamedParameters_create_proxy(LambdaComments_WithNoNamedParameters_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_WithNoNamedParameters_moveToCType(_ swiftType: @escaping LambdaComments.WithNoNamedParameters) -> RefHolder {
    let handle = smoke_LambdaComments_WithNoNamedParameters_create_proxy(LambdaComments_WithNoNamedParameters_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_WithNoNamedParameters_release_handle)
}

internal func LambdaComments_WithNoNamedParameters_copyToCType(_ swiftType: LambdaComments.WithNoNamedParameters?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_WithNoNamedParameters_create_optional_proxy(LambdaComments_WithNoNamedParameters_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_WithNoNamedParameters_moveToCType(_ swiftType: LambdaComments.WithNoNamedParameters?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_WithNoNamedParameters_create_optional_proxy(LambdaComments_WithNoNamedParameters_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_WithNoNamedParameters_release_handle)
}
internal func LambdaComments_WithNoDocsForParameters_copyFromCType(_ handle: _baseRef) -> LambdaComments.WithNoDocsForParameters {
    return LambdaComments_WithNoDocsForParameters_moveFromCType(smoke_LambdaComments_WithNoDocsForParameters_copy_handle(handle))
}
internal func LambdaComments_WithNoDocsForParameters_moveFromCType(_ handle: _baseRef) -> LambdaComments.WithNoDocsForParameters {
    let refHolder = RefHolder(ref: handle, release: smoke_LambdaComments_WithNoDocsForParameters_release_handle)
    return { (p0: String) -> String in
        let _p0 = moveToCType(p0)
        return moveFromCType(smoke_LambdaComments_WithNoDocsForParameters_call(refHolder.ref, _p0.ref))
    }
}

internal func LambdaComments_WithNoDocsForParameters_copyFromCType(_ handle: _baseRef) -> LambdaComments.WithNoDocsForParameters? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_WithNoDocsForParameters_copyFromCType(handle) as LambdaComments.WithNoDocsForParameters
}
internal func LambdaComments_WithNoDocsForParameters_moveFromCType(_ handle: _baseRef) -> LambdaComments.WithNoDocsForParameters? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_WithNoDocsForParameters_moveFromCType(handle) as LambdaComments.WithNoDocsForParameters
}

internal func LambdaComments_WithNoDocsForParameters_createFunctionalTable(_ swiftType: @escaping LambdaComments.WithNoDocsForParameters) -> smoke_LambdaComments_WithNoDocsForParameters_FunctionTable {
    class smoke_LambdaComments_WithNoDocsForParameters_Holder {
        let closure: LambdaComments.WithNoDocsForParameters
        init(_ closure: @escaping LambdaComments.WithNoDocsForParameters) {
            self.closure = closure
        }
    }

    var functions = smoke_LambdaComments_WithNoDocsForParameters_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_LambdaComments_WithNoDocsForParameters_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_LambdaComments_WithNoDocsForParameters_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_LambdaComments_WithNoDocsForParameters_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0))).ref
    }

    return functions
}

internal func LambdaComments_WithNoDocsForParameters_copyToCType(_ swiftType: @escaping LambdaComments.WithNoDocsForParameters) -> RefHolder {
    let handle = smoke_LambdaComments_WithNoDocsForParameters_create_proxy(LambdaComments_WithNoDocsForParameters_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_WithNoDocsForParameters_moveToCType(_ swiftType: @escaping LambdaComments.WithNoDocsForParameters) -> RefHolder {
    let handle = smoke_LambdaComments_WithNoDocsForParameters_create_proxy(LambdaComments_WithNoDocsForParameters_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_WithNoDocsForParameters_release_handle)
}

internal func LambdaComments_WithNoDocsForParameters_copyToCType(_ swiftType: LambdaComments.WithNoDocsForParameters?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_WithNoDocsForParameters_create_optional_proxy(LambdaComments_WithNoDocsForParameters_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_WithNoDocsForParameters_moveToCType(_ swiftType: LambdaComments.WithNoDocsForParameters?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_WithNoDocsForParameters_create_optional_proxy(LambdaComments_WithNoDocsForParameters_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_WithNoDocsForParameters_release_handle)
}
internal func LambdaComments_WithNamedParameters_copyFromCType(_ handle: _baseRef) -> LambdaComments.WithNamedParameters {
    return LambdaComments_WithNamedParameters_moveFromCType(smoke_LambdaComments_WithNamedParameters_copy_handle(handle))
}
internal func LambdaComments_WithNamedParameters_moveFromCType(_ handle: _baseRef) -> LambdaComments.WithNamedParameters {
    let refHolder = RefHolder(ref: handle, release: smoke_LambdaComments_WithNamedParameters_release_handle)
    return { (p0: String) -> String in
        let _p0 = moveToCType(p0)
        return moveFromCType(smoke_LambdaComments_WithNamedParameters_call(refHolder.ref, _p0.ref))
    }
}

internal func LambdaComments_WithNamedParameters_copyFromCType(_ handle: _baseRef) -> LambdaComments.WithNamedParameters? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_WithNamedParameters_copyFromCType(handle) as LambdaComments.WithNamedParameters
}
internal func LambdaComments_WithNamedParameters_moveFromCType(_ handle: _baseRef) -> LambdaComments.WithNamedParameters? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_WithNamedParameters_moveFromCType(handle) as LambdaComments.WithNamedParameters
}

internal func LambdaComments_WithNamedParameters_createFunctionalTable(_ swiftType: @escaping LambdaComments.WithNamedParameters) -> smoke_LambdaComments_WithNamedParameters_FunctionTable {
    class smoke_LambdaComments_WithNamedParameters_Holder {
        let closure: LambdaComments.WithNamedParameters
        init(_ closure: @escaping LambdaComments.WithNamedParameters) {
            self.closure = closure
        }
    }

    var functions = smoke_LambdaComments_WithNamedParameters_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_LambdaComments_WithNamedParameters_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_LambdaComments_WithNamedParameters_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_LambdaComments_WithNamedParameters_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0))).ref
    }

    return functions
}

internal func LambdaComments_WithNamedParameters_copyToCType(_ swiftType: @escaping LambdaComments.WithNamedParameters) -> RefHolder {
    let handle = smoke_LambdaComments_WithNamedParameters_create_proxy(LambdaComments_WithNamedParameters_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_WithNamedParameters_moveToCType(_ swiftType: @escaping LambdaComments.WithNamedParameters) -> RefHolder {
    let handle = smoke_LambdaComments_WithNamedParameters_create_proxy(LambdaComments_WithNamedParameters_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_WithNamedParameters_release_handle)
}

internal func LambdaComments_WithNamedParameters_copyToCType(_ swiftType: LambdaComments.WithNamedParameters?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_WithNamedParameters_create_optional_proxy(LambdaComments_WithNamedParameters_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_WithNamedParameters_moveToCType(_ swiftType: LambdaComments.WithNamedParameters?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_WithNamedParameters_create_optional_proxy(LambdaComments_WithNamedParameters_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_WithNamedParameters_release_handle)
}
internal func LambdaComments_MixedDocNameParameters_copyFromCType(_ handle: _baseRef) -> LambdaComments.MixedDocNameParameters {
    return LambdaComments_MixedDocNameParameters_moveFromCType(smoke_LambdaComments_MixedDocNameParameters_copy_handle(handle))
}
internal func LambdaComments_MixedDocNameParameters_moveFromCType(_ handle: _baseRef) -> LambdaComments.MixedDocNameParameters {
    let refHolder = RefHolder(ref: handle, release: smoke_LambdaComments_MixedDocNameParameters_release_handle)
    return { (p0: String, p1: String) -> String in
        let _p0 = moveToCType(p0)
        let _p1 = moveToCType(p1)
        return moveFromCType(smoke_LambdaComments_MixedDocNameParameters_call(refHolder.ref, _p0.ref, _p1.ref))
    }
}

internal func LambdaComments_MixedDocNameParameters_copyFromCType(_ handle: _baseRef) -> LambdaComments.MixedDocNameParameters? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_MixedDocNameParameters_copyFromCType(handle) as LambdaComments.MixedDocNameParameters
}
internal func LambdaComments_MixedDocNameParameters_moveFromCType(_ handle: _baseRef) -> LambdaComments.MixedDocNameParameters? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_MixedDocNameParameters_moveFromCType(handle) as LambdaComments.MixedDocNameParameters
}

internal func LambdaComments_MixedDocNameParameters_createFunctionalTable(_ swiftType: @escaping LambdaComments.MixedDocNameParameters) -> smoke_LambdaComments_MixedDocNameParameters_FunctionTable {
    class smoke_LambdaComments_MixedDocNameParameters_Holder {
        let closure: LambdaComments.MixedDocNameParameters
        init(_ closure: @escaping LambdaComments.MixedDocNameParameters) {
            self.closure = closure
        }
    }

    var functions = smoke_LambdaComments_MixedDocNameParameters_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_LambdaComments_MixedDocNameParameters_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_LambdaComments_MixedDocNameParameters_call = { swift_closure_pointer, p0, p1 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_LambdaComments_MixedDocNameParameters_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0), moveFromCType(p1))).ref
    }

    return functions
}

internal func LambdaComments_MixedDocNameParameters_copyToCType(_ swiftType: @escaping LambdaComments.MixedDocNameParameters) -> RefHolder {
    let handle = smoke_LambdaComments_MixedDocNameParameters_create_proxy(LambdaComments_MixedDocNameParameters_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_MixedDocNameParameters_moveToCType(_ swiftType: @escaping LambdaComments.MixedDocNameParameters) -> RefHolder {
    let handle = smoke_LambdaComments_MixedDocNameParameters_create_proxy(LambdaComments_MixedDocNameParameters_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_MixedDocNameParameters_release_handle)
}

internal func LambdaComments_MixedDocNameParameters_copyToCType(_ swiftType: LambdaComments.MixedDocNameParameters?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_MixedDocNameParameters_create_optional_proxy(LambdaComments_MixedDocNameParameters_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_MixedDocNameParameters_moveToCType(_ swiftType: LambdaComments.MixedDocNameParameters?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_MixedDocNameParameters_create_optional_proxy(LambdaComments_MixedDocNameParameters_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_MixedDocNameParameters_release_handle)
}
internal func LambdaComments_NoCommentsNoNamedParams_copyFromCType(_ handle: _baseRef) -> LambdaComments.NoCommentsNoNamedParams {
    return LambdaComments_NoCommentsNoNamedParams_moveFromCType(smoke_LambdaComments_NoCommentsNoNamedParams_copy_handle(handle))
}
internal func LambdaComments_NoCommentsNoNamedParams_moveFromCType(_ handle: _baseRef) -> LambdaComments.NoCommentsNoNamedParams {
    let refHolder = RefHolder(ref: handle, release: smoke_LambdaComments_NoCommentsNoNamedParams_release_handle)
    return { (p0: String, p1: String) -> String in
        let _p0 = moveToCType(p0)
        let _p1 = moveToCType(p1)
        return moveFromCType(smoke_LambdaComments_NoCommentsNoNamedParams_call(refHolder.ref, _p0.ref, _p1.ref))
    }
}

internal func LambdaComments_NoCommentsNoNamedParams_copyFromCType(_ handle: _baseRef) -> LambdaComments.NoCommentsNoNamedParams? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_NoCommentsNoNamedParams_copyFromCType(handle) as LambdaComments.NoCommentsNoNamedParams
}
internal func LambdaComments_NoCommentsNoNamedParams_moveFromCType(_ handle: _baseRef) -> LambdaComments.NoCommentsNoNamedParams? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_NoCommentsNoNamedParams_moveFromCType(handle) as LambdaComments.NoCommentsNoNamedParams
}

internal func LambdaComments_NoCommentsNoNamedParams_createFunctionalTable(_ swiftType: @escaping LambdaComments.NoCommentsNoNamedParams) -> smoke_LambdaComments_NoCommentsNoNamedParams_FunctionTable {
    class smoke_LambdaComments_NoCommentsNoNamedParams_Holder {
        let closure: LambdaComments.NoCommentsNoNamedParams
        init(_ closure: @escaping LambdaComments.NoCommentsNoNamedParams) {
            self.closure = closure
        }
    }

    var functions = smoke_LambdaComments_NoCommentsNoNamedParams_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_LambdaComments_NoCommentsNoNamedParams_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_LambdaComments_NoCommentsNoNamedParams_call = { swift_closure_pointer, p0, p1 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_LambdaComments_NoCommentsNoNamedParams_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0), moveFromCType(p1))).ref
    }

    return functions
}

internal func LambdaComments_NoCommentsNoNamedParams_copyToCType(_ swiftType: @escaping LambdaComments.NoCommentsNoNamedParams) -> RefHolder {
    let handle = smoke_LambdaComments_NoCommentsNoNamedParams_create_proxy(LambdaComments_NoCommentsNoNamedParams_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_NoCommentsNoNamedParams_moveToCType(_ swiftType: @escaping LambdaComments.NoCommentsNoNamedParams) -> RefHolder {
    let handle = smoke_LambdaComments_NoCommentsNoNamedParams_create_proxy(LambdaComments_NoCommentsNoNamedParams_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_NoCommentsNoNamedParams_release_handle)
}

internal func LambdaComments_NoCommentsNoNamedParams_copyToCType(_ swiftType: LambdaComments.NoCommentsNoNamedParams?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_NoCommentsNoNamedParams_create_optional_proxy(LambdaComments_NoCommentsNoNamedParams_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_NoCommentsNoNamedParams_moveToCType(_ swiftType: LambdaComments.NoCommentsNoNamedParams?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_NoCommentsNoNamedParams_create_optional_proxy(LambdaComments_NoCommentsNoNamedParams_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_NoCommentsNoNamedParams_release_handle)
}
internal func LambdaComments_NoCommentsWithNamedParams_copyFromCType(_ handle: _baseRef) -> LambdaComments.NoCommentsWithNamedParams {
    return LambdaComments_NoCommentsWithNamedParams_moveFromCType(smoke_LambdaComments_NoCommentsWithNamedParams_copy_handle(handle))
}
internal func LambdaComments_NoCommentsWithNamedParams_moveFromCType(_ handle: _baseRef) -> LambdaComments.NoCommentsWithNamedParams {
    let refHolder = RefHolder(ref: handle, release: smoke_LambdaComments_NoCommentsWithNamedParams_release_handle)
    return { (p0: String, p1: String) -> String in
        let _p0 = moveToCType(p0)
        let _p1 = moveToCType(p1)
        return moveFromCType(smoke_LambdaComments_NoCommentsWithNamedParams_call(refHolder.ref, _p0.ref, _p1.ref))
    }
}

internal func LambdaComments_NoCommentsWithNamedParams_copyFromCType(_ handle: _baseRef) -> LambdaComments.NoCommentsWithNamedParams? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_NoCommentsWithNamedParams_copyFromCType(handle) as LambdaComments.NoCommentsWithNamedParams
}
internal func LambdaComments_NoCommentsWithNamedParams_moveFromCType(_ handle: _baseRef) -> LambdaComments.NoCommentsWithNamedParams? {
    guard handle != 0 else {
        return nil
    }
    return LambdaComments_NoCommentsWithNamedParams_moveFromCType(handle) as LambdaComments.NoCommentsWithNamedParams
}

internal func LambdaComments_NoCommentsWithNamedParams_createFunctionalTable(_ swiftType: @escaping LambdaComments.NoCommentsWithNamedParams) -> smoke_LambdaComments_NoCommentsWithNamedParams_FunctionTable {
    class smoke_LambdaComments_NoCommentsWithNamedParams_Holder {
        let closure: LambdaComments.NoCommentsWithNamedParams
        init(_ closure: @escaping LambdaComments.NoCommentsWithNamedParams) {
            self.closure = closure
        }
    }

    var functions = smoke_LambdaComments_NoCommentsWithNamedParams_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_LambdaComments_NoCommentsWithNamedParams_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_LambdaComments_NoCommentsWithNamedParams_call = { swift_closure_pointer, p0, p1 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_LambdaComments_NoCommentsWithNamedParams_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0), moveFromCType(p1))).ref
    }

    return functions
}

internal func LambdaComments_NoCommentsWithNamedParams_copyToCType(_ swiftType: @escaping LambdaComments.NoCommentsWithNamedParams) -> RefHolder {
    let handle = smoke_LambdaComments_NoCommentsWithNamedParams_create_proxy(LambdaComments_NoCommentsWithNamedParams_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_NoCommentsWithNamedParams_moveToCType(_ swiftType: @escaping LambdaComments.NoCommentsWithNamedParams) -> RefHolder {
    let handle = smoke_LambdaComments_NoCommentsWithNamedParams_create_proxy(LambdaComments_NoCommentsWithNamedParams_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_NoCommentsWithNamedParams_release_handle)
}

internal func LambdaComments_NoCommentsWithNamedParams_copyToCType(_ swiftType: LambdaComments.NoCommentsWithNamedParams?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_NoCommentsWithNamedParams_create_optional_proxy(LambdaComments_NoCommentsWithNamedParams_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func LambdaComments_NoCommentsWithNamedParams_moveToCType(_ swiftType: LambdaComments.NoCommentsWithNamedParams?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }

    let handle = smoke_LambdaComments_NoCommentsWithNamedParams_create_optional_proxy(LambdaComments_NoCommentsWithNamedParams_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdaComments_NoCommentsWithNamedParams_release_handle)
}


