//
//
import Foundation
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
        smoke_StructConstants_remove_swift_object_from_wrapper_cache(c_instance)
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
            structField = foobar_moveFromCType(smoke_StructConstants_NestingStruct_structField_get(cHandle))
        }
    }
}
internal func getRef(_ ref: StructConstants?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_StructConstants_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_StructConstants_release_handle)
        : RefHolder(handle_copy)
}
extension StructConstants: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension StructConstants: Hashable {
    // :nodoc:
    public static func == (lhs: StructConstants, rhs: StructConstants) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    // :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func foobar_StructConstants_copyFromCType(_ handle: _baseRef) -> StructConstants {
    if let swift_pointer = smoke_StructConstants_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? StructConstants {
        return re_constructed
    }
    let result = StructConstants(cStructConstants: smoke_StructConstants_copy_handle(handle))
    smoke_StructConstants_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_StructConstants_moveFromCType(_ handle: _baseRef) -> StructConstants {
    if let swift_pointer = smoke_StructConstants_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? StructConstants {
        smoke_StructConstants_release_handle(handle)
        return re_constructed
    }
    let result = StructConstants(cStructConstants: handle)
    smoke_StructConstants_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_StructConstants_copyFromCType(_ handle: _baseRef) -> StructConstants? {
    guard handle != 0 else {
        return nil
    }
    return foobar_StructConstants_moveFromCType(handle) as StructConstants
}
internal func foobar_StructConstants_moveFromCType(_ handle: _baseRef) -> StructConstants? {
    guard handle != 0 else {
        return nil
    }
    return foobar_StructConstants_moveFromCType(handle) as StructConstants
}
internal func foobar_copyToCType(_ swiftClass: StructConstants) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: StructConstants) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: StructConstants?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: StructConstants?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> StructConstants.SomeStruct {
    return StructConstants.SomeStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> StructConstants.SomeStruct {
    defer {
        smoke_StructConstants_SomeStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: StructConstants.SomeStruct) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    let c_floatField = moveToCType(swiftType.floatField)
    return RefHolder(smoke_StructConstants_SomeStruct_create_handle(c_stringField.ref, c_floatField.ref))
}
internal func foobar_moveToCType(_ swiftType: StructConstants.SomeStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_StructConstants_SomeStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> StructConstants.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructConstants_SomeStruct_unwrap_optional_handle(handle)
    return StructConstants.SomeStruct(cHandle: unwrappedHandle) as StructConstants.SomeStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> StructConstants.SomeStruct? {
    defer {
        smoke_StructConstants_SomeStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: StructConstants.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    let c_floatField = moveToCType(swiftType.floatField)
    return RefHolder(smoke_StructConstants_SomeStruct_create_optional_handle(c_stringField.ref, c_floatField.ref))
}
internal func foobar_moveToCType(_ swiftType: StructConstants.SomeStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_StructConstants_SomeStruct_release_optional_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> StructConstants.NestingStruct {
    return StructConstants.NestingStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> StructConstants.NestingStruct {
    defer {
        smoke_StructConstants_NestingStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: StructConstants.NestingStruct) -> RefHolder {
    let c_structField = foobar_moveToCType(swiftType.structField)
    return RefHolder(smoke_StructConstants_NestingStruct_create_handle(c_structField.ref))
}
internal func foobar_moveToCType(_ swiftType: StructConstants.NestingStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_StructConstants_NestingStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> StructConstants.NestingStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructConstants_NestingStruct_unwrap_optional_handle(handle)
    return StructConstants.NestingStruct(cHandle: unwrappedHandle) as StructConstants.NestingStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> StructConstants.NestingStruct? {
    defer {
        smoke_StructConstants_NestingStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: StructConstants.NestingStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_structField = foobar_moveToCType(swiftType.structField)
    return RefHolder(smoke_StructConstants_NestingStruct_create_optional_handle(c_structField.ref))
}
internal func foobar_moveToCType(_ swiftType: StructConstants.NestingStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_StructConstants_NestingStruct_release_optional_handle)
}
