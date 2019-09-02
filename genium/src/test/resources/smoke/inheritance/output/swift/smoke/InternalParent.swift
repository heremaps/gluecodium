//
//

import Foundation
@_cdecl("_CBridgeInitsmoke_InternalParent")
internal func _CBridgeInitsmoke_InternalParent(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = InternalParent(cInternalParent: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: InternalParent?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_InternalParent_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_InternalParent_release_handle)
        : RefHolder(handle_copy)
}
internal class InternalParent {
    let c_instance : _baseRef
    init(cInternalParent: _baseRef) {
        guard cInternalParent != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInternalParent
    }
    deinit {
        smoke_InternalParent_release_handle(c_instance)
    }
}
extension InternalParent: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InternalParentcopyFromCType(_ handle: _baseRef) -> InternalParent {
    if let swift_pointer = smoke_InternalParent_get_typed(smoke_InternalParent_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalParent {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InternalParentmoveFromCType(_ handle: _baseRef) -> InternalParent {
    if let swift_pointer = smoke_InternalParent_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalParent {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InternalParentcopyFromCType(_ handle: _baseRef) -> InternalParent? {
    guard handle != 0 else {
        return nil
    }
    return InternalParentmoveFromCType(handle) as InternalParent
}
internal func InternalParentmoveFromCType(_ handle: _baseRef) -> InternalParent? {
    guard handle != 0 else {
        return nil
    }
    return InternalParentmoveFromCType(handle) as InternalParent
}
internal func copyToCType(_ swiftClass: InternalParent) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalParent) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InternalParent?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalParent?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
