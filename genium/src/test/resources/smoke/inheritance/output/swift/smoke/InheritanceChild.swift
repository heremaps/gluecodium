//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: InheritanceChild?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_InheritanceChild_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_InheritanceChild_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_InheritanceChild_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_InheritanceRoot_rootMethod = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceChild
        swift_class.rootMethod()
    }
    functions.smoke_InheritanceChild_childMethod = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceChild
        swift_class.childMethod()
    }
    functions.smoke_InheritanceRoot_rootAttribute_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceChild
        return copyToCType(swift_class.rootAttribute).ref
    }
    functions.smoke_InheritanceRoot_rootAttribute_set = {(swift_class_pointer, newValue) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceChild
        swift_class.rootAttribute = moveFromCType(newValue)
    }
    let proxy = smoke_InheritanceChild_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_InheritanceChild_release_handle) : RefHolder(proxy)
}
public protocol InheritanceChild : InheritanceRoot {
    var rootAttribute: String { get set }
    func rootMethod() -> Void
    func childMethod() -> Void
}
internal class _InheritanceChild: InheritanceChild {
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
    init(cInheritanceChild: _baseRef) {
        guard cInheritanceChild != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInheritanceChild
    }
    deinit {
        smoke_InheritanceChild_release_handle(c_instance)
    }
    public func rootMethod() -> Void {
        return moveFromCType(smoke_InheritanceRoot_rootMethod(self.c_instance))
    }
    public func childMethod() -> Void {
        return moveFromCType(smoke_InheritanceChild_childMethod(self.c_instance))
    }
}
extension _InheritanceChild: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InheritanceChildcopyFromCType(_ handle: _baseRef) -> InheritanceChild {
    if let swift_pointer = smoke_InheritanceChild_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InheritanceChild {
        return re_constructed
    }
    return _InheritanceChild(cInheritanceChild: smoke_InheritanceChild_copy_handle(handle))
}
internal func InheritanceChildmoveFromCType(_ handle: _baseRef) -> InheritanceChild {
    if let swift_pointer = smoke_InheritanceChild_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InheritanceChild {
        smoke_InheritanceChild_release_handle(handle)
        return re_constructed
    }
    return _InheritanceChild(cInheritanceChild: handle)
}
internal func InheritanceChildcopyFromCType(_ handle: _baseRef) -> InheritanceChild? {
    guard handle != 0 else {
        return nil
    }
    return InheritanceChildmoveFromCType(handle) as InheritanceChild
}
internal func InheritanceChildmoveFromCType(_ handle: _baseRef) -> InheritanceChild? {
    guard handle != 0 else {
        return nil
    }
    return InheritanceChildmoveFromCType(handle) as InheritanceChild
}
internal func copyToCType(_ swiftClass: InheritanceChild) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InheritanceChild) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InheritanceChild?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InheritanceChild?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}