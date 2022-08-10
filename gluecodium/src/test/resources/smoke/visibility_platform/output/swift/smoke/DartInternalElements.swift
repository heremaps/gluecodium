//
//
import Foundation
public struct DartInternalElements {
    public var stringField: String
    public init(stringField: String) {
        self.stringField = stringField
    }
    internal init(cHandle: _baseRef) {
        stringField = moveFromCType(smoke_DartInternalElements_stringField_get(cHandle))
    }
    public func foo() -> Void {
        let c_self_handle = moveToCType(self)
        smoke_DartInternalElements_foo(c_self_handle.ref)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> DartInternalElements {
    return DartInternalElements(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DartInternalElements {
    defer {
        smoke_DartInternalElements_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DartInternalElements) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_DartInternalElements_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: DartInternalElements) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DartInternalElements_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DartInternalElements? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DartInternalElements_unwrap_optional_handle(handle)
    return DartInternalElements(cHandle: unwrappedHandle) as DartInternalElements
}
internal func moveFromCType(_ handle: _baseRef) -> DartInternalElements? {
    defer {
        smoke_DartInternalElements_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DartInternalElements?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_DartInternalElements_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: DartInternalElements?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DartInternalElements_release_optional_handle)
}
