//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: InheritanceRoot?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_InheritanceRoot_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_InheritanceRoot_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_InheritanceRoot_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_InheritanceRoot_rootMethod = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceRoot
        swift_class.rootMethod()
    }
    functions.smoke_InheritanceRoot_rootAttribute_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceRoot
        return copyToCType(swift_class.rootAttribute).ref
    }
    functions.smoke_InheritanceRoot_rootAttribute_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceRoot
        swift_class.rootAttribute = moveFromCType(newValue)
    }
    let proxy = smoke_InheritanceRoot_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_InheritanceRoot_release_handle) : RefHolder(proxy)
}
public protocol InheritanceRoot : AnyObject {
    var rootAttribute: String { get set }
    func rootMethod() -> Void
}
internal class _InheritanceRoot: InheritanceRoot {
    var rootAttribute: String {
        get {
            return moveFromCType(smoke_InheritanceRoot_rootAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_InheritanceRoot_rootAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cInheritanceRoot: _baseRef) {
        guard cInheritanceRoot != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInheritanceRoot
    }
    deinit {
        smoke_InheritanceRoot_release_handle(c_instance)
    }
    public func rootMethod() -> Void {
        return moveFromCType(smoke_InheritanceRoot_rootMethod(self.c_instance))
    }
}
extension _InheritanceRoot: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InheritanceRootcopyFromCType(_ handle: _baseRef) -> InheritanceRoot {
    if let swift_pointer = smoke_InheritanceRoot_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InheritanceRoot {
        return re_constructed
    }
    return _InheritanceRoot(cInheritanceRoot: smoke_InheritanceRoot_copy_handle(handle))
}
internal func InheritanceRootmoveFromCType(_ handle: _baseRef) -> InheritanceRoot {
    if let swift_pointer = smoke_InheritanceRoot_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InheritanceRoot {
        smoke_InheritanceRoot_release_handle(handle)
        return re_constructed
    }
    return _InheritanceRoot(cInheritanceRoot: handle)
}
internal func InheritanceRootcopyFromCType(_ handle: _baseRef) -> InheritanceRoot? {
    guard handle != 0 else {
        return nil
    }
    return InheritanceRootmoveFromCType(handle) as InheritanceRoot
}
internal func InheritanceRootmoveFromCType(_ handle: _baseRef) -> InheritanceRoot? {
    guard handle != 0 else {
        return nil
    }
    return InheritanceRootmoveFromCType(handle) as InheritanceRoot
}
internal func copyToCType(_ swiftClass: InheritanceRoot) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InheritanceRoot) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InheritanceRoot?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InheritanceRoot?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}