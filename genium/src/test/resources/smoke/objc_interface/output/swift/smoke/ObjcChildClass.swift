//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ObjcChildClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ObjcChildClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ObjcChildClass_release_handle)
        : RefHolder(handle_copy)
}
@objcMembers
public class ObjcChildClass: ObjcClass {
    init(cObjcChildClass: _baseRef) {
        super.init(cObjcClass: cObjcChildClass)
    }
}
internal func ObjcChildClasscopyFromCType(_ handle: _baseRef) -> ObjcChildClass {
    return ObjcChildClass(cObjcChildClass: handle)
}
internal func ObjcChildClassmoveFromCType(_ handle: _baseRef) -> ObjcChildClass {
    return ObjcChildClasscopyFromCType(handle)
}
internal func ObjcChildClasscopyFromCType(_ handle: _baseRef) -> ObjcChildClass? {
    guard handle != 0 else {
        return nil
    }
    return ObjcChildClassmoveFromCType(handle) as ObjcChildClass
}
internal func ObjcChildClassmoveFromCType(_ handle: _baseRef) -> ObjcChildClass? {
    return ObjcChildClasscopyFromCType(handle)
}
internal func copyToCType(_ swiftClass: ObjcChildClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ObjcChildClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ObjcChildClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ObjcChildClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}