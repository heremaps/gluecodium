//
//
import Foundation
public class Lambdas {
    public typealias Producer = () -> String
    /// Should confuse everyone thoroughly
    public typealias Confuser = (String) -> Lambdas.Producer
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
        smoke_Lambdas_release_handle(c_instance)
    }
    public func deconfuse(value: String, confuser: @escaping Lambdas.Confuser) -> Lambdas.Producer {
        let c_value = moveToCType(value)
        let c_confuser = moveToCType(confuser)
        return moveFromCType(smoke_Lambdas_deconfuse(self.c_instance, c_value.ref, c_confuser.ref))
    }
    public static func fuse(items: [String], callback: @escaping Lambdas.Indexer) -> [Int32: String] {
        let c_items = moveToCType(items)
        let c_callback = moveToCType(callback)
        return moveFromCType(smoke_Lambdas_fuse(c_items.ref, c_callback.ref))
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
    var c_handle: _baseRef { return c_instance }
}
internal func Lambdas_copyFromCType(_ handle: _baseRef) -> Lambdas {
    return Lambdas(cLambdas: smoke_Lambdas_copy_handle(handle))
}
internal func Lambdas_moveFromCType(_ handle: _baseRef) -> Lambdas {
    return Lambdas(cLambdas: handle)
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
internal func copyFromCType(_ handle: _baseRef) -> Lambdas.Producer {
    return moveFromCType(smoke_Lambdas_Producer_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> Lambdas.Producer {
    let refHolder = RefHolder(ref: handle, release: smoke_Lambdas_Producer_release_handle)
    return { () -> String in
        return moveFromCType(smoke_Lambdas_Producer_call(refHolder.ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Lambdas.Producer? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as Lambdas.Producer
}
internal func moveFromCType(_ handle: _baseRef) -> Lambdas.Producer? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as Lambdas.Producer
}
internal func createFunctionalTable(_ swiftType: @escaping Lambdas.Producer) -> smoke_Lambdas_Producer_FunctionTable {
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
internal func copyToCType(_ swiftType: @escaping Lambdas.Producer) -> RefHolder {
    let handle = smoke_Lambdas_Producer_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping Lambdas.Producer) -> RefHolder {
    let handle = smoke_Lambdas_Producer_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Producer_release_handle)
}
internal func copyToCType(_ swiftType: Lambdas.Producer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Producer_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: Lambdas.Producer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Producer_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Producer_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Lambdas.Confuser {
    return moveFromCType(smoke_Lambdas_Confuser_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> Lambdas.Confuser {
    let refHolder = RefHolder(ref: handle, release: smoke_Lambdas_Confuser_release_handle)
    return { (p0: String) -> Lambdas.Producer in
        return moveFromCType(smoke_Lambdas_Confuser_call(refHolder.ref, moveToCType(p0).ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Lambdas.Confuser? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as Lambdas.Confuser
}
internal func moveFromCType(_ handle: _baseRef) -> Lambdas.Confuser? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as Lambdas.Confuser
}
internal func createFunctionalTable(_ swiftType: @escaping Lambdas.Confuser) -> smoke_Lambdas_Confuser_FunctionTable {
    class smoke_Lambdas_Confuser_Holder {
        let closure: Lambdas.Confuser
        init(_ closure: @escaping Lambdas.Confuser) {
            self.closure = closure
        }
    }
    var functions = smoke_Lambdas_Confuser_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_Lambdas_Confuser_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_Lambdas_Confuser_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_Lambdas_Confuser_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0))).ref
    }
    return functions
}
internal func copyToCType(_ swiftType: @escaping Lambdas.Confuser) -> RefHolder {
    let handle = smoke_Lambdas_Confuser_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping Lambdas.Confuser) -> RefHolder {
    let handle = smoke_Lambdas_Confuser_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Confuser_release_handle)
}
internal func copyToCType(_ swiftType: Lambdas.Confuser?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Confuser_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: Lambdas.Confuser?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Confuser_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Confuser_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Lambdas.Consumer {
    return moveFromCType(smoke_Lambdas_Consumer_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> Lambdas.Consumer {
    let refHolder = RefHolder(ref: handle, release: smoke_Lambdas_Consumer_release_handle)
    return { (p0: String) -> Void in
        return moveFromCType(smoke_Lambdas_Consumer_call(refHolder.ref, moveToCType(p0).ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Lambdas.Consumer? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as Lambdas.Consumer
}
internal func moveFromCType(_ handle: _baseRef) -> Lambdas.Consumer? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as Lambdas.Consumer
}
internal func createFunctionalTable(_ swiftType: @escaping Lambdas.Consumer) -> smoke_Lambdas_Consumer_FunctionTable {
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
internal func copyToCType(_ swiftType: @escaping Lambdas.Consumer) -> RefHolder {
    let handle = smoke_Lambdas_Consumer_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping Lambdas.Consumer) -> RefHolder {
    let handle = smoke_Lambdas_Consumer_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Consumer_release_handle)
}
internal func copyToCType(_ swiftType: Lambdas.Consumer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Consumer_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: Lambdas.Consumer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Consumer_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Consumer_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Lambdas.Indexer {
    return moveFromCType(smoke_Lambdas_Indexer_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> Lambdas.Indexer {
    let refHolder = RefHolder(ref: handle, release: smoke_Lambdas_Indexer_release_handle)
    return { (p0: String, p1: Float) -> Int32 in
        return moveFromCType(smoke_Lambdas_Indexer_call(refHolder.ref, moveToCType(p0).ref, moveToCType(p1).ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Lambdas.Indexer? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as Lambdas.Indexer
}
internal func moveFromCType(_ handle: _baseRef) -> Lambdas.Indexer? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as Lambdas.Indexer
}
internal func createFunctionalTable(_ swiftType: @escaping Lambdas.Indexer) -> smoke_Lambdas_Indexer_FunctionTable {
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
internal func copyToCType(_ swiftType: @escaping Lambdas.Indexer) -> RefHolder {
    let handle = smoke_Lambdas_Indexer_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping Lambdas.Indexer) -> RefHolder {
    let handle = smoke_Lambdas_Indexer_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Indexer_release_handle)
}
internal func copyToCType(_ swiftType: Lambdas.Indexer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Indexer_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: Lambdas.Indexer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_Indexer_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_Indexer_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Lambdas.NullableConfuser {
    return moveFromCType(smoke_Lambdas_NullableConfuser_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> Lambdas.NullableConfuser {
    let refHolder = RefHolder(ref: handle, release: smoke_Lambdas_NullableConfuser_release_handle)
    return { (p0: String?) -> Lambdas.Producer? in
        return moveFromCType(smoke_Lambdas_NullableConfuser_call(refHolder.ref, moveToCType(p0).ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Lambdas.NullableConfuser? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as Lambdas.NullableConfuser
}
internal func moveFromCType(_ handle: _baseRef) -> Lambdas.NullableConfuser? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as Lambdas.NullableConfuser
}
internal func createFunctionalTable(_ swiftType: @escaping Lambdas.NullableConfuser) -> smoke_Lambdas_NullableConfuser_FunctionTable {
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
        return copyToCType(closure_holder.closure(moveFromCType(p0))).ref
    }
    return functions
}
internal func copyToCType(_ swiftType: @escaping Lambdas.NullableConfuser) -> RefHolder {
    let handle = smoke_Lambdas_NullableConfuser_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping Lambdas.NullableConfuser) -> RefHolder {
    let handle = smoke_Lambdas_NullableConfuser_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_NullableConfuser_release_handle)
}
internal func copyToCType(_ swiftType: Lambdas.NullableConfuser?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_NullableConfuser_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: Lambdas.NullableConfuser?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_Lambdas_NullableConfuser_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_Lambdas_NullableConfuser_release_handle)
}
