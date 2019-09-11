//
//
import Foundation
public class ChildClassFromClass: ParentClass {
    init(cChildClassFromClass: _baseRef) {
        super.init(cParentClass: cChildClassFromClass)
    }
    public func childClassMethod() -> Void {
        return moveFromCType(smoke_ChildClassFromClass_childClassMethod(self.c_instance))
    }
}
@_cdecl("_CBridgeInitsmoke_ChildClassFromClass")
internal func _CBridgeInitsmoke_ChildClassFromClass(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = ChildClassFromClass(cChildClassFromClass: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: ChildClassFromClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ChildClassFromClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ChildClassFromClass_release_handle)
        : RefHolder(handle_copy)
}
internal func ChildClassFromClasscopyFromCType(_ handle: _baseRef) -> ChildClassFromClass {
    if let swift_pointer = smoke_ChildClassFromClass_get_typed(smoke_ChildClassFromClass_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildClassFromClass {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ChildClassFromClassmoveFromCType(_ handle: _baseRef) -> ChildClassFromClass {
    if let swift_pointer = smoke_ChildClassFromClass_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? ChildClassFromClass {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func ChildClassFromClasscopyFromCType(_ handle: _baseRef) -> ChildClassFromClass? {
    guard handle != 0 else {
        return nil
    }
    return ChildClassFromClassmoveFromCType(handle) as ChildClassFromClass
}
internal func ChildClassFromClassmoveFromCType(_ handle: _baseRef) -> ChildClassFromClass? {
    guard handle != 0 else {
        return nil
    }
    return ChildClassFromClassmoveFromCType(handle) as ChildClassFromClass
}
internal func copyToCType(_ swiftClass: ChildClassFromClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildClassFromClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ChildClassFromClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildClassFromClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
