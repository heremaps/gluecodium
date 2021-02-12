//
//
import Foundation
@OnInterface
public protocol AttributesInterface : AnyObject {
    @OnPropertyInInterface
    var prop: String { get set }
    @OnFunctionInInterface
    func veryFun(@OnParameterInInterface param: String) -> Void
}
internal class _AttributesInterface: AttributesInterface {
    @OnConstInInterface
    public static let pi: Bool = false
    @OnPropertyInInterface
    var prop: String {
        get {
            return moveFromCType(smoke_AttributesInterface_prop_get(self.c_instance))
        }
        set {
            let c_value = moveToCType(newValue)
            return moveFromCType(smoke_AttributesInterface_prop_set(self.c_instance, c_value.ref))
        }
    }
    let c_instance : _baseRef
    init(cAttributesInterface: _baseRef) {
        guard cAttributesInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cAttributesInterface
    }
    deinit {
        smoke_AttributesInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_AttributesInterface_release_handle(c_instance)
    }
    @OnFunctionInInterface
    public func veryFun(@OnParameterInInterface param: String) -> Void {
        let c_param = moveToCType(param)
        return moveFromCType(smoke_AttributesInterface_veryFun(self.c_instance, c_param.ref))
    }
}
@_cdecl("_CBridgeInitsmoke_AttributesInterface")
internal func _CBridgeInitsmoke_AttributesInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _AttributesInterface(cAttributesInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: AttributesInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_AttributesInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_AttributesInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_AttributesInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_AttributesInterface_veryFun = {(swift_class_pointer, param) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! AttributesInterface
        swift_class.veryFun(param: moveFromCType(param))
    }
    functions.smoke_AttributesInterface_prop_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! AttributesInterface
        return copyToCType(swift_class.prop).ref
    }
    functions.smoke_AttributesInterface_prop_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! AttributesInterface
        swift_class.prop = moveFromCType(value)
    }
    let proxy = smoke_AttributesInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_AttributesInterface_release_handle) : RefHolder(proxy)
}
extension _AttributesInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func AttributesInterface_copyFromCType(_ handle: _baseRef) -> AttributesInterface {
    if let swift_pointer = smoke_AttributesInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_AttributesInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_AttributesInterface_get_typed(smoke_AttributesInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? AttributesInterface {
        smoke_AttributesInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func AttributesInterface_moveFromCType(_ handle: _baseRef) -> AttributesInterface {
    if let swift_pointer = smoke_AttributesInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesInterface {
        smoke_AttributesInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_AttributesInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesInterface {
        smoke_AttributesInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_AttributesInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? AttributesInterface {
        smoke_AttributesInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func AttributesInterface_copyFromCType(_ handle: _baseRef) -> AttributesInterface? {
    guard handle != 0 else {
        return nil
    }
    return AttributesInterface_moveFromCType(handle) as AttributesInterface
}
internal func AttributesInterface_moveFromCType(_ handle: _baseRef) -> AttributesInterface? {
    guard handle != 0 else {
        return nil
    }
    return AttributesInterface_moveFromCType(handle) as AttributesInterface
}
internal func copyToCType(_ swiftClass: AttributesInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: AttributesInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: AttributesInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: AttributesInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
