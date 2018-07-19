//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: AttributesInterface?) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }
    var functions = smoke_AttributesInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    let proxy = smoke_AttributesInterface_createProxy(functions)
    return RefHolder(ref: proxy, release: smoke_AttributesInterface_release)
}

public protocol AttributesInterface : AnyObject {

    var structAttribute: ExampleStruct { get set }
}

internal class _AttributesInterface: AttributesInterface {

    var structAttribute: ExampleStruct {
        get {
            let cResult = smoke_AttributesInterface_structAttribute_get(c_instance)
            defer {
                smoke_AttributesInterface_ExampleStruct_release(cResult)
            }
            return ExampleStruct(cExampleStruct: cResult)!
        }
        set {
            let newValue_handle = newValue.convertToCType()
            defer {
                smoke_AttributesInterface_ExampleStruct_release(newValue_handle)
            }
            return smoke_AttributesInterface_structAttribute_set(c_instance, newValue_handle)
        }
    }
    let c_instance : _baseRef

    init?(cAttributesInterface: _baseRef) {
        guard cAttributesInterface != 0 else {
            return nil
        }
        c_instance = cAttributesInterface
    }

    deinit {
        smoke_AttributesInterface_release(c_instance)
    }
}

extension _AttributesInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

public struct ExampleStruct {
    public var value: Double

    public init(value: Double) {
        self.value = value
    }

    internal init?(cExampleStruct: _baseRef) {
        value = smoke_AttributesInterface_ExampleStruct_value_get(cExampleStruct)
    }

    internal func convertToCType() -> _baseRef {
        let result = smoke_AttributesInterface_ExampleStruct_create()
        fillFunction(result)
        return result
    }

    internal func fillFunction(_ cExampleStruct: _baseRef) -> Void {
        smoke_AttributesInterface_ExampleStruct_value_set(cExampleStruct, value)
    }
}
