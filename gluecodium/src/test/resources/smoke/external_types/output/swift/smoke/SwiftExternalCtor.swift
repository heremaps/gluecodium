//
//
import Foundation
internal struct SwiftExternalCtor_internal {
    public var field: String
    internal init(cHandle: _baseRef) {
        field = moveFromCType(smoke_SwiftExternalCtor_field_get(cHandle))
    }
    public init(field: String) {
        let _result_handle = SwiftExternalCtor_internal.make(field: field)
        guard _result_handle != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        let _result: SwiftExternalCtor = moveFromCType(_result_handle)
        self.field = _result.field
    }
    private static func make(field: String) -> _baseRef {
        let c_field = moveToCType(field)
        let c_result_handle = smoke_SwiftExternalCtor_make(c_field.ref)
        return moveFromCType(c_result_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> SwiftExternalCtor {
    return FooConverter.convertFromInternal(SwiftExternalCtor_internal(cHandle: handle))
}
internal func moveFromCType(_ handle: _baseRef) -> SwiftExternalCtor {
    defer {
        smoke_SwiftExternalCtor_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType_ext: SwiftExternalCtor) -> RefHolder {
    let swiftType = FooConverter.convertToInternal(swiftType_ext)
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_SwiftExternalCtor_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: SwiftExternalCtor) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SwiftExternalCtor_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> SwiftExternalCtor? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_SwiftExternalCtor_unwrap_optional_handle(handle)
    return FooConverter.convertFromInternal(SwiftExternalCtor_internal(cHandle: unwrappedHandle))
}
internal func moveFromCType(_ handle: _baseRef) -> SwiftExternalCtor? {
    defer {
        smoke_SwiftExternalCtor_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType_ext: SwiftExternalCtor?) -> RefHolder {
    guard let swiftType_ext = swiftType_ext else {
        return RefHolder(0)
    }
    let swiftType = FooConverter.convertToInternal(swiftType_ext)
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_SwiftExternalCtor_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: SwiftExternalCtor?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_SwiftExternalCtor_release_optional_handle)
}
