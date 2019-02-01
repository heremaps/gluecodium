//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Maps?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Maps_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Maps_release_handle)
        : RefHolder(handle_copy)
}
public class Maps {
    public typealias ErrorCodeToMessageMap = [Int32: String]
    public typealias NumberToStruct = [UInt8: Maps.SomeStruct]
    public typealias NestedMap = [UInt8: Maps.NumberToStruct]
    public typealias NumberToTypeDef = [UInt8: Maps.SomeId]
    public typealias TypeDefToNumber = [Maps.SomeId: UInt8]
    public typealias SomeId = String
    public typealias StringToArray = [String: [Int32]]
    public typealias NumberToInstance = [UInt8: MapsInstance]
    let c_instance : _baseRef
    init(cMaps: _baseRef) {
        guard cMaps != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cMaps
    }
    deinit {
        smoke_Maps_release_handle(c_instance)
    }
    public struct SomeStruct {
        public var value: String
        public init(value: String) {
            self.value = value
        }
        internal init(cHandle: _baseRef) {
            value = moveFromCType(smoke_Maps_SomeStruct_value_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_value = moveToCType(value)
            return smoke_Maps_SomeStruct_create_handle(c_value.ref)
        }
    }
    public struct StructWithMap {
        public var errorMapping: Maps.ErrorCodeToMessageMap
        public init(errorMapping: Maps.ErrorCodeToMessageMap) {
            self.errorMapping = errorMapping
        }
        internal init(cHandle: _baseRef) {
            errorMapping = moveFromCType(smoke_Maps_StructWithMap_errorMapping_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_errorMapping = moveToCType(errorMapping)
            return smoke_Maps_StructWithMap_create_handle(c_errorMapping.ref)
        }
    }
    public static func methodWithMap(input: Maps.ErrorCodeToMessageMap) -> Maps.ErrorCodeToMessageMap {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Maps_methodWithMap(c_input.ref))
    }
    public static func methodWithMapToStruct(input: Maps.NumberToStruct) -> Maps.NumberToStruct {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Maps_methodWithMapToStruct(c_input.ref))
    }
    public static func methodWithNestedMap(input: Maps.NestedMap) -> Maps.NestedMap {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Maps_methodWithNestedMap(c_input.ref))
    }
    public static func methodWithStructWithMap(input: Maps.StructWithMap) -> Maps.StructWithMap {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Maps_methodWithStructWithMap(c_input.ref))
    }
    public static func methodWithMapOfArrays(input: Maps.StringToArray) -> Maps.StringToArray {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Maps_methodWithMapOfArrays(c_input.ref))
    }
    public static func methodWithMapOfInstances(input: Maps.NumberToInstance) -> Maps.NumberToInstance {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Maps_methodWithMapOfInstances(c_input.ref))
    }
}
extension Maps: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func MapscopyFromCType(_ handle: _baseRef) -> Maps {
    return Maps(cMaps: smoke_Maps_copy_handle(handle))
}
internal func MapsmoveFromCType(_ handle: _baseRef) -> Maps {
    return Maps(cMaps: handle)
}
internal func MapscopyFromCType(_ handle: _baseRef) -> Maps? {
    guard handle != 0 else {
        return nil
    }
    return MapsmoveFromCType(handle) as Maps
}
internal func MapsmoveFromCType(_ handle: _baseRef) -> Maps? {
    guard handle != 0 else {
        return nil
    }
    return MapsmoveFromCType(handle) as Maps
}
internal func copyToCType(_ swiftClass: Maps) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Maps) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Maps?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Maps?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.SomeStruct {
    return Maps.SomeStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.SomeStruct {
    defer {
        smoke_Maps_SomeStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Maps.SomeStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Maps.SomeStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_SomeStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.SomeStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_SomeStruct_unwrap_optional_handle(handle)
    return Maps.SomeStruct(cHandle: unwrappedHandle) as Maps.SomeStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.SomeStruct? {
    defer {
        smoke_Maps_SomeStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Maps.SomeStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Maps_SomeStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Maps.SomeStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_SomeStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.StructWithMap {
    return Maps.StructWithMap(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.StructWithMap {
    defer {
        smoke_Maps_StructWithMap_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Maps.StructWithMap) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Maps.StructWithMap) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_StructWithMap_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Maps.StructWithMap? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Maps_StructWithMap_unwrap_optional_handle(handle)
    return Maps.StructWithMap(cHandle: unwrappedHandle) as Maps.StructWithMap
}
internal func moveFromCType(_ handle: _baseRef) -> Maps.StructWithMap? {
    defer {
        smoke_Maps_StructWithMap_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Maps.StructWithMap?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Maps_StructWithMap_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Maps.StructWithMap?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Maps_StructWithMap_release_optional_handle)
}