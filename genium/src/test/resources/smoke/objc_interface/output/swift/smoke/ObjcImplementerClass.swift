//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ObjcImplementerClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ObjcImplementerClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ObjcImplementerClass_release_handle)
        : RefHolder(handle_copy)
}
@objcMembers
public class ObjcImplementerClass: NSObject, ObjcInterface {
    let c_instance : _baseRef
    init?(cObjcImplementerClass: _baseRef) {
        guard cObjcImplementerClass != 0 else {
            return nil
        }
        c_instance = cObjcImplementerClass
    }
    deinit {
        smoke_ObjcImplementerClass_release_handle(c_instance)
    }
}
extension ObjcImplementerClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
