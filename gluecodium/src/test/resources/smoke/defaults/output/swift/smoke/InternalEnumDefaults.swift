//
//
import Foundation
public struct InternalEnumDefaults {
    public var publicField: FooBarEnum
    public var publicListField: [FooBarEnum]
    internal var internalField: FooBarEnum
    internal var internalListField: [FooBarEnum]
    public init(publicField: FooBarEnum = FooBarEnum.foo, publicListField: [FooBarEnum] = [FooBarEnum.foo, FooBarEnum.bar, FooBarEnum.baz]) {
        self.publicField = publicField
        self.publicListField = publicListField
        self.internalField = FooBarEnum.bar
        self.internalListField = [FooBarEnum.foo, FooBarEnum.bar, FooBarEnum.baz]
    }
    internal init(publicField: FooBarEnum = FooBarEnum.foo, publicListField: [FooBarEnum] = [FooBarEnum.foo, FooBarEnum.bar, FooBarEnum.baz], internalField: FooBarEnum = FooBarEnum.bar, internalListField: [FooBarEnum] = [FooBarEnum.foo, FooBarEnum.bar, FooBarEnum.baz]) {
        self.publicField = publicField
        self.publicListField = publicListField
        self.internalField = internalField
        self.internalListField = internalListField
    }
    internal init(cHandle: _baseRef) {
        publicField = moveFromCType(smoke_InternalEnumDefaults_publicField_get(cHandle))
        publicListField = moveFromCType(smoke_InternalEnumDefaults_publicListField_get(cHandle))
        internalField = moveFromCType(smoke_InternalEnumDefaults_internalField_get(cHandle))
        internalListField = moveFromCType(smoke_InternalEnumDefaults_internalListField_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> InternalEnumDefaults {
    return InternalEnumDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> InternalEnumDefaults {
    defer {
        smoke_InternalEnumDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InternalEnumDefaults) -> RefHolder {
    let c_publicField = moveToCType(swiftType.publicField)
    let c_publicListField = moveToCType(swiftType.publicListField)
    let c_internalField = moveToCType(swiftType.internalField)
    let c_internalListField = moveToCType(swiftType.internalListField)
    return RefHolder(smoke_InternalEnumDefaults_create_handle(c_publicField.ref, c_publicListField.ref, c_internalField.ref, c_internalListField.ref))
}
internal func moveToCType(_ swiftType: InternalEnumDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InternalEnumDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> InternalEnumDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_InternalEnumDefaults_unwrap_optional_handle(handle)
    return InternalEnumDefaults(cHandle: unwrappedHandle) as InternalEnumDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> InternalEnumDefaults? {
    defer {
        smoke_InternalEnumDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InternalEnumDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_publicField = moveToCType(swiftType.publicField)
    let c_publicListField = moveToCType(swiftType.publicListField)
    let c_internalField = moveToCType(swiftType.internalField)
    let c_internalListField = moveToCType(swiftType.internalListField)
    return RefHolder(smoke_InternalEnumDefaults_create_optional_handle(c_publicField.ref, c_publicListField.ref, c_internalField.ref, c_internalListField.ref))
}
internal func moveToCType(_ swiftType: InternalEnumDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InternalEnumDefaults_release_optional_handle)
}
