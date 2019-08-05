//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ChildInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_ChildInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_ChildInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_ChildInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_ParentInterface_rootMethod = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ChildInterface
        swift_class.rootMethod()
    }
    functions.smoke_ChildInterface_childMethod = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ChildInterface
        swift_class.childMethod()
    }
    functions.smoke_ParentInterface_rootAttribute_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ChildInterface
        return copyToCType(swift_class.rootAttribute).ref
    }
    functions.smoke_ParentInterface_rootAttribute_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ChildInterface
        swift_class.rootAttribute = moveFromCType(newValue)
    }
    let proxy = smoke_ChildInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ChildInterface_release_handle) : RefHolder(proxy)
}
public protocol ChildInterface : ParentInterface {
    var rootAttribute: String { get set }
    func rootMethod() -> Void
    func childMethod() -> Void
}
internal class _ChildInterface: ChildInterface {
    var rootAttribute: String {
        get {
            return moveFromCType(smoke_ParentInterface_rootAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_ParentInterface_rootAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cChildInterface: _baseRef) {
        guard cChildInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cChildInterface
    }
    deinit {
        smoke_ChildInterface_release_handle(c_instance)
    }
    public func rootMethod() -> Void {
        return moveFromCType(smoke_ParentInterface_rootMethod(self.c_instance))
    }
    public func childMethod() -> Void {
        return moveFromCType(smoke_ChildInterface_childMethod(self.c_instance))
    }
}
extension _ChildInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ChildInterfacecopyFromCType(_ handle: _baseRef) -> ChildInterface {
    if let swift_pointer = smoke_ChildInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildInterface {
        return re_constructed
    }
    return _ChildInterface(cChildInterface: smoke_ChildInterface_copy_handle(handle))
}
internal func ChildInterfacemoveFromCType(_ handle: _baseRef) -> ChildInterface {
    if let swift_pointer = smoke_ChildInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildInterface {
        smoke_ChildInterface_release_handle(handle)
        return re_constructed
    }
    return _ChildInterface(cChildInterface: handle)
}
internal func ChildInterfacecopyFromCType(_ handle: _baseRef) -> ChildInterface? {
    guard handle != 0 else {
        return nil
    }
    return ChildInterfacemoveFromCType(handle) as ChildInterface
}
internal func ChildInterfacemoveFromCType(_ handle: _baseRef) -> ChildInterface? {
    guard handle != 0 else {
        return nil
    }
    return ChildInterfacemoveFromCType(handle) as ChildInterface
}
internal func copyToCType(_ swiftClass: ChildInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ChildInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
