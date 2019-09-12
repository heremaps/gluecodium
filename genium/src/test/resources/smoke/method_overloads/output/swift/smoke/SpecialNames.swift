//
//
import Foundation
public class SpecialNames {
    let c_instance : _baseRef
    init(cSpecialNames: _baseRef) {
        guard cSpecialNames != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSpecialNames
    }
    deinit {
        smoke_SpecialNames_release_handle(c_instance)
    }
    public func create() -> Void {
        return moveFromCType(smoke_SpecialNames_create(self.c_instance))
    }
    public func release() -> Void {
        return moveFromCType(smoke_SpecialNames_release(self.c_instance))
    }
    public func createProxy() -> Void {
        return moveFromCType(smoke_SpecialNames_createProxy(self.c_instance))
    }
    public func Uppercase() -> Void {
        return moveFromCType(smoke_SpecialNames_Uppercase(self.c_instance))
    }
}
internal func getRef(_ ref: SpecialNames?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SpecialNames_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SpecialNames_release_handle)
        : RefHolder(handle_copy)
}
extension SpecialNames: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func SpecialNames_copyFromCType(_ handle: _baseRef) -> SpecialNames {
    return SpecialNames(cSpecialNames: smoke_SpecialNames_copy_handle(handle))
}
internal func SpecialNames_moveFromCType(_ handle: _baseRef) -> SpecialNames {
    return SpecialNames(cSpecialNames: handle)
}
internal func SpecialNames_copyFromCType(_ handle: _baseRef) -> SpecialNames? {
    guard handle != 0 else {
        return nil
    }
    return SpecialNames_moveFromCType(handle) as SpecialNames
}
internal func SpecialNames_moveFromCType(_ handle: _baseRef) -> SpecialNames? {
    guard handle != 0 else {
        return nil
    }
    return SpecialNames_moveFromCType(handle) as SpecialNames
}
internal func copyToCType(_ swiftClass: SpecialNames) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SpecialNames) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SpecialNames?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SpecialNames?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
