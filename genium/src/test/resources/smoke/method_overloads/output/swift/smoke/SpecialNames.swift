//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: SpecialNames?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class SpecialNames {
    let c_instance : _baseRef
    init?(cSpecialNames: _baseRef) {
        guard cSpecialNames != 0 else {
            return nil
        }
        c_instance = cSpecialNames
    }
    deinit {
        smoke_SpecialNames_release_handle(c_instance)
    }
    public func create() -> Void {
        return smoke_SpecialNames_create(c_instance)
    }
    public func release() -> Void {
        return smoke_SpecialNames_release(c_instance)
    }
    public func createProxy() -> Void {
        return smoke_SpecialNames_createProxy(c_instance)
    }
}
extension SpecialNames: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
