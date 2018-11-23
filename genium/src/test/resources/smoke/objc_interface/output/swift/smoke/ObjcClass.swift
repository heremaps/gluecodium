//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ObjcClass?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
@objcMembers
public class ObjcClass: NSObject {
    let c_instance : _baseRef
    init?(cObjcClass: _baseRef) {
        guard cObjcClass != 0 else {
            return nil
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
