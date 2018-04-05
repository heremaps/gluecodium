//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InternalClass?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}

internal class InternalClass {
    let c_instance : _baseRef

    public init?(cInternalClass: _baseRef) {
        guard cInternalClass != 0 else {
            return nil
        }
        c_instance = cInternalClass
    }

    deinit {
        smoke_InternalClass_release(c_instance)
    }
}

extension InternalClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
