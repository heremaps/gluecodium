//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public typealias PointTypedef = Point
public struct Point {
    public var x: Double
    public var y: Double
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    internal init(cHandle: _baseRef) {
        x = smoke_TypeCollection_Point_x_get(cHandle)
        y = smoke_TypeCollection_Point_y_get(cHandle)
    }
    internal func convertToCType() -> _baseRef {
        let x_handle = x
        let y_handle = y
        return smoke_TypeCollection_Point_create_handle(x_handle, y_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Point {
    return Point(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Point {
    defer {
        smoke_TypeCollection_Point_release_handle(handle)
    }
    return copyFromCType(handle)
}
public struct Color {
    public var red: UInt8
    public var green: UInt8
    public var blue: UInt8
    public init(red: UInt8, green: UInt8, blue: UInt8) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    internal init(cHandle: _baseRef) {
        red = smoke_TypeCollection_Color_red_get(cHandle)
        green = smoke_TypeCollection_Color_green_get(cHandle)
        blue = smoke_TypeCollection_Color_blue_get(cHandle)
    }
    internal func convertToCType() -> _baseRef {
        let red_handle = red
        let green_handle = green
        let blue_handle = blue
        return smoke_TypeCollection_Color_create_handle(red_handle, green_handle, blue_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Color {
    return Color(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Color {
    defer {
        smoke_TypeCollection_Color_release_handle(handle)
    }
    return copyFromCType(handle)
}
public struct Line {
    public var a: Point
    public var b: Point
    public init(a: Point, b: Point) {
        self.a = a
        self.b = b
    }
    internal init(cHandle: _baseRef) {
        do {
            let a_handle = smoke_TypeCollection_Line_a_get(cHandle)
            defer {
                smoke_TypeCollection_Point_release_handle(a_handle)
            }
            a = Point(cHandle: a_handle)
        }
        do {
            let b_handle = smoke_TypeCollection_Line_b_get(cHandle)
            defer {
                smoke_TypeCollection_Point_release_handle(b_handle)
            }
            b = Point(cHandle: b_handle)
        }
    }
    internal func convertToCType() -> _baseRef {
        let a_handle = a.convertToCType()
        defer {
            smoke_TypeCollection_Point_release_handle(a_handle)
        }
        let b_handle = b.convertToCType()
        defer {
            smoke_TypeCollection_Point_release_handle(b_handle)
        }
        return smoke_TypeCollection_Line_create_handle(a_handle, b_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Line {
    return Line(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Line {
    defer {
        smoke_TypeCollection_Line_release_handle(handle)
    }
    return copyFromCType(handle)
}
public struct ColoredLine {
    public var line: Line
    public var color: Color
    public init(line: Line, color: Color) {
        self.line = line
        self.color = color
    }
    internal init(cHandle: _baseRef) {
        do {
            let line_handle = smoke_TypeCollection_ColoredLine_line_get(cHandle)
            defer {
                smoke_TypeCollection_Line_release_handle(line_handle)
            }
            line = Line(cHandle: line_handle)
        }
        do {
            let color_handle = smoke_TypeCollection_ColoredLine_color_get(cHandle)
            defer {
                smoke_TypeCollection_Color_release_handle(color_handle)
            }
            color = Color(cHandle: color_handle)
        }
    }
    internal func convertToCType() -> _baseRef {
        let line_handle = line.convertToCType()
        defer {
            smoke_TypeCollection_Line_release_handle(line_handle)
        }
        let color_handle = color.convertToCType()
        defer {
            smoke_TypeCollection_Color_release_handle(color_handle)
        }
        return smoke_TypeCollection_ColoredLine_create_handle(line_handle, color_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> ColoredLine {
    return ColoredLine(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> ColoredLine {
    defer {
        smoke_TypeCollection_ColoredLine_release_handle(handle)
    }
    return copyFromCType(handle)
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
    public var pointField: Point
    public init(int8Field: Int8, uint8Field: UInt8, int16Field: Int16, uint16Field: UInt16, int32Field: Int32, uint32Field: UInt32, int64Field: Int64, uint64Field: UInt64, floatField: Float, doubleField: Double, stringField: String, booleanField: Bool, bytesField: Data, pointField: Point) {
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
        int8Field = smoke_TypeCollection_AllTypesStruct_int8Field_get(cHandle)
        uint8Field = smoke_TypeCollection_AllTypesStruct_uint8Field_get(cHandle)
        int16Field = smoke_TypeCollection_AllTypesStruct_int16Field_get(cHandle)
        uint16Field = smoke_TypeCollection_AllTypesStruct_uint16Field_get(cHandle)
        int32Field = smoke_TypeCollection_AllTypesStruct_int32Field_get(cHandle)
        uint32Field = smoke_TypeCollection_AllTypesStruct_uint32Field_get(cHandle)
        int64Field = smoke_TypeCollection_AllTypesStruct_int64Field_get(cHandle)
        uint64Field = smoke_TypeCollection_AllTypesStruct_uint64Field_get(cHandle)
        floatField = smoke_TypeCollection_AllTypesStruct_floatField_get(cHandle)
        doubleField = smoke_TypeCollection_AllTypesStruct_doubleField_get(cHandle)
        do {
            let stringField_handle = smoke_TypeCollection_AllTypesStruct_stringField_get(cHandle)
            defer {
                std_string_release_handle(stringField_handle)
            }
            stringField = String(cString: std_string_data_get(stringField_handle))
        }
        booleanField = smoke_TypeCollection_AllTypesStruct_booleanField_get(cHandle)
        do {
            let bytesField_handle = smoke_TypeCollection_AllTypesStruct_bytesField_get(cHandle)
            defer {
                byteArray_release_handle(bytesField_handle)
            }
            if let array_data_handle = byteArray_data_get(bytesField_handle) {
                bytesField = Data(bytes: array_data_handle, count: Int(byteArray_size_get(bytesField_handle)))
            } else {
                bytesField = Data()
            }
        }
        do {
            let pointField_handle = smoke_TypeCollection_AllTypesStruct_pointField_get(cHandle)
            defer {
                smoke_TypeCollection_Point_release_handle(pointField_handle)
            }
            pointField = Point(cHandle: pointField_handle)
        }
    }
    internal func convertToCType() -> _baseRef {
        let int8Field_handle = int8Field
        let uint8Field_handle = uint8Field
        let int16Field_handle = int16Field
        let uint16Field_handle = uint16Field
        let int32Field_handle = int32Field
        let uint32Field_handle = uint32Field
        let int64Field_handle = int64Field
        let uint64Field_handle = uint64Field
        let floatField_handle = floatField
        let doubleField_handle = doubleField
        let stringField_handle = stringField
        let booleanField_handle = booleanField
        let bytesField_handle = byteArray_create_handle()
        defer {
            byteArray_release_handle(bytesField_handle)
        }
        bytesField.withUnsafeBytes { (bytesField_ptr: UnsafePointer<UInt8>) in
            byteArray_assign(bytesField_handle, bytesField_ptr, bytesField.count)
        }
        let pointField_handle = pointField.convertToCType()
        defer {
            smoke_TypeCollection_Point_release_handle(pointField_handle)
        }
        return smoke_TypeCollection_AllTypesStruct_create_handle(int8Field_handle, uint8Field_handle, int16Field_handle, uint16Field_handle, int32Field_handle, uint32Field_handle, int64Field_handle, uint64Field_handle, floatField_handle, doubleField_handle, stringField_handle, booleanField_handle, bytesField_handle, pointField_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> AllTypesStruct {
    return AllTypesStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> AllTypesStruct {
    defer {
        smoke_TypeCollection_AllTypesStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}