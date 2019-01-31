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
        internal init(cHandle: _baseRef) {
            value = moveFromCType(smoke_InstanceWithStruct_InnerStruct_value_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_value = moveToCType(value)
            return smoke_InstanceWithStruct_InnerStruct_create_handle(c_value.ref)
        }
    }
    public struct StructWithInstance {
        public var instance: SimpleInstantiable
        /// This is some very useful field.
        public var instanceWithComment: SimpleInstantiable
        public init(instance: SimpleInstantiable, instanceWithComment: SimpleInstantiable) {
            self.instance = instance
            self.instanceWithComment = instanceWithComment
        }
        internal init(cHandle: _baseRef) {
            instance = SimpleInstantiablemoveFromCType(smoke_InstanceWithStruct_StructWithInstance_instance_get(cHandle))
            instanceWithComment = SimpleInstantiablemoveFromCType(smoke_InstanceWithStruct_StructWithInstance_instanceWithComment_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_instance = moveToCType(instance)
            let c_instanceWithComment = moveToCType(instanceWithComment)
            return smoke_InstanceWithStruct_StructWithInstance_create_handle(c_instance.ref, c_instanceWithComment.ref)
        }
    }
    public func innerStructMethod(inputStruct: InstanceWithStruct.InnerStruct) -> InstanceWithStruct.InnerStruct {
        let c_inputStruct = moveToCType(inputStruct)
        return moveFromCType(smoke_InstanceWithStruct_innerStructMethod(self.c_instance, c_inputStruct.ref))
    }
    public func structWithInstanceMethod(input: InstanceWithStruct.StructWithInstance) -> InstanceWithStruct.StructWithInstance {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_InstanceWithStruct_structWithInstanceMethod(self.c_instance, c_input.ref))
    }
}
extension InstanceWithStruct: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InstanceWithStructcopyFromCType(_ handle: _baseRef) -> InstanceWithStruct {
    return InstanceWithStruct(cInstanceWithStruct: smoke_InstanceWithStruct_copy_handle(handle))
}
internal func InstanceWithStructmoveFromCType(_ handle: _baseRef) -> InstanceWithStruct {
    return InstanceWithStruct(cInstanceWithStruct: handle)
}
internal func InstanceWithStructcopyFromCType(_ handle: _baseRef) -> InstanceWithStruct? {
    guard handle != 0 else {
        return nil
    }
    return InstanceWithStructmoveFromCType(handle) as InstanceWithStruct
}
internal func InstanceWithStructmoveFromCType(_ handle: _baseRef) -> InstanceWithStruct? {
    guard handle != 0 else {
        return nil
    }
    return InstanceWithStructmoveFromCType(handle) as InstanceWithStruct
}
internal func copyToCType(_ swiftClass: InstanceWithStruct) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InstanceWithStruct) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InstanceWithStruct?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InstanceWithStruct?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> InstanceWithStruct.InnerStruct {
    return InstanceWithStruct.InnerStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> InstanceWithStruct.InnerStruct {
    defer {
        smoke_InstanceWithStruct_InnerStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InstanceWithStruct.InnerStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: InstanceWithStruct.InnerStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InstanceWithStruct_InnerStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> InstanceWithStruct.InnerStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_InstanceWithStruct_InnerStruct_unwrap_optional_handle(handle)
    return InstanceWithStruct.InnerStruct(cHandle: unwrappedHandle) as InstanceWithStruct.InnerStruct
}
internal func moveFromCType(_ handle: _baseRef) -> InstanceWithStruct.InnerStruct? {
    defer {
        smoke_InstanceWithStruct_InnerStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InstanceWithStruct.InnerStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_InstanceWithStruct_InnerStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: InstanceWithStruct.InnerStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InstanceWithStruct_InnerStruct_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> InstanceWithStruct.StructWithInstance {
    return InstanceWithStruct.StructWithInstance(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> InstanceWithStruct.StructWithInstance {
    defer {
        smoke_InstanceWithStruct_StructWithInstance_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InstanceWithStruct.StructWithInstance) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: InstanceWithStruct.StructWithInstance) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InstanceWithStruct_StructWithInstance_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> InstanceWithStruct.StructWithInstance? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_InstanceWithStruct_StructWithInstance_unwrap_optional_handle(handle)
    return InstanceWithStruct.StructWithInstance(cHandle: unwrappedHandle) as InstanceWithStruct.StructWithInstance
}
internal func moveFromCType(_ handle: _baseRef) -> InstanceWithStruct.StructWithInstance? {
    defer {
        smoke_InstanceWithStruct_StructWithInstance_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InstanceWithStruct.StructWithInstance?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_InstanceWithStruct_StructWithInstance_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: InstanceWithStruct.StructWithInstance?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_InstanceWithStruct_StructWithInstance_release_optional_handle)
}
