//
//
import Foundation
public struct TypeCollection {
    public typealias PointTypedef = TypeCollection.Point
    public struct Point {
        public var x: Double
        public var y: Double
        public init(x: Double, y: Double) {
            self.x = x
            self.y = y
        }
        internal init(cHandle: _baseRef) {
            x = moveFromCType(smoke_TypeCollection_Point_x_get(cHandle))
            y = moveFromCType(smoke_TypeCollection_Point_y_get(cHandle))
        }
    }
    public struct Line {
        public var a: TypeCollection.Point
        public var b: TypeCollection.Point
        public init(a: TypeCollection.Point, b: TypeCollection.Point) {
            self.a = a
            self.b = b
        }
        internal init(cHandle: _baseRef) {
            a = moveFromCType(smoke_TypeCollection_Line_a_get(cHandle))
            b = moveFromCType(smoke_TypeCollection_Line_b_get(cHandle))
        }
    }
    public struct AllTypesStruct {
        public var int8Field: Int8
        public var uint8Field: UInt8
        public var int16Field: Int16
        public var uint16Field: UInt16
        public var int32Field: Int32
        public var uint32Field: UInt32
        public var int64Field: Int64
        public var uint64Field: UInt64
        public var floatField: Float
        public var doubleField: Double
        public var stringField: String
        public var booleanField: Bool
        public var bytesField: Data
        public var pointField: TypeCollection.Point
        public init(int8Field: Int8, uint8Field: UInt8, int16Field: Int16, uint16Field: UInt16, int32Field: Int32, uint32Field: UInt32, int64Field: Int64, uint64Field: UInt64, floatField: Float, doubleField: Double, stringField: String, booleanField: Bool, bytesField: Data, pointField: TypeCollection.Point) {
            self.int8Field = int8Field
            self.uint8Field = uint8Field
            self.int16Field = int16Field
            self.uint16Field = uint16Field
            self.int32Field = int32Field
            self.uint32Field = uint32Field
            self.int64Field = int64Field
            self.uint64Field = uint64Field
            self.floatField = floatField
            self.doubleField = doubleField
            self.stringField = stringField
            self.booleanField = booleanField
            self.bytesField = bytesField
            self.pointField = pointField
        }
        internal init(cHandle: _baseRef) {
            int8Field = moveFromCType(smoke_TypeCollection_AllTypesStruct_int8Field_get(cHandle))
            uint8Field = moveFromCType(smoke_TypeCollection_AllTypesStruct_uint8Field_get(cHandle))
            int16Field = moveFromCType(smoke_TypeCollection_AllTypesStruct_int16Field_get(cHandle))
            uint16Field = moveFromCType(smoke_TypeCollection_AllTypesStruct_uint16Field_get(cHandle))
            int32Field = moveFromCType(smoke_TypeCollection_AllTypesStruct_int32Field_get(cHandle))
            uint32Field = moveFromCType(smoke_TypeCollection_AllTypesStruct_uint32Field_get(cHandle))
            int64Field = moveFromCType(smoke_TypeCollection_AllTypesStruct_int64Field_get(cHandle))
            uint64Field = moveFromCType(smoke_TypeCollection_AllTypesStruct_uint64Field_get(cHandle))
            floatField = moveFromCType(smoke_TypeCollection_AllTypesStruct_floatField_get(cHandle))
            doubleField = moveFromCType(smoke_TypeCollection_AllTypesStruct_doubleField_get(cHandle))
            stringField = moveFromCType(smoke_TypeCollection_AllTypesStruct_stringField_get(cHandle))
            booleanField = moveFromCType(smoke_TypeCollection_AllTypesStruct_booleanField_get(cHandle))
            bytesField = moveFromCType(smoke_TypeCollection_AllTypesStruct_bytesField_get(cHandle))
            pointField = moveFromCType(smoke_TypeCollection_AllTypesStruct_pointField_get(cHandle))
        }
    }
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection.Point {
    return TypeCollection.Point(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection.Point {
    defer {
        smoke_TypeCollection_Point_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeCollection.Point) -> RefHolder {
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_TypeCollection_Point_create_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: TypeCollection.Point) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Point_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection.Point? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_Point_unwrap_optional_handle(handle)
    return TypeCollection.Point(cHandle: unwrappedHandle) as TypeCollection.Point
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection.Point? {
    defer {
        smoke_TypeCollection_Point_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeCollection.Point?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_TypeCollection_Point_create_optional_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: TypeCollection.Point?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Point_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection.Line {
    return TypeCollection.Line(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection.Line {
    defer {
        smoke_TypeCollection_Line_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeCollection.Line) -> RefHolder {
    let c_a = moveToCType(swiftType.a)
    let c_b = moveToCType(swiftType.b)
    return RefHolder(smoke_TypeCollection_Line_create_handle(c_a.ref, c_b.ref))
}
internal func moveToCType(_ swiftType: TypeCollection.Line) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Line_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection.Line? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_Line_unwrap_optional_handle(handle)
    return TypeCollection.Line(cHandle: unwrappedHandle) as TypeCollection.Line
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection.Line? {
    defer {
        smoke_TypeCollection_Line_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeCollection.Line?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_a = moveToCType(swiftType.a)
    let c_b = moveToCType(swiftType.b)
    return RefHolder(smoke_TypeCollection_Line_create_optional_handle(c_a.ref, c_b.ref))
}
internal func moveToCType(_ swiftType: TypeCollection.Line?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Line_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection.AllTypesStruct {
    return TypeCollection.AllTypesStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection.AllTypesStruct {
    defer {
        smoke_TypeCollection_AllTypesStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeCollection.AllTypesStruct) -> RefHolder {
    let c_int8Field = moveToCType(swiftType.int8Field)
    let c_uint8Field = moveToCType(swiftType.uint8Field)
    let c_int16Field = moveToCType(swiftType.int16Field)
    let c_uint16Field = moveToCType(swiftType.uint16Field)
    let c_int32Field = moveToCType(swiftType.int32Field)
    let c_uint32Field = moveToCType(swiftType.uint32Field)
    let c_int64Field = moveToCType(swiftType.int64Field)
    let c_uint64Field = moveToCType(swiftType.uint64Field)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_booleanField = moveToCType(swiftType.booleanField)
    let c_bytesField = moveToCType(swiftType.bytesField)
    let c_pointField = moveToCType(swiftType.pointField)
    return RefHolder(smoke_TypeCollection_AllTypesStruct_create_handle(c_int8Field.ref, c_uint8Field.ref, c_int16Field.ref, c_uint16Field.ref, c_int32Field.ref, c_uint32Field.ref, c_int64Field.ref, c_uint64Field.ref, c_floatField.ref, c_doubleField.ref, c_stringField.ref, c_booleanField.ref, c_bytesField.ref, c_pointField.ref))
}
internal func moveToCType(_ swiftType: TypeCollection.AllTypesStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_AllTypesStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection.AllTypesStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_AllTypesStruct_unwrap_optional_handle(handle)
    return TypeCollection.AllTypesStruct(cHandle: unwrappedHandle) as TypeCollection.AllTypesStruct
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection.AllTypesStruct? {
    defer {
        smoke_TypeCollection_AllTypesStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeCollection.AllTypesStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_int8Field = moveToCType(swiftType.int8Field)
    let c_uint8Field = moveToCType(swiftType.uint8Field)
    let c_int16Field = moveToCType(swiftType.int16Field)
    let c_uint16Field = moveToCType(swiftType.uint16Field)
    let c_int32Field = moveToCType(swiftType.int32Field)
    let c_uint32Field = moveToCType(swiftType.uint32Field)
    let c_int64Field = moveToCType(swiftType.int64Field)
    let c_uint64Field = moveToCType(swiftType.uint64Field)
    let c_floatField = moveToCType(swiftType.floatField)
    let c_doubleField = moveToCType(swiftType.doubleField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_booleanField = moveToCType(swiftType.booleanField)
    let c_bytesField = moveToCType(swiftType.bytesField)
    let c_pointField = moveToCType(swiftType.pointField)
    return RefHolder(smoke_TypeCollection_AllTypesStruct_create_optional_handle(c_int8Field.ref, c_uint8Field.ref, c_int16Field.ref, c_uint16Field.ref, c_int32Field.ref, c_uint32Field.ref, c_int64Field.ref, c_uint64Field.ref, c_floatField.ref, c_doubleField.ref, c_stringField.ref, c_booleanField.ref, c_bytesField.ref, c_pointField.ref))
}
internal func moveToCType(_ swiftType: TypeCollection.AllTypesStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_AllTypesStruct_release_optional_handle)
}
