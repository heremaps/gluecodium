//
//
import Foundation
public protocol ParentInterface : AnyObject {
    var rootProperty: String { get set }
    func rootMethod() -> Void
}
internal class _ParentInterface: ParentInterface {
    var rootProperty: String {
        get {
            let c_result_handle = smoke_ParentInterface_rootProperty_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_ParentInterface_rootProperty_set(self.c_instance, c_value.ref)
        }
    }
    let c_instance : _baseRef
    init(cParentInterface: _baseRef) {
        guard cParentInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cParentInterface
    }
    deinit {
        smoke_ParentInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ParentInterface_release_handle(c_instance)
    }
    public func rootMethod() -> Void {
        smoke_ParentInterface_rootMethod(self.c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_ParentInterface")
internal func _CBridgeInitsmoke_ParentInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _ParentInterface(cParentInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ParentInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ParentInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ParentInterface_release_handle)
            : RefHolder(handle_copy)
    }
    if let descendantResult = tryDescendantGetRef(reference, owning) {
        return descendantResult
    }
    var functions = smoke_ParentInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_ParentInterface_rootMethod = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ParentInterface
        swift_class.rootMethod()
    }
    functions.smoke_ParentInterface_rootProperty_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ParentInterface
        return copyToCType(swift_class.rootProperty).ref
    }
    functions.smoke_ParentInterface_rootProperty_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ParentInterface
        swift_class.rootProperty = moveFromCType(value)
    }
    let proxy = smoke_ParentInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ParentInterface_release_handle) : RefHolder(proxy)
}
func tryDescendantGetRef(_ reference: ParentInterface, _ owning: Bool) -> RefHolder? {
    if reference is GrandChildInterface {
        return getRef(reference as? GrandChildInterface, owning: owning)
    }
    if reference is CrossPackageChildInterface {
        return getRef(reference as? CrossPackageChildInterface, owning: owning)
    }
    if reference is ChildInterface {
        return getRef(reference as? ChildInterface, owning: owning)
    }
    return nil
}
extension _ParentInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func ParentInterface_copyFromCType(_ handle: _baseRef) -> ParentInterface {
    if let swift_pointer = smoke_ParentInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ParentInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ParentInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ParentInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ParentInterface_get_typed(smoke_ParentInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ParentInterface {
        smoke_ParentInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ParentInterface_moveFromCType(_ handle: _baseRef) -> ParentInterface {
    if let swift_pointer = smoke_ParentInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ParentInterface {
        smoke_ParentInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ParentInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ParentInterface {
        smoke_ParentInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ParentInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ParentInterface {
        smoke_ParentInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ParentInterface_copyFromCType(_ handle: _baseRef) -> ParentInterface? {
    guard handle != 0 else {
        return nil
    }
    return ParentInterface_moveFromCType(handle) as ParentInterface
}
internal func ParentInterface_moveFromCType(_ handle: _baseRef) -> ParentInterface? {
    guard handle != 0 else {
        return nil
    }
    return ParentInterface_moveFromCType(handle) as ParentInterface
}
internal func copyToCType(_ swiftClass: ParentInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ParentInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ParentInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ParentInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
