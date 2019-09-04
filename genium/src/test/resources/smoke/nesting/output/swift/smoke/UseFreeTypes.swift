//
//
import Foundation
internal func getRef(_ ref: UseFreeTypes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_UseFreeTypes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_UseFreeTypes_release_handle)
        : RefHolder(handle_copy)
}
public class UseFreeTypes {
    let c_instance : _baseRef
    init(cUseFreeTypes: _baseRef) {
        guard cUseFreeTypes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cUseFreeTypes
    }
    deinit {
        smoke_UseFreeTypes_release_handle(c_instance)
    }
    public func doStuff(point: FreePoint, mode: FreeEnum) throws -> FreeTypeDef {
        let c_point = moveToCType(point)
        let c_mode = moveToCType(mode)
        let RESULT = smoke_UseFreeTypes_doStuff(self.c_instance, c_point.ref, c_mode.ref)
        if (RESULT.has_value) {
            return moveFromCType(RESULT.returned_value)
        } else {
            throw FreeError(rawValue: RESULT.error_code)!
        }
    }
}
extension UseFreeTypes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func UseFreeTypescopyFromCType(_ handle: _baseRef) -> UseFreeTypes {
    return UseFreeTypes(cUseFreeTypes: smoke_UseFreeTypes_copy_handle(handle))
}
internal func UseFreeTypesmoveFromCType(_ handle: _baseRef) -> UseFreeTypes {
    return UseFreeTypes(cUseFreeTypes: handle)
}
internal func UseFreeTypescopyFromCType(_ handle: _baseRef) -> UseFreeTypes? {
    guard handle != 0 else {
        return nil
    }
    return UseFreeTypesmoveFromCType(handle) as UseFreeTypes
}
internal func UseFreeTypesmoveFromCType(_ handle: _baseRef) -> UseFreeTypes? {
    guard handle != 0 else {
        return nil
    }
    return UseFreeTypesmoveFromCType(handle) as UseFreeTypes
}
internal func copyToCType(_ swiftClass: UseFreeTypes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: UseFreeTypes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: UseFreeTypes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: UseFreeTypes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
