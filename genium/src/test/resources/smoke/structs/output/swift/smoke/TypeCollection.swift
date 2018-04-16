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
    internal init?(cPoint: _baseRef) {
        x = smoke_TypeCollection_Point_x_get(cPoint)
        y = smoke_TypeCollection_Point_y_get(cPoint)
    }
    internal func convertToCType() -> _baseRef {
        let result = smoke_TypeCollection_Point_create()
        fillFunction(result)
        return result
    }
    internal func fillFunction(_ cPoint: _baseRef) -> Void {
        smoke_TypeCollection_Point_x_set(cPoint, x)
        smoke_TypeCollection_Point_y_set(cPoint, y)
    }
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
    internal init?(cColor: _baseRef) {
        red = smoke_TypeCollection_Color_red_get(cColor)
        green = smoke_TypeCollection_Color_green_get(cColor)
        blue = smoke_TypeCollection_Color_blue_get(cColor)
    }
    internal func convertToCType() -> _baseRef {
        let result = smoke_TypeCollection_Color_create()
        fillFunction(result)
        return result
    }
    internal func fillFunction(_ cColor: _baseRef) -> Void {
        smoke_TypeCollection_Color_red_set(cColor, red)
        smoke_TypeCollection_Color_green_set(cColor, green)
        smoke_TypeCollection_Color_blue_set(cColor, blue)
    }
}
public struct Line {
    public var a: Point
    public var b: Point
    public init(a: Point, b: Point) {
        self.a = a
        self.b = b
    }
    internal init?(cLine: _baseRef) {
        do {
            let aHandle = smoke_TypeCollection_Line_a_get(cLine)
            defer {
                smoke_TypeCollection_Point_release(aHandle)
            }
            guard
                let aUnwrapped = Point(cPoint: aHandle)
            else {
                return nil
            }
            a = aUnwrapped
        }
        do {
            let bHandle = smoke_TypeCollection_Line_b_get(cLine)
            defer {
                smoke_TypeCollection_Point_release(bHandle)
            }
            guard
                let bUnwrapped = Point(cPoint: bHandle)
            else {
                return nil
            }
            b = bUnwrapped
        }
    }
    internal func convertToCType() -> _baseRef {
        let result = smoke_TypeCollection_Line_create()
        fillFunction(result)
        return result
    }
    internal func fillFunction(_ cLine: _baseRef) -> Void {
        let aHandle = a.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(aHandle)
        }
        smoke_TypeCollection_Line_a_set(cLine, aHandle)
        let bHandle = b.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(bHandle)
        }
        smoke_TypeCollection_Line_b_set(cLine, bHandle)
    }
}
public struct ColoredLine {
    public var line: Line
    public var color: Color
    public init(line: Line, color: Color) {
        self.line = line
        self.color = color
    }
    internal init?(cColoredLine: _baseRef) {
        do {
            let lineHandle = smoke_TypeCollection_ColoredLine_line_get(cColoredLine)
            defer {
                smoke_TypeCollection_Line_release(lineHandle)
            }
            guard
                let lineUnwrapped = Line(cLine: lineHandle)
            else {
                return nil
            }
            line = lineUnwrapped
        }
        do {
            let colorHandle = smoke_TypeCollection_ColoredLine_color_get(cColoredLine)
            defer {
                smoke_TypeCollection_Color_release(colorHandle)
            }
            guard
                let colorUnwrapped = Color(cColor: colorHandle)
            else {
                return nil
            }
            color = colorUnwrapped
        }
    }
    internal func convertToCType() -> _baseRef {
        let result = smoke_TypeCollection_ColoredLine_create()
        fillFunction(result)
        return result
    }
    internal func fillFunction(_ cColoredLine: _baseRef) -> Void {
        let lineHandle = line.convertToCType()
        defer {
            smoke_TypeCollection_Line_release(lineHandle)
        }
        smoke_TypeCollection_ColoredLine_line_set(cColoredLine, lineHandle)
        let colorHandle = color.convertToCType()
        defer {
            smoke_TypeCollection_Color_release(colorHandle)
        }
        smoke_TypeCollection_ColoredLine_color_set(cColoredLine, colorHandle)
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
    internal init?(cAllTypesStruct: _baseRef) {
        int8Field = smoke_TypeCollection_AllTypesStruct_int8Field_get(cAllTypesStruct)
        uint8Field = smoke_TypeCollection_AllTypesStruct_uint8Field_get(cAllTypesStruct)
        int16Field = smoke_TypeCollection_AllTypesStruct_int16Field_get(cAllTypesStruct)
        uint16Field = smoke_TypeCollection_AllTypesStruct_uint16Field_get(cAllTypesStruct)
        int32Field = smoke_TypeCollection_AllTypesStruct_int32Field_get(cAllTypesStruct)
        uint32Field = smoke_TypeCollection_AllTypesStruct_uint32Field_get(cAllTypesStruct)
        int64Field = smoke_TypeCollection_AllTypesStruct_int64Field_get(cAllTypesStruct)
        uint64Field = smoke_TypeCollection_AllTypesStruct_uint64Field_get(cAllTypesStruct)
        floatField = smoke_TypeCollection_AllTypesStruct_floatField_get(cAllTypesStruct)
        doubleField = smoke_TypeCollection_AllTypesStruct_doubleField_get(cAllTypesStruct)
        do {
            let stringFieldHandle = smoke_TypeCollection_AllTypesStruct_stringField_get(cAllTypesStruct)
            defer {
                std_string_release(stringFieldHandle)
            }
            stringField = String(cString: std_string_data_get(stringFieldHandle))
        }
        booleanField = smoke_TypeCollection_AllTypesStruct_booleanField_get(cAllTypesStruct)
        do {
            let bytesFieldHandle = smoke_TypeCollection_AllTypesStruct_bytesField_get(cAllTypesStruct)
            defer {
                byteArray_release(bytesFieldHandle)
            }
            guard
                let dataHandle = byteArray_data_get(bytesFieldHandle)
            else {
                return nil
            }
            bytesField = Data(bytes: dataHandle, count: Int(byteArray_size_get(bytesFieldHandle)))
        }
        do {
            let pointFieldHandle = smoke_TypeCollection_AllTypesStruct_pointField_get(cAllTypesStruct)
            defer {
                smoke_TypeCollection_Point_release(pointFieldHandle)
            }
            guard
                let pointFieldUnwrapped = Point(cPoint: pointFieldHandle)
            else {
                return nil
            }
            pointField = pointFieldUnwrapped
        }
    }
    internal func convertToCType() -> _baseRef {
        let result = smoke_TypeCollection_AllTypesStruct_create()
        fillFunction(result)
        return result
    }
    internal func fillFunction(_ cAllTypesStruct: _baseRef) -> Void {
        smoke_TypeCollection_AllTypesStruct_int8Field_set(cAllTypesStruct, int8Field)
        smoke_TypeCollection_AllTypesStruct_uint8Field_set(cAllTypesStruct, uint8Field)
        smoke_TypeCollection_AllTypesStruct_int16Field_set(cAllTypesStruct, int16Field)
        smoke_TypeCollection_AllTypesStruct_uint16Field_set(cAllTypesStruct, uint16Field)
        smoke_TypeCollection_AllTypesStruct_int32Field_set(cAllTypesStruct, int32Field)
        smoke_TypeCollection_AllTypesStruct_uint32Field_set(cAllTypesStruct, uint32Field)
        smoke_TypeCollection_AllTypesStruct_int64Field_set(cAllTypesStruct, int64Field)
        smoke_TypeCollection_AllTypesStruct_uint64Field_set(cAllTypesStruct, uint64Field)
        smoke_TypeCollection_AllTypesStruct_floatField_set(cAllTypesStruct, floatField)
        smoke_TypeCollection_AllTypesStruct_doubleField_set(cAllTypesStruct, doubleField)
        smoke_TypeCollection_AllTypesStruct_stringField_set(cAllTypesStruct, stringField)
        smoke_TypeCollection_AllTypesStruct_booleanField_set(cAllTypesStruct, booleanField)
        bytesField.withUnsafeBytes { (bytesField_ptr: UnsafePointer<UInt8>) in
            smoke_TypeCollection_AllTypesStruct_bytesField_set(cAllTypesStruct, bytesField_ptr, Int64(bytesField.count))
        }
        let pointFieldHandle = pointField.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(pointFieldHandle)
        }
        smoke_TypeCollection_AllTypesStruct_pointField_set(cAllTypesStruct, pointFieldHandle)
    }
}
