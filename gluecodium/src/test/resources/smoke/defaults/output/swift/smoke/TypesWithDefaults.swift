//

//

import Foundation

public struct TypesWithDefaults {
    public struct StructWithDefaults {

        public var intField: Int32

        public var uintField: UInt32

        public var floatField: Float

        public var doubleField: Double

        public var boolField: Bool

        public var stringField: String

        public init(intField: Int32 = 42, uintField: UInt32 = 4294967295, floatField: Float = 3.14, doubleField: Double = -1.4142, boolField: Bool = true, stringField: String = "\\Jonny \"Magic\" Smith\n") {
            self.intField = intField
            self.uintField = uintField
            self.floatField = floatField
            self.doubleField = doubleField
            self.boolField = boolField
            self.stringField = stringField
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_intField_get(cHandle))
            uintField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_uintField_get(cHandle))
            floatField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_floatField_get(cHandle))
            doubleField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_doubleField_get(cHandle))
            boolField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_boolField_get(cHandle))
            stringField = moveFromCType(smoke_TypesWithDefaults_StructWithDefaults_stringField_get(cHandle))
        }
    }


    public struct ImmutableStructWithDefaults {

        public let intField: Int32

        public let uintField: UInt32

        public let floatField: Float

        public let doubleField: Double

        public let boolField: Bool

        public let stringField: String

        public init(intField: Int32 = 42, uintField: UInt32, floatField: Float = 3.14, doubleField: Double = -1.4142, boolField: Bool, stringField: String = "\\Jonny \"Magic\" Smith\n") {
            self.intField = intField
            self.uintField = uintField
            self.floatField = floatField
            self.doubleField = doubleField
            self.boolField = boolField
            self.stringField = stringField
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_intField_get(cHandle))
            uintField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_uintField_get(cHandle))
            floatField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_floatField_get(cHandle))
            doubleField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_doubleField_get(cHandle))
            boolField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_boolField_get(cHandle))
            stringField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithDefaults_stringField_get(cHandle))
        }
    }


    public struct ImmutableStructWithCollections {

        public let nullableListField: [Int32]?

        public let emptyListField: [Int32]

        public let valuesListField: [Int32]

        public let nullableMapField: [Int32: String]?

        public let emptyMapField: [Int32: String]

        public let valuesMapField: [Int32: String]

        public let nullableSetField: Set<String>?

        public let emptySetField: Set<String>

        public let valuesSetField: Set<String>

        public init(nullableListField: [Int32]? = nil, emptyListField: [Int32] = [], valuesListField: [Int32] = [1, 2, 3], nullableMapField: [Int32: String]? = nil, emptyMapField: [Int32: String] = [:], valuesMapField: [Int32: String] = [9: "baz", 27: "bar"], nullableSetField: Set<String>? = nil, emptySetField: Set<String> = [], valuesSetField: Set<String> = ["bar", "baz"]) {
            self.nullableListField = nullableListField
            self.emptyListField = emptyListField
            self.valuesListField = valuesListField
            self.nullableMapField = nullableMapField
            self.emptyMapField = emptyMapField
            self.valuesMapField = valuesMapField
            self.nullableSetField = nullableSetField
            self.emptySetField = emptySetField
            self.valuesSetField = valuesSetField
        }
        internal init(cHandle: _baseRef) {
            nullableListField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithCollections_nullableListField_get(cHandle))
            emptyListField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithCollections_emptyListField_get(cHandle))
            valuesListField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithCollections_valuesListField_get(cHandle))
            nullableMapField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithCollections_nullableMapField_get(cHandle))
            emptyMapField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithCollections_emptyMapField_get(cHandle))
            valuesMapField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithCollections_valuesMapField_get(cHandle))
            nullableSetField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithCollections_nullableSetField_get(cHandle))
            emptySetField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithCollections_emptySetField_get(cHandle))
            valuesSetField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithCollections_valuesSetField_get(cHandle))
        }
    }


    public struct ImmutableStructWithFieldConstructorAndCollections {

        public let nullableListField: [Int32]?

        public let emptyListField: [Int32]

        public let valuesListField: [Int32]

        public let nullableMapField: [Int32: String]?

        public let emptyMapField: [Int32: String]

        public let valuesMapField: [Int32: String]

        public let nullableSetField: Set<String>?

        public let emptySetField: Set<String>

        public let valuesSetField: Set<String>

        public let someField: Int32

        public let anotherField: Int32


        public init(someField: Int32, anotherField: Int32) {
            self.someField = someField
            self.anotherField = anotherField
            self.nullableListField = nil
            self.emptyListField = []
            self.valuesListField = [1, 2, 3]
            self.nullableMapField = nil
            self.emptyMapField = [:]
            self.valuesMapField = [9: "baz", 27: "bar"]
            self.nullableSetField = nil
            self.emptySetField = []
            self.valuesSetField = ["bar", "baz"]
        }

        public init(nullableListField: [Int32]? = nil, emptyListField: [Int32] = [], valuesListField: [Int32] = [1, 2, 3], nullableMapField: [Int32: String]? = nil, emptyMapField: [Int32: String] = [:], valuesMapField: [Int32: String] = [9: "baz", 27: "bar"], nullableSetField: Set<String>? = nil, emptySetField: Set<String> = [], valuesSetField: Set<String> = ["bar", "baz"], someField: Int32 = 5, anotherField: Int32 = 7) {
            self.nullableListField = nullableListField
            self.emptyListField = emptyListField
            self.valuesListField = valuesListField
            self.nullableMapField = nullableMapField
            self.emptyMapField = emptyMapField
            self.valuesMapField = valuesMapField
            self.nullableSetField = nullableSetField
            self.emptySetField = emptySetField
            self.valuesSetField = valuesSetField
            self.someField = someField
            self.anotherField = anotherField
        }
        internal init(cHandle: _baseRef) {
            nullableListField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_nullableListField_get(cHandle))
            emptyListField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_emptyListField_get(cHandle))
            valuesListField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_valuesListField_get(cHandle))
            nullableMapField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_nullableMapField_get(cHandle))
            emptyMapField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_emptyMapField_get(cHandle))
            valuesMapField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_valuesMapField_get(cHandle))
            nullableSetField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_nullableSetField_get(cHandle))
            emptySetField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_emptySetField_get(cHandle))
            valuesSetField = foobar_moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_valuesSetField_get(cHandle))
            someField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_someField_get(cHandle))
            anotherField = moveFromCType(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_anotherField_get(cHandle))
        }
    }


}



