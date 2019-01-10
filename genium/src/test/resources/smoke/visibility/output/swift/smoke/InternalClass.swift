//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_InternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_InternalClass_release_handle)
        : RefHolder(handle_copy)
}

internal class InternalClass {
    let c_instance : _baseRef

    init(cInternalClass: _baseRef) {
        guard cInternalClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInternalClass
    }

    deinit {
        smoke_InternalClass_release_handle(c_instance)
    }
}

extension InternalClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
