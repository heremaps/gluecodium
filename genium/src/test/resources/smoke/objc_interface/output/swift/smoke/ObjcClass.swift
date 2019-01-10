//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ObjcClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ObjcClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ObjcClass_release_handle)
        : RefHolder(handle_copy)
}
@objcMembers
public class ObjcClass: NSObject {
    let c_instance : _baseRef
    init(cObjcClass: _baseRef) {
        guard cObjcClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cObjcClass
    }
    deinit {
        smoke_ObjcClass_release_handle(c_instance)
    }
}
extension ObjcClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
