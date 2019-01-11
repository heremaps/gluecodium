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
            return moveFromCType(smoke_Attributes_builtInTypeAttribute_get(c_instance))
        }
        set {
            return moveFromCType(smoke_Attributes_builtInTypeAttribute_set(c_instance, newValue))
        }
    }
    public var readonlyAttribute: Float {
        get {
            return moveFromCType(smoke_Attributes_readonlyAttribute_get(c_instance))
        }
    }
    public var structAttribute: Attributes.ExampleStruct {
        get {
            return moveFromCType(smoke_Attributes_structAttribute_get(c_instance))
        }
        set {
            let newValue_handle = newValue.convertToCType()
            defer {
                smoke_Attributes_ExampleStruct_release_handle(newValue_handle)
            }
            return moveFromCType(smoke_Attributes_structAttribute_set(c_instance, newValue_handle))
        }
    }
    public var arrayAttribute: CollectionOf<String> {
        get {
            return moveFromCType(smoke_Attributes_arrayAttribute_get(c_instance))
        }
        set {
            let newValue_handle = newValue.c_conversion()
            defer {
                newValue_handle.cleanup()
            }
            return moveFromCType(smoke_Attributes_arrayAttribute_set(c_instance, newValue_handle.c_type))
        }
    }
    public var complexTypeAttribute: Attributes.InternalError {
        get {
            return moveFromCType(smoke_Attributes_complexTypeAttribute_get(c_instance))
        }
        set {
            return moveFromCType(smoke_Attributes_complexTypeAttribute_set(c_instance, newValue.rawValue))
        }
    }
    public var byteBufferAttribute: Data {
        get {
            return moveFromCType(smoke_Attributes_byteBufferAttribute_get(c_instance))
        }
        set {
            let newValue_handle = byteArray_create_handle()
            defer {
                byteArray_release_handle(newValue_handle)
            }
            newValue.withUnsafeBytes { (newValue_ptr: UnsafePointer<UInt8>) in
                byteArray_assign(newValue_handle, newValue_ptr, newValue.count)
            }
            return moveFromCType(smoke_Attributes_byteBufferAttribute_set(c_instance, newValue_handle))
        }
    }
    public var instanceAttribute: AttributesInterface? {
        get {
            let cResult = smoke_Attributes_instanceAttribute_get(c_instance)
            if cResult == 0 { return nil }
            if let swift_pointer = smoke_AttributesInterface_get_swift_object_from_cache(cResult),
                    let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? AttributesInterface {
                return re_constructed
            }
            return _AttributesInterface(cAttributesInterface: cResult)
        }
        set {
            let newValue_handle = getRef(newValue)
            return moveFromCType(smoke_Attributes_instanceAttribute_set(c_instance, newValue_handle.ref))
        }
    }
    public var isBooleanAttribute: Bool {
        get {
            return moveFromCType(smoke_Attributes_booleanAttribute_get(c_instance))
        }
        set {
            return moveFromCType(smoke_Attributes_booleanAttribute_set(c_instance, newValue))
        }
    }
    public static var staticAttribute: String {
        get {
            return moveFromCType(smoke_Attributes_staticAttribute_get())
        }
        set {
            return moveFromCType(smoke_Attributes_staticAttribute_set(newValue))
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
    public enum InternalError : UInt32 {
        case errorNone
        case errorFatal = 999
    }
    public struct ExampleStruct {
        public var value: Double
        public init(value: Double) {
            self.value = value
        }
        internal init(cHandle: _baseRef) {
            value = smoke_Attributes_ExampleStruct_value_get(cHandle)
        }
        internal func convertToCType() -> _baseRef {
            let value_handle = value
            return smoke_Attributes_ExampleStruct_create_handle(value_handle)
        }
    }
}
extension Attributes: NativeBase {
    var c_handle: _baseRef { return c_instance }
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
internal func copyFromCType(_ cValue: UInt32) -> Attributes.InternalError {
    return Attributes.InternalError(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Attributes.InternalError {
    return copyFromCType(cValue)
}