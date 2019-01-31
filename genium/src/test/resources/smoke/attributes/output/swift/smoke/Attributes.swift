//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Attributes?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Attributes_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Attributes_release_handle)
        : RefHolder(handle_copy)
}
public class Attributes {
    public var builtInTypeAttribute: UInt32 {
        get {
            return moveFromCType(smoke_Attributes_builtInTypeAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Attributes_builtInTypeAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var readonlyAttribute: Float {
        get {
            return moveFromCType(smoke_Attributes_readonlyAttribute_get(self.c_instance))
        }
    }
    public var structAttribute: Attributes.ExampleStruct {
        get {
            return moveFromCType(smoke_Attributes_structAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Attributes_structAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var arrayAttribute: [String] {
        get {
            return moveFromCType(smoke_Attributes_arrayAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Attributes_arrayAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var complexTypeAttribute: Attributes.InternalError {
        get {
            return moveFromCType(smoke_Attributes_complexTypeAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Attributes_complexTypeAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var byteBufferAttribute: Data {
        get {
            return moveFromCType(smoke_Attributes_byteBufferAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Attributes_byteBufferAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var instanceAttribute: AttributesInterface {
        get {
            return AttributesInterfacemoveFromCType(smoke_Attributes_instanceAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Attributes_instanceAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public var isBooleanAttribute: Bool {
        get {
            return moveFromCType(smoke_Attributes_booleanAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Attributes_booleanAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    public static var staticAttribute: String {
        get {
            return moveFromCType(smoke_Attributes_staticAttribute_get())
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Attributes_staticAttribute_set(c_newValue.ref))
        }
    }
    public static var staticReadonlyAttribute: Attributes.ExampleStruct {
        get {
            return moveFromCType(smoke_Attributes_staticReadonlyAttribute_get())
        }
    }
    let c_instance : _baseRef
    init(cAttributes: _baseRef) {
        guard cAttributes != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cAttributes
    }
    deinit {
        smoke_Attributes_release_handle(c_instance)
    }
    public enum InternalError : UInt32, CaseIterable {
        case errorNone
        case errorFatal = 999
    }
    public struct ExampleStruct {
        public var value: Double
        public init(value: Double) {
            self.value = value
        }
        internal init(cHandle: _baseRef) {
            value = moveFromCType(smoke_Attributes_ExampleStruct_value_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_value = moveToCType(value)
            return smoke_Attributes_ExampleStruct_create_handle(c_value.ref)
        }
    }
}
extension Attributes: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func AttributescopyFromCType(_ handle: _baseRef) -> Attributes {
    return Attributes(cAttributes: smoke_Attributes_copy_handle(handle))
}
internal func AttributesmoveFromCType(_ handle: _baseRef) -> Attributes {
    return Attributes(cAttributes: handle)
}
internal func AttributescopyFromCType(_ handle: _baseRef) -> Attributes? {
    guard handle != 0 else {
        return nil
    }
    return AttributesmoveFromCType(handle) as Attributes
}
internal func AttributesmoveFromCType(_ handle: _baseRef) -> Attributes? {
    guard handle != 0 else {
        return nil
    }
    return AttributesmoveFromCType(handle) as Attributes
}
internal func copyToCType(_ swiftClass: Attributes) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Attributes) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Attributes?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Attributes?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> Attributes.ExampleStruct {
    return Attributes.ExampleStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Attributes.ExampleStruct {
    defer {
        smoke_Attributes_ExampleStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Attributes.ExampleStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Attributes.ExampleStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Attributes_ExampleStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Attributes.ExampleStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Attributes_ExampleStruct_unwrap_optional_handle(handle)
    return Attributes.ExampleStruct(cHandle: unwrappedHandle) as Attributes.ExampleStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Attributes.ExampleStruct? {
    defer {
        smoke_Attributes_ExampleStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Attributes.ExampleStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Attributes_ExampleStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Attributes.ExampleStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Attributes_ExampleStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: Attributes.InternalError) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Attributes.InternalError) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Attributes.InternalError?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Attributes.InternalError?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Attributes.InternalError {
    return Attributes.InternalError(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Attributes.InternalError {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Attributes.InternalError? {
    guard handle != 0 else {
        return nil
    }
    return Attributes.InternalError(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Attributes.InternalError? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}