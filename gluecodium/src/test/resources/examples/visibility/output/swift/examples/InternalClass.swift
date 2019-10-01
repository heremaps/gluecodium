//
//
import Foundation
internal class InternalClass {
    let c_instance : _baseRef
    init(cInternalClass: _baseRef) {
        guard cInternalClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInternalClass
    }
    deinit {
        examples_InternalClass_release_handle(c_instance)
    }
    internal struct InternalStruct {
        internal var stringField: String
        internal init(stringField: String) {
            self.stringField = stringField
        }
        internal init(cHandle: _baseRef) {
            stringField = moveFromCType(examples_InternalClass_InternalStruct_stringField_get(cHandle))
        }
    }
    internal func internalMethod(input: InternalClass.InternalStruct) -> Void {
        let c_input = moveToCType(input)
        return moveFromCType(examples_InternalClass_internalMethod(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: InternalClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_InternalClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_InternalClass_release_handle)
        : RefHolder(handle_copy)
}
extension InternalClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func InternalClass_copyFromCType(_ handle: _baseRef) -> InternalClass {
    return InternalClass(cInternalClass: examples_InternalClass_copy_handle(handle))
}
internal func InternalClass_moveFromCType(_ handle: _baseRef) -> InternalClass {
    return InternalClass(cInternalClass: handle)
}
internal func InternalClass_copyFromCType(_ handle: _baseRef) -> InternalClass? {
    guard handle != 0 else {
        return nil
    }
    return InternalClass_moveFromCType(handle) as InternalClass
}
internal func InternalClass_moveFromCType(_ handle: _baseRef) -> InternalClass? {
    guard handle != 0 else {
        return nil
    }
    return InternalClass_moveFromCType(handle) as InternalClass
}
internal func copyToCType(_ swiftClass: InternalClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: InternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: InternalClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> InternalClass.InternalStruct {
    return InternalClass.InternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> InternalClass.InternalStruct {
    defer {
        examples_InternalClass_InternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InternalClass.InternalStruct) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(examples_InternalClass_InternalStruct_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: InternalClass.InternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_InternalClass_InternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> InternalClass.InternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = examples_InternalClass_InternalStruct_unwrap_optional_handle(handle)
    return InternalClass.InternalStruct(cHandle: unwrappedHandle) as InternalClass.InternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> InternalClass.InternalStruct? {
    defer {
        examples_InternalClass_InternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: InternalClass.InternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(examples_InternalClass_InternalStruct_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: InternalClass.InternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_InternalClass_InternalStruct_release_optional_handle)
}
