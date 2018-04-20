//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: InstanceWithStruct?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class InstanceWithStruct {
    let c_instance : _baseRef

    public init?(cInstanceWithStruct: _baseRef) {
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

        internal init?(cInnerStruct: _baseRef) {
            value = smoke_InstanceWithStruct_InnerStruct_value_get(cInnerStruct)
        }

        internal func convertToCType() -> _baseRef {
            let result = smoke_InstanceWithStruct_InnerStruct_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cInnerStruct: _baseRef) -> Void {
            smoke_InstanceWithStruct_InnerStruct_value_set(cInnerStruct, value)
        }
    }

    public struct StructWithInstance {
        public var instance: SimpleInstantiableOne?
        public var instanceNotNull: SimpleInstantiableOne
        /**
         This is some very useful field.
         */
        public var instanceNotNullWithComment: SimpleInstantiableOne

        public init(instance: SimpleInstantiableOne?, instanceNotNull: SimpleInstantiableOne, instanceNotNullWithComment: SimpleInstantiableOne) {
            self.instance = instance
            self.instanceNotNull = instanceNotNull
            self.instanceNotNullWithComment = instanceNotNullWithComment
        }

        internal init?(cStructWithInstance: _baseRef) {
            do {
                instance = SimpleInstantiableOne(cSimpleInstantiableOne: smoke_InstanceWithStruct_StructWithInstance_instance_get(cStructWithInstance))
            }
            do {
                guard let instanceNotNull_unwrapped = SimpleInstantiableOne(cSimpleInstantiableOne: smoke_InstanceWithStruct_StructWithInstance_instanceNotNull_get(cStructWithInstance))
            else {
                return nil
            }
            instanceNotNull = instanceNotNull_unwrapped
            }
            do {
                guard let instanceNotNullWithComment_unwrapped = SimpleInstantiableOne(cSimpleInstantiableOne: smoke_InstanceWithStruct_StructWithInstance_instanceNotNullWithComment_get(cStructWithInstance))
            else {
                return nil
            }
            instanceNotNullWithComment = instanceNotNullWithComment_unwrapped
            }
        }

        internal func convertToCType() -> _baseRef {
            let result = smoke_InstanceWithStruct_StructWithInstance_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cStructWithInstance: _baseRef) -> Void {
            smoke_InstanceWithStruct_StructWithInstance_instance_set(cStructWithInstance, getRef(instance).ref)
            smoke_InstanceWithStruct_StructWithInstance_instanceNotNull_set(cStructWithInstance, getRef(instanceNotNull).ref)
            smoke_InstanceWithStruct_StructWithInstance_instanceNotNullWithComment_set(cStructWithInstance, getRef(instanceNotNullWithComment).ref)
        }
    }

    public func innerStructMethod(inputStruct: InstanceWithStruct.InnerStruct) -> InstanceWithStruct.InnerStruct? {
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

    public func structWithInstanceMethod(input: InstanceWithStruct.StructWithInstance) -> InstanceWithStruct.StructWithInstance? {
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