internal func copyFromCType(_ handle: _baseRef) -> TypesWithDefaults.StructWithDefaults {
    return TypesWithDefaults.StructWithDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypesWithDefaults.StructWithDefaults {
    defer {
        smoke_TypesWithDefaults_StructWithDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: TypesWithDefaults.StructWithDefaults) -> RefHolder {
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_TypesWithDefaults_StructWithDefaults_create_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref))
}
internal func moveToCType(_ swiftType: TypesWithDefaults.StructWithDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_StructWithDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypesWithDefaults.StructWithDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypesWithDefaults_StructWithDefaults_unwrap_optional_handle(handle)
    return TypesWithDefaults.StructWithDefaults(cHandle: unwrappedHandle) as TypesWithDefaults.StructWithDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> TypesWithDefaults.StructWithDefaults? {
    defer {
        smoke_TypesWithDefaults_StructWithDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: TypesWithDefaults.StructWithDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_TypesWithDefaults_StructWithDefaults_create_optional_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref))
}
internal func moveToCType(_ swiftType: TypesWithDefaults.StructWithDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_StructWithDefaults_release_optional_handle)
}

internal func copyFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithDefaults {
    return TypesWithDefaults.ImmutableStructWithDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithDefaults {
    defer {
        smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithDefaults) -> RefHolder {
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref))
}
internal func moveToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypesWithDefaults_ImmutableStructWithDefaults_unwrap_optional_handle(handle)
    return TypesWithDefaults.ImmutableStructWithDefaults(cHandle: unwrappedHandle) as TypesWithDefaults.ImmutableStructWithDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithDefaults? {
    defer {
        smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_intField = moveToCType(swiftType.intField)
    let c_uintField = moveToCType(swiftType.uintField)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_boolField = moveToCType(swiftType.boolField)
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_optional_handle(c_intField.ref, c_uintField.ref, c_floatField.ref, c_doubleField.ref, c_boolField.ref, c_stringField.ref))
}
internal func moveToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_optional_handle)
}

