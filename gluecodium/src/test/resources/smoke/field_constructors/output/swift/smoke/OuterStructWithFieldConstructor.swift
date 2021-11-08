//
//
import Foundation
public struct OuterStructWithFieldConstructor {
    public var outerStructField: OuterStructWithFieldConstructor.InnerStructWithDefaults
    public init(outerStructField: OuterStructWithFieldConstructor.InnerStructWithDefaults) {
        self.outerStructField = outerStructField
    }
    internal init(cHandle: _baseRef) {
        outerStructField = moveFromCType(smoke_OuterStructWithFieldConstructor_outerStructField_get(cHandle))
    }
    public struct InnerStructWithDefaults {
        public var innerStructField: Double
        public init(innerStructField: Double = 1.0) {
            self.innerStructField = innerStructField
        }
        internal init(cHandle: _baseRef) {
            innerStructField = moveFromCType(smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_innerStructField_get(cHandle))
        }
    }
}
internal func copyFromCType(_ handle: _baseRef) -> OuterStructWithFieldConstructor {
    return OuterStructWithFieldConstructor(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> OuterStructWithFieldConstructor {
    defer {
        smoke_OuterStructWithFieldConstructor_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: OuterStructWithFieldConstructor) -> RefHolder {
    let c_outerStructField = moveToCType(swiftType.outerStructField)
    return RefHolder(smoke_OuterStructWithFieldConstructor_create_handle(c_outerStructField.ref))
}
internal func moveToCType(_ swiftType: OuterStructWithFieldConstructor) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_OuterStructWithFieldConstructor_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> OuterStructWithFieldConstructor? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_OuterStructWithFieldConstructor_unwrap_optional_handle(handle)
    return OuterStructWithFieldConstructor(cHandle: unwrappedHandle) as OuterStructWithFieldConstructor
}
internal func moveFromCType(_ handle: _baseRef) -> OuterStructWithFieldConstructor? {
    defer {
        smoke_OuterStructWithFieldConstructor_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: OuterStructWithFieldConstructor?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_outerStructField = moveToCType(swiftType.outerStructField)
    return RefHolder(smoke_OuterStructWithFieldConstructor_create_optional_handle(c_outerStructField.ref))
}
internal func moveToCType(_ swiftType: OuterStructWithFieldConstructor?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_OuterStructWithFieldConstructor_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> OuterStructWithFieldConstructor.InnerStructWithDefaults {
    return OuterStructWithFieldConstructor.InnerStructWithDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> OuterStructWithFieldConstructor.InnerStructWithDefaults {
    defer {
        smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: OuterStructWithFieldConstructor.InnerStructWithDefaults) -> RefHolder {
    let c_innerStructField = moveToCType(swiftType.innerStructField)
    return RefHolder(smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_create_handle(c_innerStructField.ref))
}
internal func moveToCType(_ swiftType: OuterStructWithFieldConstructor.InnerStructWithDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> OuterStructWithFieldConstructor.InnerStructWithDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_unwrap_optional_handle(handle)
    return OuterStructWithFieldConstructor.InnerStructWithDefaults(cHandle: unwrappedHandle) as OuterStructWithFieldConstructor.InnerStructWithDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> OuterStructWithFieldConstructor.InnerStructWithDefaults? {
    defer {
        smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: OuterStructWithFieldConstructor.InnerStructWithDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_innerStructField = moveToCType(swiftType.innerStructField)
    return RefHolder(smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_create_optional_handle(c_innerStructField.ref))
}
internal func moveToCType(_ swiftType: OuterStructWithFieldConstructor.InnerStructWithDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_release_optional_handle)
}
