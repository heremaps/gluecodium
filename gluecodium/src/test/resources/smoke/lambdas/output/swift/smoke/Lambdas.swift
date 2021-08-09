//
//
import Foundation
public class Lambdas {
    public typealias Producer = () -> String
    /// Should confuse everyone thoroughly
    public typealias Convoluter = (String) -> Lambdas.Producer
    public typealias Consumer = (String) -> Void
    public typealias Indexer = (String, Float) -> Int32
    public typealias NullableConfuser = (String?) -> Lambdas.Producer?
    let c_instance : _baseRef
    init(cLambdas: _baseRef) {
        guard cLambdas != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cLambdas
    }
    deinit {
        smoke_Lambdas_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_Lambdas_release_handle(c_instance)
    }
    public func deconfuse(value: String, confuser: @escaping Lambdas.Convoluter) -> Lambdas.Producer {
        let c_value = moveToCType(value)
        let c_confuser = Lambdas_Convoluter_moveToCType(confuser)
        let c_result_handle = smoke_Lambdas_deconfuse(self.c_instance, c_value.ref, c_confuser.ref)
        return Lambdas_Producer_moveFromCType(c_result_handle)
    }
    public static func fuse(items: [String], callback: @escaping Lambdas.Indexer) -> [Int32: String] {
        let c_items = foobar_moveToCType(items)
        let c_callback = Lambdas_Indexer_moveToCType(callback)
        let c_result_handle = smoke_Lambdas_fuse(c_items.ref, c_callback.ref)
        return foobar_moveFromCType(c_result_handle)
    }
}
internal func getRef(_ ref: Lambdas?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Lambdas_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Lambdas_release_handle)
        : RefHolder(handle_copy)
}
extension Lambdas: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension Lambdas: Hashable {
    /// :nodoc:
    public static func == (lhs: Lambdas, rhs: Lambdas) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func Lambdas_copyFromCType(_ handle: _baseRef) -> Lambdas {
    if let swift_pointer = smoke_Lambdas_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Lambdas {
        return re_constructed
    }
    let result = Lambdas(cLambdas: smoke_Lambdas_copy_handle(handle))
    smoke_Lambdas_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Lambdas_moveFromCType(_ handle: _baseRef) -> Lambdas {
    if let swift_pointer = smoke_Lambdas_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Lambdas {
        smoke_Lambdas_release_handle(handle)
        return re_constructed
    }
    let result = Lambdas(cLambdas: handle)
    smoke_Lambdas_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Lambdas_copyFromCType(_ handle: _baseRef) -> Lambdas? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_moveFromCType(handle) as Lambdas
}
internal func Lambdas_moveFromCType(_ handle: _baseRef) -> Lambdas? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_moveFromCType(handle) as Lambdas
}
internal func copyToCType(_ swiftClass: Lambdas) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Lambdas) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Lambdas?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Lambdas?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func Lambdas_Producer_copyFromCType(_ handle: _baseRef) -> Lambdas.Producer {
    return Lambdas_Producer_moveFromCType(smoke_Lambdas_Producer_copy_handle(handle))
}
internal func Lambdas_Producer_moveFromCType(_ handle: _baseRef) -> Lambdas.Producer {
    let refHolder = RefHolder(ref: handle, release: smoke_Lambdas_Producer_release_handle)
    return { () -> String in
        return moveFromCType(smoke_Lambdas_Producer_call(refHolder.ref))
    }
}
internal func Lambdas_Producer_copyFromCType(_ handle: _baseRef) -> Lambdas.Producer? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_Producer_copyFromCType(handle) as Lambdas.Producer
}
internal func Lambdas_Producer_moveFromCType(_ handle: _baseRef) -> Lambdas.Producer? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_Producer_moveFromCType(handle) as Lambdas.Producer
}
internal func Lambdas_Producer_createFunctionalTable(_ swiftType: @escaping Lambdas.Producer) -> smoke_Lambdas_Producer_FunctionTable {
    class smoke_Lambdas_Producer_Holder {
        let closure: Lambdas.Producer
        init(_ closure: @escaping Lambdas.Producer) {
            self.closure = closure
        }
    }
    var functions = smoke_Lambdas_Producer_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_Lambdas_Producer_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_Lambdas_Producer_call = { swift_closure_pointer in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_Lambdas_Producer_Holder
        return copyToCType(closure_holder.closure()).ref
    }
    return functions
}
internal func Lambdas_Producer_copyToCType(_ swiftType: @escaping Lambdas.Producer) -> RefHolder {
    let handle = smoke_Lambdas_Producer_create_proxy(Lambdas_Producer_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Lambdas_Producer_moveToCType(_ swiftType: @escaping Lambdas.Producer) -> RefHolder {
    let handle = smoke_Lambdas_Producer_create_proxy(Lambdas_Producer_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Producer_release_handle)
}
internal func Lambdas_Producer_copyToCType(_ swiftType: Lambdas.Producer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Producer_create_optional_proxy(Lambdas_Producer_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Lambdas_Producer_moveToCType(_ swiftType: Lambdas.Producer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Producer_create_optional_proxy(Lambdas_Producer_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Producer_release_handle)
}
internal func Lambdas_Convoluter_copyFromCType(_ handle: _baseRef) -> Lambdas.Convoluter {
    return Lambdas_Convoluter_moveFromCType(smoke_Lambdas_Convoluter_copy_handle(handle))
}
internal func Lambdas_Convoluter_moveFromCType(_ handle: _baseRef) -> Lambdas.Convoluter {
    let refHolder = RefHolder(ref: handle, release: smoke_Lambdas_Convoluter_release_handle)
    return { (p0: String) -> Lambdas.Producer in
        let _p0 = moveToCType(p0)
        return Lambdas_Producer_moveFromCType(smoke_Lambdas_Convoluter_call(refHolder.ref, _p0.ref))
    }
}
internal func Lambdas_Convoluter_copyFromCType(_ handle: _baseRef) -> Lambdas.Convoluter? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_Convoluter_copyFromCType(handle) as Lambdas.Convoluter
}
internal func Lambdas_Convoluter_moveFromCType(_ handle: _baseRef) -> Lambdas.Convoluter? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_Convoluter_moveFromCType(handle) as Lambdas.Convoluter
}
internal func Lambdas_Convoluter_createFunctionalTable(_ swiftType: @escaping Lambdas.Convoluter) -> smoke_Lambdas_Convoluter_FunctionTable {
    class smoke_Lambdas_Convoluter_Holder {
        let closure: Lambdas.Convoluter
        init(_ closure: @escaping Lambdas.Convoluter) {
            self.closure = closure
        }
    }
    var functions = smoke_Lambdas_Convoluter_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_Lambdas_Convoluter_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_Lambdas_Convoluter_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_Lambdas_Convoluter_Holder
        return Lambdas_Producer_copyToCType(closure_holder.closure(moveFromCType(p0))).ref
    }
    return functions
}
internal func Lambdas_Convoluter_copyToCType(_ swiftType: @escaping Lambdas.Convoluter) -> RefHolder {
    let handle = smoke_Lambdas_Convoluter_create_proxy(Lambdas_Convoluter_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Lambdas_Convoluter_moveToCType(_ swiftType: @escaping Lambdas.Convoluter) -> RefHolder {
    let handle = smoke_Lambdas_Convoluter_create_proxy(Lambdas_Convoluter_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Convoluter_release_handle)
}
internal func Lambdas_Convoluter_copyToCType(_ swiftType: Lambdas.Convoluter?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Convoluter_create_optional_proxy(Lambdas_Convoluter_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Lambdas_Convoluter_moveToCType(_ swiftType: Lambdas.Convoluter?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Convoluter_create_optional_proxy(Lambdas_Convoluter_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Convoluter_release_handle)
}
internal func Lambdas_Consumer_copyFromCType(_ handle: _baseRef) -> Lambdas.Consumer {
    return Lambdas_Consumer_moveFromCType(smoke_Lambdas_Consumer_copy_handle(handle))
}
internal func Lambdas_Consumer_moveFromCType(_ handle: _baseRef) -> Lambdas.Consumer {
    let refHolder = RefHolder(ref: handle, release: smoke_Lambdas_Consumer_release_handle)
    return { (p0: String) -> Void in
        let _p0 = moveToCType(p0)
        return moveFromCType(smoke_Lambdas_Consumer_call(refHolder.ref, _p0.ref))
    }
}
internal func Lambdas_Consumer_copyFromCType(_ handle: _baseRef) -> Lambdas.Consumer? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_Consumer_copyFromCType(handle) as Lambdas.Consumer
}
internal func Lambdas_Consumer_moveFromCType(_ handle: _baseRef) -> Lambdas.Consumer? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_Consumer_moveFromCType(handle) as Lambdas.Consumer
}
internal func Lambdas_Consumer_createFunctionalTable(_ swiftType: @escaping Lambdas.Consumer) -> smoke_Lambdas_Consumer_FunctionTable {
    class smoke_Lambdas_Consumer_Holder {
        let closure: Lambdas.Consumer
        init(_ closure: @escaping Lambdas.Consumer) {
            self.closure = closure
        }
    }
    var functions = smoke_Lambdas_Consumer_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_Lambdas_Consumer_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_Lambdas_Consumer_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_Lambdas_Consumer_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0))).ref
    }
    return functions
}
internal func Lambdas_Consumer_copyToCType(_ swiftType: @escaping Lambdas.Consumer) -> RefHolder {
    let handle = smoke_Lambdas_Consumer_create_proxy(Lambdas_Consumer_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Lambdas_Consumer_moveToCType(_ swiftType: @escaping Lambdas.Consumer) -> RefHolder {
    let handle = smoke_Lambdas_Consumer_create_proxy(Lambdas_Consumer_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Consumer_release_handle)
}
internal func Lambdas_Consumer_copyToCType(_ swiftType: Lambdas.Consumer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Consumer_create_optional_proxy(Lambdas_Consumer_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Lambdas_Consumer_moveToCType(_ swiftType: Lambdas.Consumer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Consumer_create_optional_proxy(Lambdas_Consumer_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Consumer_release_handle)
}
internal func Lambdas_Indexer_copyFromCType(_ handle: _baseRef) -> Lambdas.Indexer {
    return Lambdas_Indexer_moveFromCType(smoke_Lambdas_Indexer_copy_handle(handle))
}
internal func Lambdas_Indexer_moveFromCType(_ handle: _baseRef) -> Lambdas.Indexer {
    let refHolder = RefHolder(ref: handle, release: smoke_Lambdas_Indexer_release_handle)
    return { (p0: String, p1: Float) -> Int32 in
        let _p0 = moveToCType(p0)
        let _p1 = moveToCType(p1)
        return moveFromCType(smoke_Lambdas_Indexer_call(refHolder.ref, _p0.ref, _p1.ref))
    }
}
internal func Lambdas_Indexer_copyFromCType(_ handle: _baseRef) -> Lambdas.Indexer? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_Indexer_copyFromCType(handle) as Lambdas.Indexer
}
internal func Lambdas_Indexer_moveFromCType(_ handle: _baseRef) -> Lambdas.Indexer? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_Indexer_moveFromCType(handle) as Lambdas.Indexer
}
internal func Lambdas_Indexer_createFunctionalTable(_ swiftType: @escaping Lambdas.Indexer) -> smoke_Lambdas_Indexer_FunctionTable {
    class smoke_Lambdas_Indexer_Holder {
        let closure: Lambdas.Indexer
        init(_ closure: @escaping Lambdas.Indexer) {
            self.closure = closure
        }
    }
    var functions = smoke_Lambdas_Indexer_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_Lambdas_Indexer_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_Lambdas_Indexer_call = { swift_closure_pointer, p0, p1 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_Lambdas_Indexer_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0), moveFromCType(p1))).ref
    }
    return functions
}
internal func Lambdas_Indexer_copyToCType(_ swiftType: @escaping Lambdas.Indexer) -> RefHolder {
    let handle = smoke_Lambdas_Indexer_create_proxy(Lambdas_Indexer_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Lambdas_Indexer_moveToCType(_ swiftType: @escaping Lambdas.Indexer) -> RefHolder {
    let handle = smoke_Lambdas_Indexer_create_proxy(Lambdas_Indexer_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Indexer_release_handle)
}
internal func Lambdas_Indexer_copyToCType(_ swiftType: Lambdas.Indexer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Indexer_create_optional_proxy(Lambdas_Indexer_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Lambdas_Indexer_moveToCType(_ swiftType: Lambdas.Indexer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Indexer_create_optional_proxy(Lambdas_Indexer_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Indexer_release_handle)
}
internal func Lambdas_NullableConfuser_copyFromCType(_ handle: _baseRef) -> Lambdas.NullableConfuser {
    return Lambdas_NullableConfuser_moveFromCType(smoke_Lambdas_NullableConfuser_copy_handle(handle))
}
internal func Lambdas_NullableConfuser_moveFromCType(_ handle: _baseRef) -> Lambdas.NullableConfuser {
    let refHolder = RefHolder(ref: handle, release: smoke_Lambdas_NullableConfuser_release_handle)
    return { (p0: String?) -> Lambdas.Producer? in
        let _p0 = moveToCType(p0)
        return Lambdas_Producer_moveFromCType(smoke_Lambdas_NullableConfuser_call(refHolder.ref, _p0.ref))
    }
}
internal func Lambdas_NullableConfuser_copyFromCType(_ handle: _baseRef) -> Lambdas.NullableConfuser? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_NullableConfuser_copyFromCType(handle) as Lambdas.NullableConfuser
}
internal func Lambdas_NullableConfuser_moveFromCType(_ handle: _baseRef) -> Lambdas.NullableConfuser? {
    guard handle != 0 else {
        return nil
    }
    return Lambdas_NullableConfuser_moveFromCType(handle) as Lambdas.NullableConfuser
}
internal func Lambdas_NullableConfuser_createFunctionalTable(_ swiftType: @escaping Lambdas.NullableConfuser) -> smoke_Lambdas_NullableConfuser_FunctionTable {
    class smoke_Lambdas_NullableConfuser_Holder {
        let closure: Lambdas.NullableConfuser
        init(_ closure: @escaping Lambdas.NullableConfuser) {
            self.closure = closure
        }
    }
    var functions = smoke_Lambdas_NullableConfuser_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_Lambdas_NullableConfuser_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_Lambdas_NullableConfuser_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_Lambdas_NullableConfuser_Holder
        return Lambdas_Producer_copyToCType(closure_holder.closure(moveFromCType(p0))).ref
    }
    return functions
}
internal func Lambdas_NullableConfuser_copyToCType(_ swiftType: @escaping Lambdas.NullableConfuser) -> RefHolder {
    let handle = smoke_Lambdas_NullableConfuser_create_proxy(Lambdas_NullableConfuser_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Lambdas_NullableConfuser_moveToCType(_ swiftType: @escaping Lambdas.NullableConfuser) -> RefHolder {
    let handle = smoke_Lambdas_NullableConfuser_create_proxy(Lambdas_NullableConfuser_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_NullableConfuser_release_handle)
}
internal func Lambdas_NullableConfuser_copyToCType(_ swiftType: Lambdas.NullableConfuser?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_NullableConfuser_create_optional_proxy(Lambdas_NullableConfuser_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func Lambdas_NullableConfuser_moveToCType(_ swiftType: Lambdas.NullableConfuser?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_NullableConfuser_create_optional_proxy(Lambdas_NullableConfuser_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_NullableConfuser_release_handle)
}
