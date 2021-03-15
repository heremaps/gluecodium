//
//
import Foundation
public protocol LambdasInterface : AnyObject {
    typealias TakeScreenshotCallback = (Data?) -> Void
    func takeScreenshot(callback: @escaping LambdasInterface.TakeScreenshotCallback) -> Void
}
internal class _LambdasInterface: LambdasInterface {
    let c_instance : _baseRef
    init(cLambdasInterface: _baseRef) {
        guard cLambdasInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cLambdasInterface
    }
    deinit {
        smoke_LambdasInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_LambdasInterface_release_handle(c_instance)
    }
    public func takeScreenshot(callback: @escaping LambdasInterface.TakeScreenshotCallback) -> Void {
        let c_callback = moveToCType(callback)
        return moveFromCType(smoke_LambdasInterface_takeScreenshot(self.c_instance, c_callback.ref))
    }
}
@_cdecl("_CBridgeInitsmoke_LambdasInterface")
internal func _CBridgeInitsmoke_LambdasInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _LambdasInterface(cLambdasInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: LambdasInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_LambdasInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_LambdasInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_LambdasInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_LambdasInterface_takeScreenshot = {(swift_class_pointer, callback) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! LambdasInterface
        swift_class.takeScreenshot(callback: moveFromCType(callback))
    }
    let proxy = smoke_LambdasInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_LambdasInterface_release_handle) : RefHolder(proxy)
}
extension _LambdasInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func LambdasInterface_copyFromCType(_ handle: _baseRef) -> LambdasInterface {
    if let swift_pointer = smoke_LambdasInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LambdasInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_LambdasInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LambdasInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_LambdasInterface_get_typed(smoke_LambdasInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? LambdasInterface {
        smoke_LambdasInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func LambdasInterface_moveFromCType(_ handle: _baseRef) -> LambdasInterface {
    if let swift_pointer = smoke_LambdasInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LambdasInterface {
        smoke_LambdasInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_LambdasInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LambdasInterface {
        smoke_LambdasInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_LambdasInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? LambdasInterface {
        smoke_LambdasInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func LambdasInterface_copyFromCType(_ handle: _baseRef) -> LambdasInterface? {
    guard handle != 0 else {
        return nil
    }
    return LambdasInterface_moveFromCType(handle) as LambdasInterface
}
internal func LambdasInterface_moveFromCType(_ handle: _baseRef) -> LambdasInterface? {
    guard handle != 0 else {
        return nil
    }
    return LambdasInterface_moveFromCType(handle) as LambdasInterface
}
internal func copyToCType(_ swiftClass: LambdasInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: LambdasInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: LambdasInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: LambdasInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> LambdasInterface.TakeScreenshotCallback {
    return moveFromCType(smoke_LambdasInterface_TakeScreenshotCallback_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> LambdasInterface.TakeScreenshotCallback {
    let refHolder = RefHolder(ref: handle, release: smoke_LambdasInterface_TakeScreenshotCallback_release_handle)
    return { (p0: Data?) -> Void in
        let _p0 = moveToCType(p0)
        return moveFromCType(smoke_LambdasInterface_TakeScreenshotCallback_call(refHolder.ref, _p0.ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> LambdasInterface.TakeScreenshotCallback? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as LambdasInterface.TakeScreenshotCallback
}
internal func moveFromCType(_ handle: _baseRef) -> LambdasInterface.TakeScreenshotCallback? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as LambdasInterface.TakeScreenshotCallback
}
internal func createFunctionalTable(_ swiftType: @escaping LambdasInterface.TakeScreenshotCallback) -> smoke_LambdasInterface_TakeScreenshotCallback_FunctionTable {
    class smoke_LambdasInterface_TakeScreenshotCallback_Holder {
        let closure: LambdasInterface.TakeScreenshotCallback
        init(_ closure: @escaping LambdasInterface.TakeScreenshotCallback) {
            self.closure = closure
        }
    }
    var functions = smoke_LambdasInterface_TakeScreenshotCallback_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_LambdasInterface_TakeScreenshotCallback_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_LambdasInterface_TakeScreenshotCallback_call = { swift_closure_pointer, p0 in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_LambdasInterface_TakeScreenshotCallback_Holder
        return copyToCType(closure_holder.closure(moveFromCType(p0))).ref
    }
    return functions
}
internal func copyToCType(_ swiftType: @escaping LambdasInterface.TakeScreenshotCallback) -> RefHolder {
    let handle = smoke_LambdasInterface_TakeScreenshotCallback_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping LambdasInterface.TakeScreenshotCallback) -> RefHolder {
    let handle = smoke_LambdasInterface_TakeScreenshotCallback_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdasInterface_TakeScreenshotCallback_release_handle)
}
internal func copyToCType(_ swiftType: LambdasInterface.TakeScreenshotCallback?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_LambdasInterface_TakeScreenshotCallback_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: LambdasInterface.TakeScreenshotCallback?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_LambdasInterface_TakeScreenshotCallback_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_LambdasInterface_TakeScreenshotCallback_release_handle)
}
