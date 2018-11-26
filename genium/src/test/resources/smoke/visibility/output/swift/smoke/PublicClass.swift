//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: PublicClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_PublicClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_PublicClass_release_handle)
        : RefHolder(handle_copy)
}

public class PublicClass {
    internal typealias InternalStructTypeDef = PublicClass.InternalStruct
    internal typealias StringToInternalStructMap = [String: PublicClass.InternalStruct]
    internal var internalStructAttribute: PublicClass.InternalStruct {
        get {
            let cResult = smoke_PublicClass_internalStructAttribute_get(c_instance)
            defer {
                smoke_PublicClass_InternalStruct_release_handle(cResult)
            }
            return PublicClass.InternalStruct(cInternalStruct: cResult)
        }
        set {
            let newValue_handle = newValue.convertToCType()
            defer {
                smoke_PublicClass_InternalStruct_release_handle(newValue_handle)
            }
            return smoke_PublicClass_internalStructAttribute_set(c_instance, newValue_handle)
        }
    }

    let c_instance : _baseRef

    init?(cPublicClass: _baseRef) {
        guard cPublicClass != 0 else {
            return nil
        }
        c_instance = cPublicClass
    }

    deinit {
        smoke_PublicClass_release_handle(c_instance)
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
        internal init(cInternalStruct: _baseRef) {
            do {
                let stringField_handle = smoke_PublicClass_InternalStruct_stringField_get(cInternalStruct)
                defer {
                    std_string_release_handle(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let stringField_handle = stringField
            return smoke_PublicClass_InternalStruct_create_handle(stringField_handle)
        }
    }

    public struct PublicStruct {
        internal var internalField: PublicClass.InternalStruct
        public init(internalField: PublicClass.InternalStruct) {
            self.internalField = internalField
        }
        internal init(cPublicStruct: _baseRef) {
            do {
                let internalField_handle = smoke_PublicClass_PublicStruct_internalField_get(cPublicStruct)
                defer {
                    smoke_PublicClass_InternalStruct_release_handle(internalField_handle)
                }
                internalField = PublicClass.InternalStruct(cInternalStruct: internalField_handle)
            }
        }
        internal func convertToCType() -> _baseRef {
            let internalField_handle = internalField.convertToCType()
            defer {
                smoke_PublicClass_InternalStruct_release_handle(internalField_handle)
            }
            return smoke_PublicClass_PublicStruct_create_handle(internalField_handle)
        }
    }

    internal func internalMethod(input: PublicClass.InternalStruct) -> PublicClass.InternalStructTypeDef {
        let input_handle = input.convertToCType()
        defer {
            smoke_PublicClass_InternalStruct_release_handle(input_handle)
        }
        let cResult = smoke_PublicClass_internalMethod(c_instance, input_handle)
        defer {
            smoke_PublicClass_InternalStruct_release_handle(cResult)
        }
        return PublicClass.InternalStruct(cInternalStruct: cResult)
    }
}

extension PublicClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

func convertPublicClass_StringToInternalStructMapToCType(_ swiftDict: PublicClass.StringToInternalStructMap) -> _baseRef {
    let c_handle = smoke_PublicClass_StringToInternalStructMap_create_handle()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key.convertToCType()
        defer {
            std_string_release_handle(c_key)
        }
        let c_value = swift_value.convertToCType()
        defer {
            smoke_PublicClass_InternalStruct_release_handle(c_value)
        }
        smoke_PublicClass_StringToInternalStructMap_put(c_handle, c_key, c_value)
    }
    return c_handle
}

func convertPublicClass_StringToInternalStructMapFromCType(_ c_handle: _baseRef) -> PublicClass.StringToInternalStructMap {
    var swiftDict: PublicClass.StringToInternalStructMap = [:]
    let iterator_handle = smoke_PublicClass_StringToInternalStructMap_iterator(c_handle)
    while smoke_PublicClass_StringToInternalStructMap_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_PublicClass_StringToInternalStructMap_iterator_key(iterator_handle)
        defer {
            std_string_release_handle(c_key)
        }
        let swift_key = String(data: Data(bytes: std_string_data_get(c_key),
                                            count: Int(std_string_size_get(c_key))),
                                            encoding: .utf8)
        let c_value = smoke_PublicClass_StringToInternalStructMap_iterator_value(iterator_handle)
        defer {
            smoke_PublicClass_InternalStruct_release_handle(c_value)
        }
        let swift_value = PublicClass.InternalStruct(cInternalStruct: c_value)
        swiftDict[swift_key!] = swift_value
        smoke_PublicClass_StringToInternalStructMap_iterator_increment(iterator_handle)
    }
    smoke_PublicClass_StringToInternalStructMap_iterator_release_handle(iterator_handle)
    return swiftDict
}
