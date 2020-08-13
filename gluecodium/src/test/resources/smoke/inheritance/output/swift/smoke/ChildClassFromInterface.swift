//
//
import Foundation
public class ChildClassFromInterface: ParentInterface {
    public var rootProperty: String {
        get {
            return moveFromCType(smoke_ParentInterface_rootProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_ParentInterface_rootProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cChildClassFromInterface: _baseRef) {
        guard cChildClassFromInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cChildClassFromInterface
    }
    deinit {
        smoke_ChildClassFromInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ChildClassFromInterface_release_handle(c_instance)
    }
    public func rootMethod() -> Void {
        return moveFromCType(smoke_ParentInterface_rootMethod(self.c_instance))
    }
    public func childClassMethod() -> Void {
        return moveFromCType(smoke_ChildClassFromInterface_childClassMethod(self.c_instance))
    }
}
@_cdecl("_CBridgeInitsmoke_ChildClassFromInterface")
internal func _CBridgeInitsmoke_ChildClassFromInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = ChildClassFromInterface(cChildClassFromInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ChildClassFromInterface?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ChildClassFromInterface_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ChildClassFromInterface_release_handle)
        : RefHolder(handle_copy)
}
extension ChildClassFromInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ChildClassFromInterface_copyFromCType(_ handle: _baseRef) -> ChildClassFromInterface {
    if let swift_pointer = smoke_ChildClassFromInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildClassFromInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_ChildClassFromInterface_get_typed(smoke_ChildClassFromInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildClassFromInterface {
        smoke_ChildClassFromInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ChildClassFromInterface_moveFromCType(_ handle: _baseRef) -> ChildClassFromInterface {
    if let swift_pointer = smoke_ChildClassFromInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildClassFromInterface {
        smoke_ChildClassFromInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ChildClassFromInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildClassFromInterface {
        smoke_ChildClassFromInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ChildClassFromInterface_copyFromCType(_ handle: _baseRef) -> ChildClassFromInterface? {
    guard handle != 0 else {
        return nil
    }
    return ChildClassFromInterface_moveFromCType(handle) as ChildClassFromInterface
}
internal func ChildClassFromInterface_moveFromCType(_ handle: _baseRef) -> ChildClassFromInterface? {
    guard handle != 0 else {
        return nil
    }
    return ChildClassFromInterface_moveFromCType(handle) as ChildClassFromInterface
}
internal func copyToCType(_ swiftClass: ChildClassFromInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildClassFromInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ChildClassFromInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildClassFromInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
