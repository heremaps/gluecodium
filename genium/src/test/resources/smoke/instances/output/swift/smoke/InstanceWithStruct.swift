//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: InstanceWithStruct?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class InstanceWithStruct {
    let c_instance : _baseRef

    init?(cInstanceWithStruct: _baseRef) {
        guard cInstanceWithStruct != 0 else {
            return nil
        }
        c_instance = cInstanceWithStruct
    }

    deinit {
        smoke_InstanceWithStruct_release(c_instance)
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
            return smoke_InstanceWithStruct_InnerStruct_create(value_handle)
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
                instance = SimpleInstantiable(cSimpleInstantiable: smoke_InstanceWithStruct_StructWithInstance_instance_get(cStructWithInstance))
            }
            do {
                guard let instanceNotNull_unwrapped = SimpleInstantiable(cSimpleInstantiable: smoke_InstanceWithStruct_StructWithInstance_instanceNotNull_get(cStructWithInstance))
            else {
                fatalError("Nullptr value for field 'StructWithInstance.instanceNotNull' is not supported")
            }
            instanceNotNull = instanceNotNull_unwrapped
            }
            do {
                guard let instanceNotNullWithComment_unwrapped = SimpleInstantiable(cSimpleInstantiable: smoke_InstanceWithStruct_StructWithInstance_instanceNotNullWithComment_get(cStructWithInstance))
            else {
                fatalError("Nullptr value for field 'StructWithInstance.instanceNotNullWithComment' is not supported")
            }
            instanceNotNullWithComment = instanceNotNullWithComment_unwrapped
            }
        }

        internal func convertToCType() -> _baseRef {
            let instance_handle = getRef(instance).ref
            let instanceNotNull_handle = getRef(instanceNotNull).ref
            let instanceNotNullWithComment_handle = getRef(instanceNotNullWithComment).ref
            return smoke_InstanceWithStruct_StructWithInstance_create(instance_handle, instanceNotNull_handle, instanceNotNullWithComment_handle)
        }
    }

    public func innerStructMethod(inputStruct: InstanceWithStruct.InnerStruct) -> InstanceWithStruct.InnerStruct {
        let inputStruct_handle = inputStruct.convertToCType()
        defer {
            smoke_InstanceWithStruct_InnerStruct_release(inputStruct_handle)
        }
        let cResult = smoke_InstanceWithStruct_innerStructMethod(c_instance, inputStruct_handle)
        defer {
            smoke_InstanceWithStruct_InnerStruct_release(cResult)
        }
        return InstanceWithStruct.InnerStruct(cInnerStruct: cResult)
    }

    public func structWithInstanceMethod(input: InstanceWithStruct.StructWithInstance) -> InstanceWithStruct.StructWithInstance {
        let input_handle = input.convertToCType()
        defer {
            smoke_InstanceWithStruct_StructWithInstance_release(input_handle)
        }
        let cResult = smoke_InstanceWithStruct_structWithInstanceMethod(c_instance, input_handle)
        defer {
            smoke_InstanceWithStruct_StructWithInstance_release(cResult)
        }
        return InstanceWithStruct.StructWithInstance(cStructWithInstance: cResult)
    }

}

extension InstanceWithStruct: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
