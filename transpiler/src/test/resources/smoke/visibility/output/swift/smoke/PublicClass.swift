//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: PublicClass?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}

public class PublicClass {
    internal typealias InternalStructTypeDef = PublicClass.InternalStruct
    internal typealias StringToInternalStructMap = [String: PublicClass.InternalStruct]
    internal var internalStructAttribute: PublicClass.InternalStruct {
        get {
            let cResult = smoke_PublicClass_internalStructAttribute_get(c_instance)
            defer {
                smoke_PublicClass_InternalStruct_release(cResult)
            }
            return PublicClass.InternalStruct(cInternalStruct: cResult)!
        }
        set {
            let newValueHandle = newValue.convertToCType()
            defer {
                smoke_PublicClass_InternalStruct_release(newValueHandle)
            }
            return smoke_PublicClass_internalStructAttribute_set(c_instance, newValueHandle)
        }
    }

    let c_instance : _baseRef

    public init?(cPublicClass: _baseRef) {
        guard cPublicClass != 0 else {
            return nil
        }
        c_instance = cPublicClass
    }

    deinit {
        smoke_PublicClass_release(c_instance)
    }

    internal enum InternalEnum : UInt32 {
        case foo
        case bar
    }

    internal struct InternalStruct {
        public var stringField: String
        public init(stringField: String) {
            self.stringField = stringField
        }
        internal init?(cInternalStruct: _baseRef) {
            do {
                let stringFieldHandle = smoke_PublicClass_InternalStruct_stringField_get(cInternalStruct)
                stringField = String(cString:std_string_data_get(stringFieldHandle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_PublicClass_InternalStruct_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cInternalStruct: _baseRef) -> Void {
            smoke_PublicClass_InternalStruct_stringField_set(cInternalStruct, stringField)
        }
    }

    public struct PublicStruct {
        internal var internalField: PublicClass.InternalStruct
        public init(internalField: PublicClass.InternalStruct) {
            self.internalField = internalField
        }
        internal init?(cPublicStruct: _baseRef) {
            do {
                guard
                    let internalFieldUnwrapped = PublicClass.InternalStruct(cInternalStruct: smoke_PublicClass_PublicStruct_internalField_get(cPublicStruct))
                else {
                    return nil
                }
                internalField = internalFieldUnwrapped
            }
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_PublicClass_PublicStruct_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cPublicStruct: _baseRef) -> Void {
            let internalFieldHandle = smoke_PublicClass_PublicStruct_internalField_get(cPublicStruct)
            internalField.fillFunction(internalFieldHandle)
        }
    }

    internal func internalMethod(input: PublicClass.InternalStruct) -> PublicClass.InternalStructTypeDef? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_PublicClass_InternalStruct_release(inputHandle)
        }
        let cResult = smoke_PublicClass_internalMethod(c_instance, inputHandle)
        defer {
            smoke_PublicClass_InternalStruct_release(cResult)
        }
        return PublicClass.InternalStruct(cInternalStruct: cResult)
    }
}

extension PublicClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

func convertPublicClass_StringToInternalStructMapToCType(_ swiftDict: PublicClass.StringToInternalStructMap) -> _baseRef {
    let cHandle = smoke_PublicClass_StringToInternalStructMap_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release(c_key)
        }
        let c_value = swift_value.convertToCType()
        defer {
            smoke_PublicClass_InternalStruct_release(c_value)
        }
        smoke_PublicClass_StringToInternalStructMap_put(cHandle, c_key, c_value)
    }
    return cHandle
}

func convertPublicClass_StringToInternalStructMapFromCType(_ cHandle: _baseRef) -> PublicClass.StringToInternalStructMap {
    var swiftDict: PublicClass.StringToInternalStructMap = [:]
    let iteratorHandle = smoke_PublicClass_StringToInternalStructMap_iterator(cHandle)
    while smoke_PublicClass_StringToInternalStructMap_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = smoke_PublicClass_StringToInternalStructMap_iterator_key(iteratorHandle)
        defer {
            std_string_release(c_key)
        }
        let swift_key = String(data: Data(bytes: std_string_data_get(c_key),
                                            count: Int(std_string_size_get(c_key))),
                                            encoding: .utf8)
        let c_value = smoke_PublicClass_StringToInternalStructMap_iterator_value(iteratorHandle)
        defer {
            smoke_PublicClass_InternalStruct_release(c_value)
        }
        let swift_value = PublicClass.InternalStruct(cInternalStruct: c_value)
        swiftDict[swift_key!] = swift_value
        smoke_PublicClass_StringToInternalStructMap_iterator_increment(iteratorHandle)
    }
    smoke_PublicClass_StringToInternalStructMap_iterator_release(iteratorHandle)
    return swiftDict
}
