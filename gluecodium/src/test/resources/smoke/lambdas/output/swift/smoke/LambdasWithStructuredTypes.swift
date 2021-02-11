//
//
import Foundation
public class LambdasWithStructuredTypes {
    public typealias ClassCallback = (LambdasInterface) -> Void
    public typealias StructCallback = (LambdasDeclarationOrder.SomeStruct) -> Void
    let c_instance : _baseRef
    init(cLambdasWithStructuredTypes: _baseRef) {
        guard cLambdasWithStructuredTypes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cLambdasWithStructuredTypes
    }
    deinit {
        smoke_LambdasWithStructuredTypes_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_LambdasWithStructuredTypes_release_handle(c_instance)
    }
    public func doClassStuff(callback: @escaping LambdasWithStructuredTypes.ClassCallback) -> Void {
        let c_callback = foobar_moveToCType(callback)
        return moveFromCType(smoke_LambdasWithStructuredTypes_doClassStuff(self.c_instance, c_callback.ref))
    }
    public func doStructStuff(callback: @escaping LambdasWithStructuredTypes.StructCallback) -> Void {
        let c_callback = foobar_moveToCType(callback)
        return moveFromCType(smoke_LambdasWithStructuredTypes_doStructStuff(self.c_instance, c_callback.ref))
    }
}
internal func getRef(_ ref: LambdasWithStructuredTypes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_LambdasWithStructuredTypes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_LambdasWithStructuredTypes_release_handle)
        : RefHolder(handle_copy)
}
extension LambdasWithStructuredTypes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension LambdasWithStructuredTypes: Hashable {
    // :nodoc:
    public static func == (lhs: LambdasWithStructuredTypes, rhs: LambdasWithStructuredTypes) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    // :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func foobar_LambdasWithStructuredTypes_copyFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes {
    if let swift_pointer = smoke_LambdasWithStructuredTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LambdasWithStructuredTypes {
        return re_constructed
    }
    let result = LambdasWithStructuredTypes(cLambdasWithStructuredTypes: smoke_LambdasWithStructuredTypes_copy_handle(handle))
    smoke_LambdasWithStructuredTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_LambdasWithStructuredTypes_moveFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes {
    if let swift_pointer = smoke_LambdasWithStructuredTypes_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LambdasWithStructuredTypes {
        smoke_LambdasWithStructuredTypes_release_handle(handle)
        return re_constructed
    }
    let result = LambdasWithStructuredTypes(cLambdasWithStructuredTypes: handle)
    smoke_LambdasWithStructuredTypes_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_LambdasWithStructuredTypes_copyFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes? {
    guard handle != 0 else {
        return nil
    }
    return foobar_LambdasWithStructuredTypes_moveFromCType(handle) as LambdasWithStructuredTypes
}
internal func foobar_LambdasWithStructuredTypes_moveFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes? {
    guard handle != 0 else {
        return nil
    }
    return foobar_LambdasWithStructuredTypes_moveFromCType(handle) as LambdasWithStructuredTypes
}
internal func foobar_copyToCType(_ swiftClass: LambdasWithStructuredTypes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: LambdasWithStructuredTypes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: LambdasWithStructuredTypes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: LambdasWithStructuredTypes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes.ClassCallback {
    return foobar_moveFromCType(smoke_LambdasWithStructuredTypes_ClassCallback_copy_handle(handle))
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes.ClassCallback {
    let refHolder = RefHolder(ref: handle, release: smoke_LambdasWithStructuredTypes_ClassCallback_release_handle)
    return { (p0: LambdasInterface) -> Void in
        let _p0 = foobar_moveToCType(p0)
        return moveFromCType(smoke_LambdasWithStructuredTypes_ClassCallback_call(refHolder.ref, _p0.ref))
    }
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes.ClassCallback? {
    guard handle != 0 else {
        return nil
    }
    return foobar_copyFromCType(handle) as LambdasWithStructuredTypes.ClassCallback
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes.ClassCallback? {
    guard handle != 0 else {
        return nil
    }
    return foobar_moveFromCType(handle) as LambdasWithStructuredTypes.ClassCallback
}
internal func createFunctionalTable(_ swiftType: @escaping LambdasWithStructuredTypes.ClassCallback) -> smoke_LambdasWithStructuredTypes_ClassCallback_FunctionTable {
    class smoke_LambdasWithStructuredTypes_ClassCallback_Holder {
        let closure: LambdasWithStructuredTypes.ClassCallback
        init(_ closure: @escaping LambdasWithStructuredTypes.ClassCallback) {
            self.closure = closure
        }
    }
    var functions = smoke_LambdasWithStructuredTypes_ClassCallback_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_LambdasWithStructuredTypes_ClassCallback_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_LambdasWithStructuredTypes_ClassCallback_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_LambdasWithStructuredTypes_ClassCallback_Holder
        return copyToCType(closure_holder.closure(foobar_LambdasInterface_moveFromCType(p0))).ref
    }
    return functions
}
internal func foobar_copyToCType(_ swiftType: @escaping LambdasWithStructuredTypes.ClassCallback) -> RefHolder {
    let handle = smoke_LambdasWithStructuredTypes_ClassCallback_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftType: @escaping LambdasWithStructuredTypes.ClassCallback) -> RefHolder {
    let handle = smoke_LambdasWithStructuredTypes_ClassCallback_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdasWithStructuredTypes_ClassCallback_release_handle)
}
internal func foobar_copyToCType(_ swiftType: LambdasWithStructuredTypes.ClassCallback?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_LambdasWithStructuredTypes_ClassCallback_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftType: LambdasWithStructuredTypes.ClassCallback?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_LambdasWithStructuredTypes_ClassCallback_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdasWithStructuredTypes_ClassCallback_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes.StructCallback {
    return foobar_moveFromCType(smoke_LambdasWithStructuredTypes_StructCallback_copy_handle(handle))
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes.StructCallback {
    let refHolder = RefHolder(ref: handle, release: smoke_LambdasWithStructuredTypes_StructCallback_release_handle)
    return { (p0: LambdasDeclarationOrder.SomeStruct) -> Void in
        let _p0 = foobar_moveToCType(p0)
        return moveFromCType(smoke_LambdasWithStructuredTypes_StructCallback_call(refHolder.ref, _p0.ref))
    }
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes.StructCallback? {
    guard handle != 0 else {
        return nil
    }
    return foobar_copyFromCType(handle) as LambdasWithStructuredTypes.StructCallback
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> LambdasWithStructuredTypes.StructCallback? {
    guard handle != 0 else {
        return nil
    }
    return foobar_moveFromCType(handle) as LambdasWithStructuredTypes.StructCallback
}
internal func createFunctionalTable(_ swiftType: @escaping LambdasWithStructuredTypes.StructCallback) -> smoke_LambdasWithStructuredTypes_StructCallback_FunctionTable {
    class smoke_LambdasWithStructuredTypes_StructCallback_Holder {
        let closure: LambdasWithStructuredTypes.StructCallback
        init(_ closure: @escaping LambdasWithStructuredTypes.StructCallback) {
            self.closure = closure
        }
    }
    var functions = smoke_LambdasWithStructuredTypes_StructCallback_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_LambdasWithStructuredTypes_StructCallback_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_LambdasWithStructuredTypes_StructCallback_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_LambdasWithStructuredTypes_StructCallback_Holder
        return copyToCType(closure_holder.closure(foobar_moveFromCType(p0))).ref
    }
    return functions
}
internal func foobar_copyToCType(_ swiftType: @escaping LambdasWithStructuredTypes.StructCallback) -> RefHolder {
    let handle = smoke_LambdasWithStructuredTypes_StructCallback_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftType: @escaping LambdasWithStructuredTypes.StructCallback) -> RefHolder {
    let handle = smoke_LambdasWithStructuredTypes_StructCallback_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdasWithStructuredTypes_StructCallback_release_handle)
}
internal func foobar_copyToCType(_ swiftType: LambdasWithStructuredTypes.StructCallback?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_LambdasWithStructuredTypes_StructCallback_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func foobar_moveToCType(_ swiftType: LambdasWithStructuredTypes.StructCallback?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_LambdasWithStructuredTypes_StructCallback_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdasWithStructuredTypes_StructCallback_release_handle)
}
