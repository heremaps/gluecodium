//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ObjcImplementerClass?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
@objcMembers
public class ObjcImplementerClass: NSObject, ObjcInterface {
    let c_instance : _baseRef
    public init?(cObjcImplementerClass: _baseRef) {
        guard cObjcImplementerClass != 0 else {
            return nil
        }
        c_instance = cObjcImplementerClass
    }
    deinit {
        smoke_ObjcImplementerClass_release(c_instance)
    }
}
extension ObjcImplementerClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
