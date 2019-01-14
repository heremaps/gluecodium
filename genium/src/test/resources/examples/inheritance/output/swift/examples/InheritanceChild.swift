//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: InheritanceChild?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = examples_InheritanceChild_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: examples_InheritanceChild_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = examples_InheritanceChild_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.examples_InheritanceParent_parentMethod = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceChild
        return swift_class.parentMethod(input: moveFromCType(input)).convertToCType()
    }
    functions.examples_InheritanceChild_childMethod = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InheritanceChild
        return swift_class.childMethod(input: moveFromCType(input))
    }
    let proxy = examples_InheritanceChild_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: examples_InheritanceChild_release_handle) : RefHolder(proxy)
}
public protocol InheritanceChild : InheritanceParent {
    func parentMethod(input: String) -> String
    func childMethod(input: UInt8) -> Int16
}
internal class _InheritanceChild: InheritanceChild {
    let c_instance : _baseRef
    init(cInheritanceChild: _baseRef) {
        guard cInheritanceChild != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInheritanceChild
    }
    deinit {
        examples_InheritanceChild_release_handle(c_instance)
    }
    public func parentMethod(input: String) -> String {
        return moveFromCType(examples_InheritanceParent_parentMethod(c_instance, input))
    }
    public func childMethod(input: UInt8) -> Int16 {
        return moveFromCType(examples_InheritanceChild_childMethod(c_instance, input))
    }
}
extension _InheritanceChild: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InheritanceChildcopyFromCType(_ handle: _baseRef) -> InheritanceChild {
    if let swift_pointer = examples_InheritanceChild_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InheritanceChild {
        examples_InheritanceChild_release_handle(handle)
        return re_constructed
    }
    return _InheritanceChild(cInheritanceChild: handle)
}
internal func InheritanceChildmoveFromCType(_ handle: _baseRef) -> InheritanceChild {
    return InheritanceChildcopyFromCType(handle)
}
internal func InheritanceChildcopyFromCType(_ handle: _baseRef) -> InheritanceChild? {
    guard handle != 0 else {
        return nil
    }
    return InheritanceChildmoveFromCType(handle) as InheritanceChild
}
internal func InheritanceChildmoveFromCType(_ handle: _baseRef) -> InheritanceChild? {
    return InheritanceChildcopyFromCType(handle)
}