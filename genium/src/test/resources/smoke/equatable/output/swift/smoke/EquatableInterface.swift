//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: EquatableInterface?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_EquatableInterface_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_EquatableInterface_release_handle)
        : RefHolder(handle_copy)
}
public class EquatableInterface {
    let c_instance : _baseRef
    init(cEquatableInterface: _baseRef) {
        guard cEquatableInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEquatableInterface
    }
    deinit {
        smoke_EquatableInterface_release_handle(c_instance)
    }
    public struct EquatableStruct: Equatable {
        public var intField: Int32
        public var stringField: String
        public init(intField: Int32, stringField: String) {
            self.intField = intField
            self.stringField = stringField
        }
        internal init(cHandle: _baseRef) {
            intField = smoke_EquatableInterface_EquatableStruct_intField_get(cHandle)
            do {
                let stringField_handle = smoke_EquatableInterface_EquatableStruct_stringField_get(cHandle)
                defer {
                    std_string_release_handle(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let intField_handle = intField
            let stringField_handle = stringField
            return smoke_EquatableInterface_EquatableStruct_create_handle(intField_handle, stringField_handle)
        }
    }
}
extension EquatableInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func copyFromCType(_ handle: _baseRef) -> EquatableInterface.EquatableStruct {
    return EquatableInterface.EquatableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableInterface.EquatableStruct {
    defer {
        smoke_EquatableInterface_EquatableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}