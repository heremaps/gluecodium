//
//
import Foundation
public class ChildClassFromInterfaceOverloads: ParentInterface {
    let c_instance : _baseRef
    init(cChildClassFromInterfaceOverloads: _baseRef) {
        guard cChildClassFromInterfaceOverloads != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cChildClassFromInterfaceOverloads
    }
    deinit {
        smoke_ChildClassFromInterfaceOverloads_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ChildClassFromInterfaceOverloads_release_handle(c_instance)
    }
    public func foo() -> Void {
        smoke_ChildClassFromInterfaceOverloads_foo_(self.c_instance)
    }
    public func foo(input: Int32) -> Void {
        let c_input = moveToCType(input)
        smoke_ChildClassFromInterfaceOverloads_foo_Int(self.c_instance, c_input.ref)
    }
    public func bar() -> Void {
        smoke_ChildClassFromInterfaceOverloads_bar(self.c_instance)
    }
    public func baz() -> Void {
        smoke_ChildClassFromInterfaceOverloads_baz(self.c_instance)
    }
    public func foo(input: String) -> Void {
        let c_input = moveToCType(input)
        smoke_ChildClassFromInterfaceOverloads_foo_String(self.c_instance, c_input.ref)
    }
    public func bar(input: String) -> Void {
        let c_input = moveToCType(input)
        smoke_ChildClassFromInterfaceOverloads_bar_String(self.c_instance, c_input.ref)
    }
}
@_cdecl("_CBridgeInitsmoke_ChildClassFromInterfaceOverloads")
internal func _CBridgeInitsmoke_ChildClassFromInterfaceOverloads(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = ChildClassFromInterfaceOverloads(cChildClassFromInterfaceOverloads: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ChildClassFromInterfaceOverloads?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ChildClassFromInterfaceOverloads_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ChildClassFromInterfaceOverloads_release_handle)
        : RefHolder(handle_copy)
}
extension ChildClassFromInterfaceOverloads: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension ChildClassFromInterfaceOverloads: Hashable {
    /// :nodoc:
    public static func == (lhs: ChildClassFromInterfaceOverloads, rhs: ChildClassFromInterfaceOverloads) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func ChildClassFromInterfaceOverloads_copyFromCType(_ handle: _baseRef) -> ChildClassFromInterfaceOverloads {
    if let swift_pointer = smoke_ChildClassFromInterfaceOverloads_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildClassFromInterfaceOverloads {
        return re_constructed
    }
    if let swift_pointer = smoke_ChildClassFromInterfaceOverloads_get_typed(smoke_ChildClassFromInterfaceOverloads_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildClassFromInterfaceOverloads {
        smoke_ChildClassFromInterfaceOverloads_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ChildClassFromInterfaceOverloads_moveFromCType(_ handle: _baseRef) -> ChildClassFromInterfaceOverloads {
    if let swift_pointer = smoke_ChildClassFromInterfaceOverloads_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ChildClassFromInterfaceOverloads {
        smoke_ChildClassFromInterfaceOverloads_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ChildClassFromInterfaceOverloads_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildClassFromInterfaceOverloads {
        smoke_ChildClassFromInterfaceOverloads_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ChildClassFromInterfaceOverloads_copyFromCType(_ handle: _baseRef) -> ChildClassFromInterfaceOverloads? {
    guard handle != 0 else {
        return nil
    }
    return ChildClassFromInterfaceOverloads_moveFromCType(handle) as ChildClassFromInterfaceOverloads
}
internal func ChildClassFromInterfaceOverloads_moveFromCType(_ handle: _baseRef) -> ChildClassFromInterfaceOverloads? {
    guard handle != 0 else {
        return nil
    }
    return ChildClassFromInterfaceOverloads_moveFromCType(handle) as ChildClassFromInterfaceOverloads
}
internal func copyToCType(_ swiftClass: ChildClassFromInterfaceOverloads) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildClassFromInterfaceOverloads) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ChildClassFromInterfaceOverloads?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildClassFromInterfaceOverloads?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
