//
//

import Foundation
@_cdecl("_CBridgeInitsmoke_InternalChild")
internal func _CBridgeInitsmoke_InternalChild(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = InternalChild(cInternalChild: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: InternalChild?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_InternalChild_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_InternalChild_release_handle)
        : RefHolder(handle_copy)
}
internal class InternalChild: InternalParent {
    init(cInternalChild: _baseRef) {
        super.init(cInternalParent: cInternalChild)
    }
}
internal func InternalChildcopyFromCType(_ handle: _baseRef) -> InternalChild {
    if let swift_pointer = smoke_InternalChild_get_typed(smoke_InternalChild_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalChild {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InternalChildmoveFromCType(_ handle: _baseRef) -> InternalChild {
    if let swift_pointer = smoke_InternalChild_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? InternalChild {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func InternalChildcopyFromCType(_ handle: _baseRef) -> InternalChild? {
    guard handle != 0 else {
        return nil
    }
    return InternalChildmoveFromCType(handle) as InternalChild
}
internal func InternalChildmoveFromCType(_ handle: _baseRef) -> InternalChild? {
    guard handle != 0 else {
        return nil
    }
    return InternalChildmoveFromCType(handle) as InternalChild
}
internal func copyToCType(_ swiftClass: InternalChild) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalChild) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InternalChild?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalChild?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
