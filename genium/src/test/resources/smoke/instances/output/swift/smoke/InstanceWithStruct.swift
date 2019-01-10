//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InstanceWithStruct?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_InstanceWithStruct_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_InstanceWithStruct_release_handle)
        : RefHolder(handle_copy)
}
public class InstanceWithStruct {
    let c_instance : _baseRef

    init(cInstanceWithStruct: _baseRef) {
        guard cInstanceWithStruct != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInstanceWithStruct
    }

    deinit {
        smoke_InstanceWithStruct_release_handle(c_instance)
    }
    public struct InnerStruct {
        public var value: Int8

        public init(value: Int8) {
            self.value = value
        }

        internal init(cInnerStruct: _baseRef) {
            value = smoke_InstanceWithStruct_InnerStruct_value_get(cInnerStruct)
        }

        internal func convertToCType() -> _baseRef {
            let value_handle = value
            return smoke_InstanceWithStruct_InnerStruct_create_handle(value_handle)
        }
    }

    public struct StructWithInstance {
        public var instance: SimpleInstantiable?
        public var instanceNotNull: SimpleInstantiable
        /// This is some very useful field.
        public var instanceNotNullWithComment: SimpleInstantiable

        public init(instance: SimpleInstantiable?, instanceNotNull: SimpleInstantiable, instanceNotNullWithComment: SimpleInstantiable) {
            self.instance = instance
            self.instanceNotNull = instanceNotNull
            self.instanceNotNullWithComment = instanceNotNullWithComment
        }

        internal init(cStructWithInstance: _baseRef) {
            do {
                let instance_handle = smoke_InstanceWithStruct_StructWithInstance_instance_get(cStructWithInstance)
                instance = instance_handle != 0 ? SimpleInstantiable(cSimpleInstantiable: instance_handle) : nil
            }
            do {
                let instanceNotNull_handle = smoke_InstanceWithStruct_StructWithInstance_instanceNotNull_get(cStructWithInstance)
                instanceNotNull = SimpleInstantiable(cSimpleInstantiable: instanceNotNull_handle)
            }
            do {
                let instanceNotNullWithComment_handle = smoke_InstanceWithStruct_StructWithInstance_instanceNotNullWithComment_get(cStructWithInstance)
                instanceNotNullWithComment = SimpleInstantiable(cSimpleInstantiable: instanceNotNullWithComment_handle)
            }
        }

        internal func convertToCType() -> _baseRef {
            let instance_handle = getRef(instance).ref
            let instanceNotNull_handle = getRef(instanceNotNull).ref
            let instanceNotNullWithComment_handle = getRef(instanceNotNullWithComment).ref
            return smoke_InstanceWithStruct_StructWithInstance_create_handle(instance_handle, instanceNotNull_handle, instanceNotNullWithComment_handle)
        }
    }

    public func innerStructMethod(inputStruct: InstanceWithStruct.InnerStruct) -> InstanceWithStruct.InnerStruct {
        let inputStruct_handle = inputStruct.convertToCType()
        defer {
            smoke_InstanceWithStruct_InnerStruct_release_handle(inputStruct_handle)
        }
        let cResult = smoke_InstanceWithStruct_innerStructMethod(c_instance, inputStruct_handle)
        defer {
            smoke_InstanceWithStruct_InnerStruct_release_handle(cResult)
        }
        return InstanceWithStruct.InnerStruct(cInnerStruct: cResult)
    }

    public func structWithInstanceMethod(input: InstanceWithStruct.StructWithInstance) -> InstanceWithStruct.StructWithInstance {
        let input_handle = input.convertToCType()
        defer {
            smoke_InstanceWithStruct_StructWithInstance_release_handle(input_handle)
        }
        let cResult = smoke_InstanceWithStruct_structWithInstanceMethod(c_instance, input_handle)
        defer {
            smoke_InstanceWithStruct_StructWithInstance_release_handle(cResult)
        }
        return InstanceWithStruct.StructWithInstance(cStructWithInstance: cResult)
    }

}

extension InstanceWithStruct: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
