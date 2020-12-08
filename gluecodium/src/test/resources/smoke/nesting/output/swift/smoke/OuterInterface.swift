//
//
import Foundation
public protocol OuterInterface : AnyObject {
    func foo(input: String) -> String
}
internal class _OuterInterface: OuterInterface {
    let c_instance : _baseRef
    init(cOuterInterface: _baseRef) {
        guard cOuterInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cOuterInterface
    }
    deinit {
        smoke_OuterInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_OuterInterface_release_handle(c_instance)
    }
    public func foo(input: String) -> String {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_OuterInterface_foo(self.c_instance, c_input.ref))
    }
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
        smoke_OuterInterface_InnerClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_OuterInterface_InnerClass_release_handle(c_instance)
    }
    public func foo(input: String) -> String {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_OuterInterface_InnerClass_foo(self.c_instance, c_input.ref))
    }
}
public protocol InnerInterface : AnyObject {
    func foo(input: String) -> String
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
        smoke_OuterInterface_InnerInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_OuterInterface_InnerInterface_release_handle(c_instance)
    }
    public func foo(input: String) -> String {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_OuterInterface_InnerInterface_foo(self.c_instance, c_input.ref))
    }
}
@_cdecl("_CBridgeInitsmoke_OuterInterface")
internal func _CBridgeInitsmoke_OuterInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _OuterInterface(cOuterInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: OuterInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_OuterInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_OuterInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_OuterInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_OuterInterface_foo = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! OuterInterface
        return copyToCType(swift_class.foo(input: moveFromCType(input))).ref
    }
    let proxy = smoke_OuterInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_OuterInterface_release_handle) : RefHolder(proxy)
}
extension _OuterInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func OuterInterface_copyFromCType(_ handle: _baseRef) -> OuterInterface {
    if let swift_pointer = smoke_OuterInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterInterface_get_typed(smoke_OuterInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? OuterInterface {
        smoke_OuterInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func OuterInterface_moveFromCType(_ handle: _baseRef) -> OuterInterface {
    if let swift_pointer = smoke_OuterInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterInterface {
        smoke_OuterInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterInterface {
        smoke_OuterInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? OuterInterface {
        smoke_OuterInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func OuterInterface_copyFromCType(_ handle: _baseRef) -> OuterInterface? {
    guard handle != 0 else {
        return nil
    }
    return OuterInterface_moveFromCType(handle) as OuterInterface
}
internal func OuterInterface_moveFromCType(_ handle: _baseRef) -> OuterInterface? {
    guard handle != 0 else {
        return nil
    }
    return OuterInterface_moveFromCType(handle) as OuterInterface
}
internal func copyToCType(_ swiftClass: OuterInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: OuterInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: OuterInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: OuterInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: InnerClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_OuterInterface_InnerClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_OuterInterface_InnerClass_release_handle)
        : RefHolder(handle_copy)
}
extension InnerClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InnerClass_copyFromCType(_ handle: _baseRef) -> InnerClass {
    if let swift_pointer = smoke_OuterInterface_InnerClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerClass {
        return re_constructed
    }
    let result = InnerClass(cInnerClass: smoke_OuterInterface_InnerClass_copy_handle(handle))
    smoke_OuterInterface_InnerClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func InnerClass_moveFromCType(_ handle: _baseRef) -> InnerClass {
    if let swift_pointer = smoke_OuterInterface_InnerClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerClass {
        smoke_OuterInterface_InnerClass_release_handle(handle)
        return re_constructed
    }
    let result = InnerClass(cInnerClass: handle)
    smoke_OuterInterface_InnerClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func InnerClass_copyFromCType(_ handle: _baseRef) -> InnerClass? {
    guard handle != 0 else {
        return nil
    }
    return InnerClass_moveFromCType(handle) as InnerClass
}
internal func InnerClass_moveFromCType(_ handle: _baseRef) -> InnerClass? {
    guard handle != 0 else {
        return nil
    }
    return InnerClass_moveFromCType(handle) as InnerClass
}
internal func copyToCType(_ swiftClass: InnerClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InnerClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InnerClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InnerClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
@_cdecl("_CBridgeInitsmoke_OuterInterface_InnerInterface")
internal func _CBridgeInitsmoke_OuterInterface_InnerInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _InnerInterface(cInnerInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: InnerInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_OuterInterface_InnerInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_OuterInterface_InnerInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_OuterInterface_InnerInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_OuterInterface_InnerInterface_foo = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InnerInterface
        return copyToCType(swift_class.foo(input: moveFromCType(input))).ref
    }
    let proxy = smoke_OuterInterface_InnerInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_OuterInterface_InnerInterface_release_handle) : RefHolder(proxy)
}
extension _InnerInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InnerInterface_copyFromCType(_ handle: _baseRef) -> InnerInterface {
    if let swift_pointer = smoke_OuterInterface_InnerInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterInterface_InnerInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterInterface_InnerInterface_get_typed(smoke_OuterInterface_InnerInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InnerInterface {
        smoke_OuterInterface_InnerInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InnerInterface_moveFromCType(_ handle: _baseRef) -> InnerInterface {
    if let swift_pointer = smoke_OuterInterface_InnerInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        smoke_OuterInterface_InnerInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterInterface_InnerInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        smoke_OuterInterface_InnerInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterInterface_InnerInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InnerInterface {
        smoke_OuterInterface_InnerInterface_cache_swift_object_wrapper(handle, swift_pointer)
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
