//
//
import Foundation
@OnStruct
public struct AttributesStruct {
    @OnConstInStruct
    public static let pi: Bool = false
    @OnField
    public var field: String
    public init(field: String) {
        self.field = field
    }
    internal init(cHandle: _baseRef) {
        field = moveFromCType(smoke_AttributesStruct_field_get(cHandle))
    }
    @OnFunctionInStruct
    public func veryFun(@OnParameterInStruct param: String) -> Void {
        let c_self_handle = moveToCType(self)
        let c_param = moveToCType(param)
        smoke_AttributesStruct_veryFun(c_self_handle.ref, c_param.ref)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> AttributesStruct {
    return AttributesStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> AttributesStruct {
    defer {
        smoke_AttributesStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: AttributesStruct) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_AttributesStruct_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: AttributesStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_AttributesStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> AttributesStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_AttributesStruct_unwrap_optional_handle(handle)
    return AttributesStruct(cHandle: unwrappedHandle) as AttributesStruct
}
internal func moveFromCType(_ handle: _baseRef) -> AttributesStruct? {
    defer {
        smoke_AttributesStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: AttributesStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_AttributesStruct_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: AttributesStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_AttributesStruct_release_optional_handle)
}
