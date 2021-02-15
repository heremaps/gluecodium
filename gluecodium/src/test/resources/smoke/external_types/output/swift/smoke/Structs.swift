//
//
import Foundation
public class Structs {
    let c_instance : _baseRef
    init(cStructs: _baseRef) {
        guard cStructs != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cStructs
    }
    deinit {
        smoke_Structs_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_Structs_release_handle(c_instance)
    }
    public struct ExternalStruct {
        public var stringField: String
        public var externalStringField: String
        public var externalArrayField: [Int8]
        public var externalStructField: Structs.AnotherExternalStruct
        public init(stringField: String, externalStringField: String, externalArrayField: [Int8], externalStructField: Structs.AnotherExternalStruct) {
            self.stringField = stringField
            self.externalStringField = externalStringField
            self.externalArrayField = externalArrayField
            self.externalStructField = externalStructField
        }
        internal init(cHandle: _baseRef) {
            stringField = moveFromCType(smoke_Structs_ExternalStruct_stringField_get(cHandle))
            externalStringField = moveFromCType(smoke_Structs_ExternalStruct_externalStringField_get(cHandle))
            externalArrayField = foobar_moveFromCType(smoke_Structs_ExternalStruct_externalArrayField_get(cHandle))
            externalStructField = moveFromCType(smoke_Structs_ExternalStruct_externalStructField_get(cHandle))
        }
    }
    public struct AnotherExternalStruct {
        public var intField: Int8
        public init(intField: Int8) {
            self.intField = intField
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_Structs_AnotherExternalStruct_intField_get(cHandle))
        }
    }
    public static func getExternalStruct() -> Structs.ExternalStruct {
        return moveFromCType(smoke_Structs_getExternalStruct())
    }
    public static func getAnotherExternalStruct() -> Structs.AnotherExternalStruct {
        return moveFromCType(smoke_Structs_getAnotherExternalStruct())
    }
}
internal func getRef(_ ref: Structs?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Structs_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Structs_release_handle)
        : RefHolder(handle_copy)
}
extension Structs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension Structs: Hashable {
    /// :nodoc:
    public static func == (lhs: Structs, rhs: Structs) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func Structs_copyFromCType(_ handle: _baseRef) -> Structs {
    if let swift_pointer = smoke_Structs_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Structs {
        return re_constructed
    }
    let result = Structs(cStructs: smoke_Structs_copy_handle(handle))
    smoke_Structs_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Structs_moveFromCType(_ handle: _baseRef) -> Structs {
    if let swift_pointer = smoke_Structs_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Structs {
        smoke_Structs_release_handle(handle)
        return re_constructed
    }
    let result = Structs(cStructs: handle)
    smoke_Structs_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Structs_copyFromCType(_ handle: _baseRef) -> Structs? {
    guard handle != 0 else {
        return nil
    }
    return Structs_moveFromCType(handle) as Structs
}
internal func Structs_moveFromCType(_ handle: _baseRef) -> Structs? {
    guard handle != 0 else {
        return nil
    }
    return Structs_moveFromCType(handle) as Structs
}
internal func copyToCType(_ swiftClass: Structs) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Structs) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Structs?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Structs?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.ExternalStruct {
    return Structs.ExternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.ExternalStruct {
    defer {
        smoke_Structs_ExternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.ExternalStruct) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    let c_externalStringField = moveToCType(swiftType.externalStringField)
    let c_externalArrayField = foobar_moveToCType(swiftType.externalArrayField)
    let c_externalStructField = moveToCType(swiftType.externalStructField)
    return RefHolder(smoke_Structs_ExternalStruct_create_handle(c_stringField.ref, c_externalStringField.ref, c_externalArrayField.ref, c_externalStructField.ref))
}
internal func moveToCType(_ swiftType: Structs.ExternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_ExternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.ExternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Structs_ExternalStruct_unwrap_optional_handle(handle)
    return Structs.ExternalStruct(cHandle: unwrappedHandle) as Structs.ExternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.ExternalStruct? {
    defer {
        smoke_Structs_ExternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.ExternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    let c_externalStringField = moveToCType(swiftType.externalStringField)
    let c_externalArrayField = foobar_moveToCType(swiftType.externalArrayField)
    let c_externalStructField = moveToCType(swiftType.externalStructField)
    return RefHolder(smoke_Structs_ExternalStruct_create_optional_handle(c_stringField.ref, c_externalStringField.ref, c_externalArrayField.ref, c_externalStructField.ref))
}
internal func moveToCType(_ swiftType: Structs.ExternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_ExternalStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.AnotherExternalStruct {
    return Structs.AnotherExternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.AnotherExternalStruct {
    defer {
        smoke_Structs_AnotherExternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.AnotherExternalStruct) -> RefHolder {
    let c_intField = moveToCType(swiftType.intField)
    return RefHolder(smoke_Structs_AnotherExternalStruct_create_handle(c_intField.ref))
}
internal func moveToCType(_ swiftType: Structs.AnotherExternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_AnotherExternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.AnotherExternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Structs_AnotherExternalStruct_unwrap_optional_handle(handle)
    return Structs.AnotherExternalStruct(cHandle: unwrappedHandle) as Structs.AnotherExternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.AnotherExternalStruct? {
    defer {
        smoke_Structs_AnotherExternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.AnotherExternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_intField = moveToCType(swiftType.intField)
    return RefHolder(smoke_Structs_AnotherExternalStruct_create_optional_handle(c_intField.ref))
}
internal func moveToCType(_ swiftType: Structs.AnotherExternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_AnotherExternalStruct_release_optional_handle)
}