internal func copyFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithCollections {
    return TypesWithDefaults.ImmutableStructWithCollections(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithCollections {
    defer {
        smoke_TypesWithDefaults_ImmutableStructWithCollections_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithCollections) -> RefHolder {
    let c_nullableListField = foobar_moveToCType(swiftType.nullableListField)
    let c_emptyListField = foobar_moveToCType(swiftType.emptyListField)
    let c_valuesListField = foobar_moveToCType(swiftType.valuesListField)
    let c_nullableMapField = foobar_moveToCType(swiftType.nullableMapField)
    let c_emptyMapField = foobar_moveToCType(swiftType.emptyMapField)
    let c_valuesMapField = foobar_moveToCType(swiftType.valuesMapField)
    let c_nullableSetField = foobar_moveToCType(swiftType.nullableSetField)
    let c_emptySetField = foobar_moveToCType(swiftType.emptySetField)
    let c_valuesSetField = foobar_moveToCType(swiftType.valuesSetField)
    return RefHolder(smoke_TypesWithDefaults_ImmutableStructWithCollections_create_handle(c_nullableListField.ref, c_emptyListField.ref, c_valuesListField.ref, c_nullableMapField.ref, c_emptyMapField.ref, c_valuesMapField.ref, c_nullableSetField.ref, c_emptySetField.ref, c_valuesSetField.ref))
}
internal func moveToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithCollections) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_ImmutableStructWithCollections_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithCollections? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypesWithDefaults_ImmutableStructWithCollections_unwrap_optional_handle(handle)
    return TypesWithDefaults.ImmutableStructWithCollections(cHandle: unwrappedHandle) as TypesWithDefaults.ImmutableStructWithCollections
}
internal func moveFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithCollections? {
    defer {
        smoke_TypesWithDefaults_ImmutableStructWithCollections_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithCollections?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_nullableListField = foobar_moveToCType(swiftType.nullableListField)
    let c_emptyListField = foobar_moveToCType(swiftType.emptyListField)
    let c_valuesListField = foobar_moveToCType(swiftType.valuesListField)
    let c_nullableMapField = foobar_moveToCType(swiftType.nullableMapField)
    let c_emptyMapField = foobar_moveToCType(swiftType.emptyMapField)
    let c_valuesMapField = foobar_moveToCType(swiftType.valuesMapField)
    let c_nullableSetField = foobar_moveToCType(swiftType.nullableSetField)
    let c_emptySetField = foobar_moveToCType(swiftType.emptySetField)
    let c_valuesSetField = foobar_moveToCType(swiftType.valuesSetField)
    return RefHolder(smoke_TypesWithDefaults_ImmutableStructWithCollections_create_optional_handle(c_nullableListField.ref, c_emptyListField.ref, c_valuesListField.ref, c_nullableMapField.ref, c_emptyMapField.ref, c_valuesMapField.ref, c_nullableSetField.ref, c_emptySetField.ref, c_valuesSetField.ref))
}
internal func moveToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithCollections?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_ImmutableStructWithCollections_release_optional_handle)
}

internal func copyFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections {
    return TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections {
    defer {
        smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_release_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections) -> RefHolder {
    let c_nullableListField = foobar_moveToCType(swiftType.nullableListField)
    let c_emptyListField = foobar_moveToCType(swiftType.emptyListField)
    let c_valuesListField = foobar_moveToCType(swiftType.valuesListField)
    let c_nullableMapField = foobar_moveToCType(swiftType.nullableMapField)
    let c_emptyMapField = foobar_moveToCType(swiftType.emptyMapField)
    let c_valuesMapField = foobar_moveToCType(swiftType.valuesMapField)
    let c_nullableSetField = foobar_moveToCType(swiftType.nullableSetField)
    let c_emptySetField = foobar_moveToCType(swiftType.emptySetField)
    let c_valuesSetField = foobar_moveToCType(swiftType.valuesSetField)
    let c_someField = moveToCType(swiftType.someField)
    let c_anotherField = moveToCType(swiftType.anotherField)
    return RefHolder(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_create_handle(c_nullableListField.ref, c_emptyListField.ref, c_valuesListField.ref, c_nullableMapField.ref, c_emptyMapField.ref, c_valuesMapField.ref, c_nullableSetField.ref, c_emptySetField.ref, c_valuesSetField.ref, c_someField.ref, c_anotherField.ref))
}
internal func moveToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_unwrap_optional_handle(handle)
    return TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections(cHandle: unwrappedHandle) as TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections
}
internal func moveFromCType(_ handle: _baseRef) -> TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections? {
    defer {
        smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}

internal func copyToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_nullableListField = foobar_moveToCType(swiftType.nullableListField)
    let c_emptyListField = foobar_moveToCType(swiftType.emptyListField)
    let c_valuesListField = foobar_moveToCType(swiftType.valuesListField)
    let c_nullableMapField = foobar_moveToCType(swiftType.nullableMapField)
    let c_emptyMapField = foobar_moveToCType(swiftType.emptyMapField)
    let c_valuesMapField = foobar_moveToCType(swiftType.valuesMapField)
    let c_nullableSetField = foobar_moveToCType(swiftType.nullableSetField)
    let c_emptySetField = foobar_moveToCType(swiftType.emptySetField)
    let c_valuesSetField = foobar_moveToCType(swiftType.valuesSetField)
    let c_someField = moveToCType(swiftType.someField)
    let c_anotherField = moveToCType(swiftType.anotherField)
    return RefHolder(smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_create_optional_handle(c_nullableListField.ref, c_emptyListField.ref, c_valuesListField.ref, c_nullableMapField.ref, c_emptyMapField.ref, c_valuesMapField.ref, c_nullableSetField.ref, c_emptySetField.ref, c_valuesSetField.ref, c_someField.ref, c_anotherField.ref))
}
internal func moveToCType(_ swiftType: TypesWithDefaults.ImmutableStructWithFieldConstructorAndCollections?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_release_optional_handle)
}



