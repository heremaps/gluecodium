//
//
import Foundation
public class OuterClass {
    let c_instance : _baseRef
    init(cOuterClass: _baseRef) {
        guard cOuterClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cOuterClass
    }
    deinit {
        smoke_OuterClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_OuterClass_release_handle(c_instance)
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
            smoke_OuterClass_InnerClass_remove_swift_object_from_wrapper_cache(c_instance)
            smoke_OuterClass_InnerClass_release_handle(c_instance)
        }
        public func foo(input: String) -> String {
            let c_input = moveToCType(input)
            return moveFromCType(smoke_OuterClass_InnerClass_foo(self.c_instance, c_input.ref))
        }
    }
    public func foo(input: String) -> String {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_OuterClass_foo(self.c_instance, c_input.ref))
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
        smoke_OuterClass_InnerInterface_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_OuterClass_InnerInterface_release_handle(c_instance)
    }
    public func foo(input: String) -> String {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_OuterClass_InnerInterface_foo(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: OuterClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_OuterClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_OuterClass_release_handle)
        : RefHolder(handle_copy)
}
extension OuterClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension OuterClass: Hashable {
    public static func == (lhs: OuterClass, rhs: OuterClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func foobar_OuterClass_copyFromCType(_ handle: _baseRef) -> OuterClass {
    if let swift_pointer = smoke_OuterClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterClass {
        return re_constructed
    }
    let result = OuterClass(cOuterClass: smoke_OuterClass_copy_handle(handle))
    smoke_OuterClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_OuterClass_moveFromCType(_ handle: _baseRef) -> OuterClass {
    if let swift_pointer = smoke_OuterClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterClass {
        smoke_OuterClass_release_handle(handle)
        return re_constructed
    }
    let result = OuterClass(cOuterClass: handle)
    smoke_OuterClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_OuterClass_copyFromCType(_ handle: _baseRef) -> OuterClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_OuterClass_moveFromCType(handle) as OuterClass
}
internal func foobar_OuterClass_moveFromCType(_ handle: _baseRef) -> OuterClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_OuterClass_moveFromCType(handle) as OuterClass
}
internal func foobar_copyToCType(_ swiftClass: OuterClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: OuterClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: OuterClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: OuterClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: OuterClass.InnerClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_OuterClass_InnerClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_OuterClass_InnerClass_release_handle)
        : RefHolder(handle_copy)
}
extension OuterClass.InnerClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension OuterClass.InnerClass: Hashable {
    public static func == (lhs: OuterClass.InnerClass, rhs: OuterClass.InnerClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func foobar_OuterClass_InnerClass_copyFromCType(_ handle: _baseRef) -> OuterClass.InnerClass {
    if let swift_pointer = smoke_OuterClass_InnerClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterClass.InnerClass {
        return re_constructed
    }
    let result = OuterClass.InnerClass(cInnerClass: smoke_OuterClass_InnerClass_copy_handle(handle))
    smoke_OuterClass_InnerClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_OuterClass_InnerClass_moveFromCType(_ handle: _baseRef) -> OuterClass.InnerClass {
    if let swift_pointer = smoke_OuterClass_InnerClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? OuterClass.InnerClass {
        smoke_OuterClass_InnerClass_release_handle(handle)
        return re_constructed
    }
    let result = OuterClass.InnerClass(cInnerClass: handle)
    smoke_OuterClass_InnerClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_OuterClass_InnerClass_copyFromCType(_ handle: _baseRef) -> OuterClass.InnerClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_OuterClass_InnerClass_moveFromCType(handle) as OuterClass.InnerClass
}
internal func foobar_OuterClass_InnerClass_moveFromCType(_ handle: _baseRef) -> OuterClass.InnerClass? {
    guard handle != 0 else {
        return nil
    }
    return foobar_OuterClass_InnerClass_moveFromCType(handle) as OuterClass.InnerClass
}
internal func foobar_copyToCType(_ swiftClass: OuterClass.InnerClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: OuterClass.InnerClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: OuterClass.InnerClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: OuterClass.InnerClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
@_cdecl("_CBridgeInitsmoke_OuterClass_InnerInterface")
internal func _CBridgeInitsmoke_OuterClass_InnerInterface(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _InnerInterface(cInnerInterface: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: InnerInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_OuterClass_InnerInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_OuterClass_InnerInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = smoke_OuterClass_InnerInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_OuterClass_InnerInterface_foo = {(swift_class_pointer, input) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InnerInterface
        return copyToCType(swift_class.foo(input: moveFromCType(input))).ref
    }
    let proxy = smoke_OuterClass_InnerInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_OuterClass_InnerInterface_release_handle) : RefHolder(proxy)
}
extension _InnerInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func foobar_InnerInterface_copyFromCType(_ handle: _baseRef) -> InnerInterface {
    if let swift_pointer = smoke_OuterClass_InnerInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterClass_InnerInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        return re_constructed
    }
    if let swift_pointer = smoke_OuterClass_InnerInterface_get_typed(smoke_OuterClass_InnerInterface_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InnerInterface {
        smoke_OuterClass_InnerInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_InnerInterface_moveFromCType(_ handle: _baseRef) -> InnerInterface {
    if let swift_pointer = smoke_OuterClass_InnerInterface_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        smoke_OuterClass_InnerInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterClass_InnerInterface_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? InnerInterface {
        smoke_OuterClass_InnerInterface_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_OuterClass_InnerInterface_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InnerInterface {
        smoke_OuterClass_InnerInterface_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func foobar_InnerInterface_copyFromCType(_ handle: _baseRef) -> InnerInterface? {
    guard handle != 0 else {
        return nil
    }
    return foobar_InnerInterface_moveFromCType(handle) as InnerInterface
}
internal func foobar_InnerInterface_moveFromCType(_ handle: _baseRef) -> InnerInterface? {
    guard handle != 0 else {
        return nil
    }
    return foobar_InnerInterface_moveFromCType(handle) as InnerInterface
}
internal func foobar_copyToCType(_ swiftClass: InnerInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: InnerInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: InnerInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: InnerInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
