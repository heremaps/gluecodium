//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: InheritanceParent?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = examples_InheritanceParent_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: examples_InheritanceParent_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = examples_InheritanceParent_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.examples_InheritanceParent_parentMethod = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceParent
        return swift_class.parentMethod(input: moveFromCType(input)).convertToCType()
    }
    let proxy = examples_InheritanceParent_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: examples_InheritanceParent_release_handle) : RefHolder(proxy)
}
public protocol InheritanceParent : AnyObject {
    func parentMethod(input: String) -> String
}
internal class _InheritanceParent: InheritanceParent {
    let c_instance : _baseRef
    init(cInheritanceParent: _baseRef) {
        guard cInheritanceParent != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInheritanceParent
    }
    deinit {
        examples_InheritanceParent_release_handle(c_instance)
    }
    public func parentMethod(input: String) -> String {
        return moveFromCType(examples_InheritanceParent_parentMethod(c_instance, input))
    }
}
extension _InheritanceParent: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InheritanceParentcopyFromCType(_ handle: _baseRef) -> InheritanceParent {
    if let swift_pointer = examples_InheritanceParent_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InheritanceParent {
        examples_InheritanceParent_release_handle(handle)
        return re_constructed
    }
    return _InheritanceParent(cInheritanceParent: handle)
}
internal func InheritanceParentmoveFromCType(_ handle: _baseRef) -> InheritanceParent {
    return InheritanceParentcopyFromCType(handle)
}
internal func InheritanceParentcopyFromCType(_ handle: _baseRef) -> InheritanceParent? {
    guard handle != 0 else {
        return nil
    }
    return InheritanceParentmoveFromCType(handle) as InheritanceParent
}
internal func InheritanceParentmoveFromCType(_ handle: _baseRef) -> InheritanceParent? {
    return InheritanceParentcopyFromCType(handle)
}