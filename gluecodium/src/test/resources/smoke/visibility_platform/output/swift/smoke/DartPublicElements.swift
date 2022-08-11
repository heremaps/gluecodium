//
//
import Foundation
public struct DartPublicElements {
    internal var stringField: String
    internal init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_DartPublicElements_stringField_get(cHandle))
    }
    internal func foo() -> Void {
        let c_self_handle = moveToCType(self)
        smoke_DartPublicElements_foo(c_self_handle.ref)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> DartPublicElements {
    return DartPublicElements(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DartPublicElements {
    defer {
        smoke_DartPublicElements_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DartPublicElements) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_DartPublicElements_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: DartPublicElements) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DartPublicElements_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DartPublicElements? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DartPublicElements_unwrap_optional_handle(handle)
    return DartPublicElements(cHandle: unwrappedHandle) as DartPublicElements
}
internal func moveFromCType(_ handle: _baseRef) -> DartPublicElements? {
    defer {
        smoke_DartPublicElements_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DartPublicElements?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_DartPublicElements_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: DartPublicElements?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DartPublicElements_release_optional_handle)
}
