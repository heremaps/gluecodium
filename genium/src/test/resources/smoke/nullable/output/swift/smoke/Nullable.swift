//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Nullable?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Nullable_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Nullable_release_handle)
        : RefHolder(handle_copy)
}
public class Nullable {
    public typealias SomeMap = [Int64: String]
    public var stringAttribute: String? {
        get {
            let result_string_handle = smoke_Nullable_stringAttribute_get(c_instance)
            defer {
                std_string_release_handle(result_string_handle)
            }
            return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                     count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)!
        }
        set {
            return smoke_Nullable_stringAttribute_set(c_instance, newValue)
        }
    }
    public var boolAttribute: Bool? {
        get {
            return smoke_Nullable_boolAttribute_get(c_instance)
        }
        set {
            return smoke_Nullable_boolAttribute_set(c_instance, newValue)
        }
    }
    public var doubleAttribute: Double? {
        get {
            return smoke_Nullable_doubleAttribute_get(c_instance)
        }
        set {
            return smoke_Nullable_doubleAttribute_set(c_instance, newValue)
        }
    }
    public var intAttribute: Int64? {
        get {
            return smoke_Nullable_intAttribute_get(c_instance)
        }
        set {
            return smoke_Nullable_intAttribute_set(c_instance, newValue)
        }
    }
    public var structAttribute: Nullable.SomeStruct? {
        get {
            let cResult = smoke_Nullable_structAttribute_get(c_instance)
            defer {
                smoke_Nullable_SomeStruct_release_handle(cResult)
            }
            return Nullable.SomeStruct(cSomeStruct: cResult)
        }
        set {
            let newValue_handle = newValue.convertToCType()
            defer {
                smoke_Nullable_SomeStruct_release_handle(newValue_handle)
            }
            return smoke_Nullable_structAttribute_set(c_instance, newValue_handle)
        }
    }
    public var enumAttribute: Nullable.SomeEnum? {
        get {
            let cResult = smoke_Nullable_enumAttribute_get(c_instance)
            return Nullable.SomeEnum(rawValue: cResult)!
        }
        set {
            return smoke_Nullable_enumAttribute_set(c_instance, newValue.rawValue)
        }
    }
    public var arrayAttribute: CollectionOf<String>? {
        get {
            let result_handle = smoke_Nullable_arrayAttribute_get(c_instance)
            return StringList(result_handle)
        }
        set {
            let newValue_handle = newValue.c_conversion()
            defer {
                newValue_handle.cleanup()
            }
            return smoke_Nullable_arrayAttribute_set(c_instance, newValue_handle.c_type)
        }
    }
    public var inlineArrayAttribute: CollectionOf<String>? {
        get {
            let result_handle = smoke_Nullable_inlineArrayAttribute_get(c_instance)
            return StringList(result_handle)
        }
        set {
            let newValue_handle = newValue.c_conversion()
            defer {
                newValue_handle.cleanup()
            }
            return smoke_Nullable_inlineArrayAttribute_set(c_instance, newValue_handle.c_type)
        }
    }
    public var mapAttribute: Nullable.SomeMap? {
        get {
            let result_handle = smoke_Nullable_mapAttribute_get(c_instance)
            defer {
                smoke_Nullable_SomeMap_release_handle(result_handle)
            }
            return convertNullable_SomeMapFromCType(result_handle)
        }
        set {
            let newValue_handle = convertNullable_SomeMapToCType(newValue)
            defer {
                smoke_Nullable_SomeMap_release_handle(newValue_handle)
            }
            return smoke_Nullable_mapAttribute_set(c_instance, newValue_handle)
        }
    }
    let c_instance : _baseRef
    init?(cNullable: _baseRef) {
        guard cNullable != 0 else {
            return nil
        }
        c_instance = cNullable
    }
    deinit {
        smoke_Nullable_release_handle(c_instance)
    }
    public enum SomeEnum : UInt32 {
        case on
        case off
    }
    public struct SomeStruct {
        public var stringField: String
        public init(stringField: String) {
            self.stringField = stringField
        }
        internal init(cSomeStruct: _baseRef) {
            do {
                let stringField_handle = smoke_Nullable_SomeStruct_stringField_get(cSomeStruct)
                defer {
                    std_string_release_handle(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let stringField_handle = stringField
            return smoke_Nullable_SomeStruct_create_handle(stringField_handle)
        }
    }
    public struct NullableStruct {
        public var stringField: String?
        public var boolField: Bool?
        public var doubleField: Double?
        public var intField: Int64?
        public var structField: Nullable.SomeStruct?
        public var enumField: Nullable.SomeEnum?
        public var arrayField: CollectionOf<String>?
        public var inlineArrayField: CollectionOf<String>?
        public var mapField: Nullable.SomeMap?
        public init(stringField: String?, boolField: Bool?, doubleField: Double?, intField: Int64?, structField: Nullable.SomeStruct?, enumField: Nullable.SomeEnum?, arrayField: CollectionOf<String>?, inlineArrayField: CollectionOf<String>?, mapField: Nullable.SomeMap?) {
            self.stringField = stringField
            self.boolField = boolField
            self.doubleField = doubleField
            self.intField = intField
            self.structField = structField
            self.enumField = enumField
            self.arrayField = arrayField
            self.inlineArrayField = inlineArrayField
            self.mapField = mapField
        }
        internal init(cNullableStruct: _baseRef) {
            do {
                let stringField_handle = smoke_Nullable_NullableStruct_stringField_get(cNullableStruct)
                defer {
                    std_string_release_handle(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
            boolField = smoke_Nullable_NullableStruct_boolField_get(cNullableStruct)
            doubleField = smoke_Nullable_NullableStruct_doubleField_get(cNullableStruct)
            intField = smoke_Nullable_NullableStruct_intField_get(cNullableStruct)
            do {
                let structField_handle = smoke_Nullable_NullableStruct_structField_get(cNullableStruct)
                defer {
                    smoke_Nullable_SomeStruct_release_handle(structField_handle)
                }
                structField = Nullable.SomeStruct(cSomeStruct: structField_handle)
            }
            enumField = Nullable.SomeEnum.init(rawValue: smoke_Nullable_NullableStruct_enumField_get(cNullableStruct))!
            arrayField = StringList(smoke_Nullable_NullableStruct_arrayField_get(cNullableStruct))
            inlineArrayField = StringList(smoke_Nullable_NullableStruct_inlineArrayField_get(cNullableStruct))
            do {
                let mapField_handle = smoke_Nullable_NullableStruct_mapField_get(cNullableStruct)
                defer {
                    smoke_Nullable_SomeMap_release_handle(mapField_handle)
                }
                mapField = convertNullable_SomeMapFromCType(mapField_handle)
            }
        }
        internal func convertToCType() -> _baseRef {
            let stringField_handle = stringField
            let boolField_handle = boolField
            let doubleField_handle = doubleField
            let intField_handle = intField
            let structField_handle = structField.convertToCType()
            defer {
                smoke_Nullable_SomeStruct_release_handle(structField_handle)
            }
            let enumField_handle = enumField.rawValue
            let arrayField_conversion = arrayField.c_conversion()
            defer {
              arrayField_conversion.cleanup()
            }
            let arrayField_handle = arrayField_conversion.c_type
            let inlineArrayField_conversion = inlineArrayField.c_conversion()
            defer {
              inlineArrayField_conversion.cleanup()
            }
            let inlineArrayField_handle = inlineArrayField_conversion.c_type
            let mapField_handle = convertNullable_SomeMapToCType(mapField)
            defer {
              smoke_Nullable_SomeMap_release_handle(mapField_handle)
            }
            return smoke_Nullable_NullableStruct_create_handle(stringField_handle, boolField_handle, doubleField_handle, intField_handle, structField_handle, enumField_handle, arrayField_handle, inlineArrayField_handle, mapField_handle)
        }
    }
    public func methodWithString(input: String?) -> String? {
        let result_string_handle = smoke_Nullable_methodWithString(c_instance, input)
        defer {
            std_string_release_handle(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)!
    }
    public func methodWithBoolean(input: Bool?) -> Bool? {
        return smoke_Nullable_methodWithBoolean(c_instance, input)
    }
    public func methodWithDouble(input: Double?) -> Double? {
        return smoke_Nullable_methodWithDouble(c_instance, input)
    }
    public func methodWithInt(input: Int64?) -> Int64? {
        return smoke_Nullable_methodWithInt(c_instance, input)
    }
    public func methodWithSomeStruct(input: Nullable.SomeStruct?) -> Nullable.SomeStruct? {
        let input_handle = input.convertToCType()
        defer {
            smoke_Nullable_SomeStruct_release_handle(input_handle)
        }
        let cResult = smoke_Nullable_methodWithSomeStruct(c_instance, input_handle)
        defer {
            smoke_Nullable_SomeStruct_release_handle(cResult)
        }
        return Nullable.SomeStruct(cSomeStruct: cResult)
    }
    public func methodWithSomeEnum(input: Nullable.SomeEnum?) -> Nullable.SomeEnum? {
        let cResult = smoke_Nullable_methodWithSomeEnum(c_instance, input.rawValue)
        return Nullable.SomeEnum(rawValue: cResult)!
    }
    public func methodWithSomeArray<Tinput: Collection>(input: Tinput) -> CollectionOf<String>? where Tinput.Element == String {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        let result_handle = smoke_Nullable_methodWithSomeArray(c_instance, input_handle.c_type)
        return StringList(result_handle)
    }
    public func methodWithInlineArray<Tinput: Collection>(input: Tinput) -> CollectionOf<String>? where Tinput.Element == String {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        let result_handle = smoke_Nullable_methodWithInlineArray(c_instance, input_handle.c_type)
        return StringList(result_handle)
    }
    public func methodWithSomeMap(input: Nullable.SomeMap?) -> Nullable.SomeMap? {
        let input_handle = convertNullable_SomeMapToCType(input)
        defer {
            smoke_Nullable_SomeMap_release_handle(input_handle)
        }
        let result_handle = smoke_Nullable_methodWithSomeMap(c_instance, input_handle)
        defer {
            smoke_Nullable_SomeMap_release_handle(result_handle)
        }
        return convertNullable_SomeMapFromCType(result_handle)
    }
}
extension Nullable: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
func convertNullable_SomeMapToCType(_ swiftDict: Nullable.SomeMap) -> _baseRef {
    let c_handle = smoke_Nullable_SomeMap_create_handle()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            std_string_release_handle(c_value)
        }
        smoke_Nullable_SomeMap_put(c_handle, c_key, c_value)
    }
    return c_handle
}
func convertNullable_SomeMapFromCType(_ c_handle: _baseRef) -> Nullable.SomeMap {
    var swiftDict: Nullable.SomeMap = [:]
    let iterator_handle = smoke_Nullable_SomeMap_iterator(c_handle)
    while smoke_Nullable_SomeMap_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = smoke_Nullable_SomeMap_iterator_key(iterator_handle)
        let swift_key = c_key
        let c_value = smoke_Nullable_SomeMap_iterator_value(iterator_handle)
        defer {
            std_string_release_handle(c_value)
        }
        let swift_value = String(data: Data(bytes: std_string_data_get(c_value),
                                            count: Int(std_string_size_get(c_value))),
                                            encoding: .utf8)
        swiftDict[swift_key] = swift_value
        smoke_Nullable_SomeMap_iterator_increment(iterator_handle)
    }
    smoke_Nullable_SomeMap_iterator_release_handle(iterator_handle)
    return swiftDict
}