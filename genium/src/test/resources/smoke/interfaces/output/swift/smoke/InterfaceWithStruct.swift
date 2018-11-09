//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InterfaceWithStruct?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        return RefHolder(instanceReference.c_handle)
    }
    var functions = smoke_InterfaceWithStruct_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_InterfaceWithStruct_innerStructMethod = {(swift_class_pointer, inputStruct) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! InterfaceWithStruct
        return get_pointer((swift_class.innerStructMethod(inputStruct: InnerStruct(cInnerStruct: inputStruct))!).convertToCType())
    }
    let proxy = smoke_InterfaceWithStruct_createProxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_InterfaceWithStruct_release) : RefHolder(proxy)
}

public protocol InterfaceWithStruct : AnyObject {

    func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct
}

internal class _InterfaceWithStruct: InterfaceWithStruct {

    let c_instance : _baseRef

    init?(cInterfaceWithStruct: _baseRef) {
        guard cInterfaceWithStruct != 0 else {
            return nil
        }
        c_instance = cInterfaceWithStruct
    }

    deinit {
        smoke_InterfaceWithStruct_release(c_instance)
    }
    public func innerStructMethod(inputStruct: InnerStruct) -> InnerStruct {
        let inputStruct_handle = inputStruct.convertToCType()
        defer {
            smoke_InterfaceWithStruct_InnerStruct_release(inputStruct_handle)
        }
        let cResult = smoke_InterfaceWithStruct_innerStructMethod(c_instance, inputStruct_handle)
        defer {
            smoke_InterfaceWithStruct_InnerStruct_release(cResult)
        }
        return InnerStruct(cInnerStruct: cResult)
    }

}

extension _InterfaceWithStruct: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

public struct InnerStruct {
    public var value: Int8

    public init(value: Int8) {
        self.value = value
    }

    internal init(cInnerStruct: _baseRef) {
        value = smoke_InterfaceWithStruct_InnerStruct_value_get(cInnerStruct)
    }

    internal func convertToCType() -> _baseRef {
        let value_handle = value
        return smoke_InterfaceWithStruct_InnerStruct_create(value_handle)
    }
}
