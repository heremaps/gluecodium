//
//

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
internal func InternalClasscopyFromCType(_ handle: _baseRef) -> InternalClass {
    return InternalClass(cInternalClass: smoke_InternalClass_copy_handle(handle))
}
internal func InternalClassmoveFromCType(_ handle: _baseRef) -> InternalClass {
    return InternalClass(cInternalClass: handle)
}
internal func InternalClasscopyFromCType(_ handle: _baseRef) -> InternalClass? {
    guard handle != 0 else {
        return nil
    }
    return InternalClassmoveFromCType(handle) as InternalClass
}
internal func InternalClassmoveFromCType(_ handle: _baseRef) -> InternalClass? {
    guard handle != 0 else {
        return nil
    }
    return InternalClassmoveFromCType(handle) as InternalClass
}
internal func copyToCType(_ swiftClass: InternalClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
