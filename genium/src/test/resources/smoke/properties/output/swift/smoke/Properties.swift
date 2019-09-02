//
//

import Foundation
internal func getRef(_ ref: Properties?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Properties_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Properties_release_handle)
        : RefHolder(handle_copy)
}
public class Properties {
    public var builtInTypeProperty: UInt32 {
        get {
            return moveFromCType(smoke_Properties_builtInTypeProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Properties_builtInTypeProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var readonlyProperty: Float {
        get {
            return moveFromCType(smoke_Properties_readonlyProperty_get(self.c_instance))
        }
    }
    public var structProperty: Properties.ExampleStruct {
        get {
            return moveFromCType(smoke_Properties_structProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Properties_structProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var arrayProperty: [String] {
        get {
            return moveFromCType(smoke_Properties_arrayProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Properties_arrayProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var complexTypeProperty: Properties.InternalError {
        get {
            return moveFromCType(smoke_Properties_complexTypeProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Properties_complexTypeProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var byteBufferProperty: Data {
        get {
            return moveFromCType(smoke_Properties_byteBufferProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Properties_byteBufferProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var instanceProperty: PropertiesInterface {
        get {
            return PropertiesInterfacemoveFromCType(smoke_Properties_instanceProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Properties_instanceProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var isBooleanProperty: Bool {
        get {
            return moveFromCType(smoke_Properties_booleanProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Properties_booleanProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public static var staticProperty: String {
        get {
            return moveFromCType(smoke_Properties_staticProperty_get())
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Properties_staticProperty_set(c_newValue.ref))
        }
    }
    public static var staticReadonlyProperty: Properties.ExampleStruct {
        get {
            return moveFromCType(smoke_Properties_staticReadonlyProperty_get())
        }
    }
    let c_instance : _baseRef
    init(cProperties: _baseRef) {
        guard cProperties != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cProperties
    }
    deinit {
        smoke_Properties_release_handle(c_instance)
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
            value = moveFromCType(smoke_Properties_ExampleStruct_value_get(cHandle))
        }
    }
}
extension Properties: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func PropertiescopyFromCType(_ handle: _baseRef) -> Properties {
    return Properties(cProperties: smoke_Properties_copy_handle(handle))
}
internal func PropertiesmoveFromCType(_ handle: _baseRef) -> Properties {
    return Properties(cProperties: handle)
}
internal func PropertiescopyFromCType(_ handle: _baseRef) -> Properties? {
    guard handle != 0 else {
        return nil
    }
    return PropertiesmoveFromCType(handle) as Properties
}
internal func PropertiesmoveFromCType(_ handle: _baseRef) -> Properties? {
    guard handle != 0 else {
        return nil
    }
    return PropertiesmoveFromCType(handle) as Properties
}
internal func copyToCType(_ swiftClass: Properties) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Properties) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Properties?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Properties?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> Properties.ExampleStruct {
    return Properties.ExampleStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Properties.ExampleStruct {
    defer {
        smoke_Properties_ExampleStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Properties.ExampleStruct) -> RefHolder {
    let c_value = moveToCType(swiftType.value)
    return RefHolder(smoke_Properties_ExampleStruct_create_handle(c_value.ref))
}
internal func moveToCType(_ swiftType: Properties.ExampleStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Properties_ExampleStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Properties.ExampleStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Properties_ExampleStruct_unwrap_optional_handle(handle)
    return Properties.ExampleStruct(cHandle: unwrappedHandle) as Properties.ExampleStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Properties.ExampleStruct? {
    defer {
        smoke_Properties_ExampleStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Properties.ExampleStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_value = moveToCType(swiftType.value)
    return RefHolder(smoke_Properties_ExampleStruct_create_optional_handle(c_value.ref))
}
internal func moveToCType(_ swiftType: Properties.ExampleStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Properties_ExampleStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: Properties.InternalError) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Properties.InternalError) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Properties.InternalError?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Properties.InternalError?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Properties.InternalError {
    return Properties.InternalError(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Properties.InternalError {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Properties.InternalError? {
    guard handle != 0 else {
        return nil
    }
    return Properties.InternalError(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Properties.InternalError? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
