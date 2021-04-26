//
//
import Foundation
public class OuterClassWithInheritance: ParentClass {
    init(cOuterClassWithInheritance: _baseRef) {
        super.init(cParentClass: cOuterClassWithInheritance)
    }
    public class InnerClass {
        let c_instance : _baseRef
        init(cInnerClass: _baseRef) {
            guard cInnerClass != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            c_instance = cInnerClass
        }
        deinit {
            smoke_OuterClassWithInheritance_InnerClass_remove_swift_object_from_wrapper_cache(c_instance)
            smoke_OuterClassWithInheritance_InnerClass_release_handle(c_instance)
        }
        public func bar(input: String) -> String {
            let c_input = moveToCType(input)
            let c_result_handle = smoke_OuterClassWithInheritance_InnerClass_bar(self.c_instance, c_input.ref)
            return moveFromCType(c_result_handle)
        }
    }
    public func foo(input: String) -> String {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_OuterClassWithInheritance_foo(self.c_instance, c_input.ref)
        return moveFromCType(c_result_handle)
    }
}
public protocol InnerInterface : AnyObject {
    func baz(input: String) -> String
}
internal class _InnerInterface: InnerInterface {
    let c_instance : _baseRef
    init(cInnerInterface: _baseRef) {
        guard cInnerInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInnerInterface
    }
    deinit {
        smoke_OuterClassWithInheritance_InnerInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_OuterClassWithInheritance_InnerInterface_release_handle(c_instance)
    }
    public func baz(input: String) -> String {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_OuterClassWithInheritance_InnerInterface_baz(self.c_instance, c_input.ref)
        return moveFromCType(c_result_handle)
    }
}
@_cdecl("_CBridgeInitsmoke_OuterClassWithInheritance")
internal func _CBridgeInitsmoke_OuterClassWithInheritance(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = OuterClassWithInheritance(cOuterClassWithInheritance: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: OuterClassWithInheritance?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_OuterClassWithInheritance_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_OuterClassWithInheritance_release_handle)
        : RefHolder(handle_copy)
}
internal func OuterClassWithInheritance_copyFromCType(_ handle: _baseRef) -> OuterClassWithInheritance {
    if let swift_pointer = smoke_OuterClassWithInheritance_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterClassWithInheritance {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterClassWithInheritance_get_typed(smoke_OuterClassWithInheritance_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? OuterClassWithInheritance {
        smoke_OuterClassWithInheritance_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func OuterClassWithInheritance_moveFromCType(_ handle: _baseRef) -> OuterClassWithInheritance {
    if let swift_pointer = smoke_OuterClassWithInheritance_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterClassWithInheritance {
        smoke_OuterClassWithInheritance_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterClassWithInheritance_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? OuterClassWithInheritance {
        smoke_OuterClassWithInheritance_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func OuterClassWithInheritance_copyFromCType(_ handle: _baseRef) -> OuterClassWithInheritance? {
    guard handle != 0 else {
        return nil
    }
    return OuterClassWithInheritance_moveFromCType(handle) as OuterClassWithInheritance
}
internal func OuterClassWithInheritance_moveFromCType(_ handle: _baseRef) -> OuterClassWithInheritance? {
    guard handle != 0 else {
        return nil
    }
    return OuterClassWithInheritance_moveFromCType(handle) as OuterClassWithInheritance
}
internal func copyToCType(_ swiftClass: OuterClassWithInheritance) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: OuterClassWithInheritance) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: OuterClassWithInheritance?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: OuterClassWithInheritance?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: OuterClassWithInheritance.InnerClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_OuterClassWithInheritance_InnerClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_OuterClassWithInheritance_InnerClass_release_handle)
        : RefHolder(handle_copy)
}
extension OuterClassWithInheritance.InnerClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension OuterClassWithInheritance.InnerClass: Hashable {
    /// :nodoc:
    public static func == (lhs: OuterClassWithInheritance.InnerClass, rhs: OuterClassWithInheritance.InnerClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func OuterClassWithInheritance_InnerClass_copyFromCType(_ handle: _baseRef) -> OuterClassWithInheritance.InnerClass {
    if let swift_pointer = smoke_OuterClassWithInheritance_InnerClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterClassWithInheritance.InnerClass {
        return re_constructed
    }
    let result = OuterClassWithInheritance.InnerClass(cInnerClass: smoke_OuterClassWithInheritance_InnerClass_copy_handle(handle))
    smoke_OuterClassWithInheritance_InnerClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func OuterClassWithInheritance_InnerClass_moveFromCType(_ handle: _baseRef) -> OuterClassWithInheritance.InnerClass {
    if let swift_pointer = smoke_OuterClassWithInheritance_InnerClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterClassWithInheritance.InnerClass {
        smoke_OuterClassWithInheritance_InnerClass_release_handle(handle)
        return re_constructed
    }
    let result = OuterClassWithInheritance.InnerClass(cInnerClass: handle)
    smoke_OuterClassWithInheritance_InnerClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func OuterClassWithInheritance_InnerClass_copyFromCType(_ handle: _baseRef) -> OuterClassWithInheritance.InnerClass? {
    guard handle != 0 else {
        return nil
    }
    return OuterClassWithInheritance_InnerClass_moveFromCType(handle) as OuterClassWithInheritance.InnerClass
}
internal func OuterClassWithInheritance_InnerClass_moveFromCType(_ handle: _baseRef) -> OuterClassWithInheritance.InnerClass? {
    guard handle != 0 else {
        return nil
    }
    return OuterClassWithInheritance_InnerClass_moveFromCType(handle) as OuterClassWithInheritance.InnerClass
}
internal func copyToCType(_ swiftClass: OuterClassWithInheritance.InnerClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: OuterClassWithInheritance.InnerClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: OuterClassWithInheritance.InnerClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: OuterClassWithInheritance.InnerClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
@_cdecl("_CBridgeInitsmoke_OuterClassWithInheritance_InnerInterface")
internal func _CBridgeInitsmoke_OuterClassWithInheritance_InnerInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _InnerInterface(cInnerInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: InnerInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_OuterClassWithInheritance_InnerInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_OuterClassWithInheritance_InnerInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_OuterClassWithInheritance_InnerInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_OuterClassWithInheritance_InnerInterface_baz = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InnerInterface
        return copyToCType(swift_class.baz(input: moveFromCType(input))).ref
    }
    let proxy = smoke_OuterClassWithInheritance_InnerInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_OuterClassWithInheritance_InnerInterface_release_handle) : RefHolder(proxy)
}
extension _InnerInterface: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func InnerInterface_copyFromCType(_ handle: _baseRef) -> InnerInterface {
    if let swift_pointer = smoke_OuterClassWithInheritance_InnerInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterClassWithInheritance_InnerInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterClassWithInheritance_InnerInterface_get_typed(smoke_OuterClassWithInheritance_InnerInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InnerInterface {
        smoke_OuterClassWithInheritance_InnerInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InnerInterface_moveFromCType(_ handle: _baseRef) -> InnerInterface {
    if let swift_pointer = smoke_OuterClassWithInheritance_InnerInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        smoke_OuterClassWithInheritance_InnerInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterClassWithInheritance_InnerInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        smoke_OuterClassWithInheritance_InnerInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterClassWithInheritance_InnerInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InnerInterface {
        smoke_OuterClassWithInheritance_InnerInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InnerInterface_copyFromCType(_ handle: _baseRef) -> InnerInterface? {
    guard handle != 0 else {
        return nil
    }
    return InnerInterface_moveFromCType(handle) as InnerInterface
}
internal func InnerInterface_moveFromCType(_ handle: _baseRef) -> InnerInterface? {
    guard handle != 0 else {
        return nil
    }
    return InnerInterface_moveFromCType(handle) as InnerInterface
}
internal func copyToCType(_ swiftClass: InnerInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InnerInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InnerInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InnerInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
