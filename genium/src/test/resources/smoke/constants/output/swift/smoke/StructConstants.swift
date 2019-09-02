//
//

import Foundation
internal func getRef(_ ref: StructConstants?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_StructConstants_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_StructConstants_release_handle)
        : RefHolder(handle_copy)
}
public class StructConstants {
    public static let structConstant: StructConstants.SomeStruct = StructConstants.SomeStruct(stringField: "bar Buzz", floatField: 1.41)
    public static let nestingStructConstant: StructConstants.NestingStruct = StructConstants.NestingStruct(structField: StructConstants.SomeStruct(stringField: "nonsense", floatField: -2.82))
    let c_instance : _baseRef
    init(cStructConstants: _baseRef) {
        guard cStructConstants != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cStructConstants
    }
    deinit {
        smoke_StructConstants_release_handle(c_instance)
    }
    public struct SomeStruct {
        public var stringField: String
        public var floatField: Float
        public init(stringField: String, floatField: Float) {
            self.stringField = stringField
            self.floatField = floatField
        }
        internal init(cHandle: _baseRef) {
            stringField = moveFromCType(smoke_StructConstants_SomeStruct_stringField_get(cHandle))
            floatField = moveFromCType(smoke_StructConstants_SomeStruct_floatField_get(cHandle))
        }
    }
    public struct NestingStruct {
        public var structField: StructConstants.SomeStruct
        public init(structField: StructConstants.SomeStruct) {
            self.structField = structField
        }
        internal init(cHandle: _baseRef) {
            structField = moveFromCType(smoke_StructConstants_NestingStruct_structField_get(cHandle))
        }
    }
}
extension StructConstants: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func StructConstantscopyFromCType(_ handle: _baseRef) -> StructConstants {
    return StructConstants(cStructConstants: smoke_StructConstants_copy_handle(handle))
}
internal func StructConstantsmoveFromCType(_ handle: _baseRef) -> StructConstants {
    return StructConstants(cStructConstants: handle)
}
internal func StructConstantscopyFromCType(_ handle: _baseRef) -> StructConstants? {
    guard handle != 0 else {
        return nil
    }
    return StructConstantsmoveFromCType(handle) as StructConstants
}
internal func StructConstantsmoveFromCType(_ handle: _baseRef) -> StructConstants? {
    guard handle != 0 else {
        return nil
    }
    return StructConstantsmoveFromCType(handle) as StructConstants
}
internal func copyToCType(_ swiftClass: StructConstants) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: StructConstants) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: StructConstants?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: StructConstants?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> StructConstants.SomeStruct {
    return StructConstants.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> StructConstants.SomeStruct {
    defer {
        smoke_StructConstants_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructConstants.SomeStruct) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    let c_floatField = moveToCType(swiftType.floatField)
    return RefHolder(smoke_StructConstants_SomeStruct_create_handle(c_stringField.ref, c_floatField.ref))
}
internal func moveToCType(_ swiftType: StructConstants.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructConstants_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructConstants.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructConstants_SomeStruct_unwrap_optional_handle(handle)
    return StructConstants.SomeStruct(cHandle: unwrappedHandle) as StructConstants.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> StructConstants.SomeStruct? {
    defer {
        smoke_StructConstants_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructConstants.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    let c_floatField = moveToCType(swiftType.floatField)
    return RefHolder(smoke_StructConstants_SomeStruct_create_optional_handle(c_stringField.ref, c_floatField.ref))
}
internal func moveToCType(_ swiftType: StructConstants.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructConstants_SomeStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructConstants.NestingStruct {
    return StructConstants.NestingStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> StructConstants.NestingStruct {
    defer {
        smoke_StructConstants_NestingStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructConstants.NestingStruct) -> RefHolder {
    let c_structField = moveToCType(swiftType.structField)
    return RefHolder(smoke_StructConstants_NestingStruct_create_handle(c_structField.ref))
}
internal func moveToCType(_ swiftType: StructConstants.NestingStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructConstants_NestingStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructConstants.NestingStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructConstants_NestingStruct_unwrap_optional_handle(handle)
    return StructConstants.NestingStruct(cHandle: unwrappedHandle) as StructConstants.NestingStruct
}
internal func moveFromCType(_ handle: _baseRef) -> StructConstants.NestingStruct? {
    defer {
        smoke_StructConstants_NestingStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructConstants.NestingStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_structField = moveToCType(swiftType.structField)
    return RefHolder(smoke_StructConstants_NestingStruct_create_optional_handle(c_structField.ref))
}
internal func moveToCType(_ swiftType: StructConstants.NestingStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructConstants_NestingStruct_release_optional_handle)
}
