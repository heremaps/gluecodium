//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Structs?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class Structs {
    let c_instance : _baseRef
    public init?(cStructs: _baseRef) {
        guard cStructs != 0 else {
            return nil
        }
        c_instance = cStructs
    }
    deinit {
        smoke_Structs_release(c_instance)
    }
    public enum FooBar : UInt32 {
        case foo
        case bar
    }
    public struct Point {
        public var x: Double
        public var y: Double
        public init(x: Double, y: Double) {
            self.x = x
            self.y = y
        }
        internal init(cPoint: _baseRef) {
            x = smoke_Structs_Point_x_get(cPoint)
            y = smoke_Structs_Point_y_get(cPoint)
        }
        internal func convertToCType() -> _baseRef {
            let x_handle = x
            let y_handle = y
            return smoke_Structs_Point_create(x_handle, y_handle)
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
        internal init(cColor: _baseRef) {
            red = smoke_Structs_Color_red_get(cColor)
            green = smoke_Structs_Color_green_get(cColor)
            blue = smoke_Structs_Color_blue_get(cColor)
        }
        internal func convertToCType() -> _baseRef {
            let red_handle = red
            let green_handle = green
            let blue_handle = blue
            return smoke_Structs_Color_create(red_handle, green_handle, blue_handle)
        }
    }
    public struct Line {
        public var a: Structs.Point
        public var b: Structs.Point
        public init(a: Structs.Point, b: Structs.Point) {
            self.a = a
            self.b = b
        }
        internal init(cLine: _baseRef) {
            do {
                let a_handle = smoke_Structs_Line_a_get(cLine)
                defer {
                    smoke_Structs_Point_release(a_handle)
                }
                a = Structs.Point(cPoint: a_handle)
            }
            do {
                let b_handle = smoke_Structs_Line_b_get(cLine)
                defer {
                    smoke_Structs_Point_release(b_handle)
                }
                b = Structs.Point(cPoint: b_handle)
            }
        }
        internal func convertToCType() -> _baseRef {
            let a_handle = a.convertToCType()
            defer {
                smoke_Structs_Point_release(a_handle)
            }
            let b_handle = b.convertToCType()
            defer {
                smoke_Structs_Point_release(b_handle)
            }
            return smoke_Structs_Line_create(a_handle, b_handle)
        }
    }
    public struct ColoredLine {
        public var line: Structs.Line
        public var color: Structs.Color
        public init(line: Structs.Line, color: Structs.Color) {
            self.line = line
            self.color = color
        }
        internal init(cColoredLine: _baseRef) {
            do {
                let line_handle = smoke_Structs_ColoredLine_line_get(cColoredLine)
                defer {
                    smoke_Structs_Line_release(line_handle)
                }
                line = Structs.Line(cLine: line_handle)
            }
            do {
                let color_handle = smoke_Structs_ColoredLine_color_get(cColoredLine)
                defer {
                    smoke_Structs_Color_release(color_handle)
                }
                color = Structs.Color(cColor: color_handle)
            }
        }
        internal func convertToCType() -> _baseRef {
            let line_handle = line.convertToCType()
            defer {
                smoke_Structs_Line_release(line_handle)
            }
            let color_handle = color.convertToCType()
            defer {
                smoke_Structs_Color_release(color_handle)
            }
            return smoke_Structs_ColoredLine_create(line_handle, color_handle)
        }
    }
    public struct AllTypesStruct {
        public let int8Field: Int8
        public let uint8Field: UInt8
        public let int16Field: Int16
        public let uint16Field: UInt16
        public let int32Field: Int32
        public let uint32Field: UInt32
        public let int64Field: Int64
        public let uint64Field: UInt64
        public let floatField: Float
        public let doubleField: Double
        public let stringField: String
        public let booleanField: Bool
        public let bytesField: Data
        public let pointField: Structs.Point
        public init(int8Field: Int8, uint8Field: UInt8, int16Field: Int16, uint16Field: UInt16, int32Field: Int32, uint32Field: UInt32, int64Field: Int64, uint64Field: UInt64, floatField: Float, doubleField: Double, stringField: String, booleanField: Bool, bytesField: Data, pointField: Structs.Point) {
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
        internal init(cAllTypesStruct: _baseRef) {
            int8Field = smoke_Structs_AllTypesStruct_int8Field_get(cAllTypesStruct)
            uint8Field = smoke_Structs_AllTypesStruct_uint8Field_get(cAllTypesStruct)
            int16Field = smoke_Structs_AllTypesStruct_int16Field_get(cAllTypesStruct)
            uint16Field = smoke_Structs_AllTypesStruct_uint16Field_get(cAllTypesStruct)
            int32Field = smoke_Structs_AllTypesStruct_int32Field_get(cAllTypesStruct)
            uint32Field = smoke_Structs_AllTypesStruct_uint32Field_get(cAllTypesStruct)
            int64Field = smoke_Structs_AllTypesStruct_int64Field_get(cAllTypesStruct)
            uint64Field = smoke_Structs_AllTypesStruct_uint64Field_get(cAllTypesStruct)
            floatField = smoke_Structs_AllTypesStruct_floatField_get(cAllTypesStruct)
            doubleField = smoke_Structs_AllTypesStruct_doubleField_get(cAllTypesStruct)
            do {
                let stringField_handle = smoke_Structs_AllTypesStruct_stringField_get(cAllTypesStruct)
                defer {
                    std_string_release(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
            booleanField = smoke_Structs_AllTypesStruct_booleanField_get(cAllTypesStruct)
            do {
                let bytesField_handle = smoke_Structs_AllTypesStruct_bytesField_get(cAllTypesStruct)
                defer {
                    byteArray_release(bytesField_handle)
                }
                if let array_data_handle = byteArray_data_get(bytesField_handle) {
                    bytesField = Data(bytes: array_data_handle, count: Int(byteArray_size_get(bytesField_handle)))
                } else {
                    bytesField = Data()
                }
            }
            do {
                let pointField_handle = smoke_Structs_AllTypesStruct_pointField_get(cAllTypesStruct)
                defer {
                    smoke_Structs_Point_release(pointField_handle)
                }
                pointField = Structs.Point(cPoint: pointField_handle)
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
            let bytesField_handle = byteArray_create()
            defer {
                byteArray_release(bytesField_handle)
            }
            bytesField.withUnsafeBytes { (bytesField_ptr: UnsafePointer<UInt8>) in
                byteArray_assign(bytesField_handle, bytesField_ptr, bytesField.count)
            }
            let pointField_handle = pointField.convertToCType()
            defer {
                smoke_Structs_Point_release(pointField_handle)
            }
            return smoke_Structs_AllTypesStruct_create(int8Field_handle, uint8Field_handle, int16Field_handle, uint16Field_handle, int32Field_handle, uint32Field_handle, int64Field_handle, uint64Field_handle, floatField_handle, doubleField_handle, stringField_handle, booleanField_handle, bytesField_handle, pointField_handle)
        }
    }
    public struct ExternalStruct {
        public var stringField: String
        public var externalStringField: String
        public var externalArrayField: CollectionOf<Int8>
        public var externalStructField: Structs.AnotherExternalStruct
        public init(stringField: String, externalStringField: String, externalArrayField: CollectionOf<Int8>, externalStructField: Structs.AnotherExternalStruct) {
            self.stringField = stringField
            self.externalStringField = externalStringField
            self.externalArrayField = externalArrayField
            self.externalStructField = externalStructField
        }
        internal init(cExternalStruct: _baseRef) {
            do {
                let stringField_handle = smoke_Structs_ExternalStruct_stringField_get(cExternalStruct)
                defer {
                    std_string_release(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
            do {
                let externalStringField_handle = smoke_Structs_ExternalStruct_externalStringField_get(cExternalStruct)
                defer {
                    std_string_release(externalStringField_handle)
                }
                externalStringField = String(cString: std_string_data_get(externalStringField_handle))
            }
            externalArrayField = Int8List(smoke_Structs_ExternalStruct_externalArrayField_get(cExternalStruct))
            do {
                let externalStructField_handle = smoke_Structs_ExternalStruct_externalStructField_get(cExternalStruct)
                defer {
                    smoke_Structs_AnotherExternalStruct_release(externalStructField_handle)
                }
                externalStructField = Structs.AnotherExternalStruct(cAnotherExternalStruct: externalStructField_handle)
            }
        }
        internal func convertToCType() -> _baseRef {
            let stringField_handle = stringField
            let externalStringField_handle = externalStringField
            let externalArrayField_conversion = externalArrayField.c_conversion()
            defer {
              externalArrayField_conversion.cleanup()
            }
            let externalArrayField_handle = externalArrayField_conversion.c_type
            let externalStructField_handle = externalStructField.convertToCType()
            defer {
                smoke_Structs_AnotherExternalStruct_release(externalStructField_handle)
            }
            return smoke_Structs_ExternalStruct_create(stringField_handle, externalStringField_handle, externalArrayField_handle, externalStructField_handle)
        }
    }
    public struct AnotherExternalStruct {
        public var intField: Int8
        public init(intField: Int8) {
            self.intField = intField
        }
        internal init(cAnotherExternalStruct: _baseRef) {
            intField = smoke_Structs_AnotherExternalStruct_intField_get(cAnotherExternalStruct)
        }
        internal func convertToCType() -> _baseRef {
            let intField_handle = intField
            return smoke_Structs_AnotherExternalStruct_create(intField_handle)
        }
    }
    public struct YetAnotherExternalStruct {
        public var stringField: String
        public init(stringField: String) {
            self.stringField = stringField
        }
        internal init(cYetAnotherExternalStruct: _baseRef) {
            do {
                let stringField_handle = smoke_Structs_YetAnotherExternalStruct_stringField_get(cYetAnotherExternalStruct)
                defer {
                    std_string_release(stringField_handle)
                }
                stringField = String(cString: std_string_data_get(stringField_handle))
            }
        }
        internal func convertToCType() -> _baseRef {
            let stringField_handle = stringField
            return smoke_Structs_YetAnotherExternalStruct_create(stringField_handle)
        }
    }
    public static func createPoint(x: Double, y: Double) -> Structs.Point {
        let cResult = smoke_Structs_createPoint(x, y)
        defer {
            smoke_Structs_Point_release(cResult)
        }
        return Structs.Point(cPoint: cResult)
    }
    public static func swapPointCoordinates(input: Structs.Point) -> Structs.Point {
        let input_handle = input.convertToCType()
        defer {
            smoke_Structs_Point_release(input_handle)
        }
        let cResult = smoke_Structs_swapPointCoordinates(input_handle)
        defer {
            smoke_Structs_Point_release(cResult)
        }
        return Structs.Point(cPoint: cResult)
    }
    public static func createLine(pointA: Structs.Point, pointB: Structs.Point) -> Structs.Line {
        let pointA_handle = pointA.convertToCType()
        defer {
            smoke_Structs_Point_release(pointA_handle)
        }
        let pointB_handle = pointB.convertToCType()
        defer {
            smoke_Structs_Point_release(pointB_handle)
        }
        let cResult = smoke_Structs_createLine(pointA_handle, pointB_handle)
        defer {
            smoke_Structs_Line_release(cResult)
        }
        return Structs.Line(cLine: cResult)
    }
    public static func createColoredLine(line: Structs.Line, color: Structs.Color) -> Structs.ColoredLine {
        let line_handle = line.convertToCType()
        defer {
            smoke_Structs_Line_release(line_handle)
        }
        let color_handle = color.convertToCType()
        defer {
            smoke_Structs_Color_release(color_handle)
        }
        let cResult = smoke_Structs_createColoredLine(line_handle, color_handle)
        defer {
            smoke_Structs_ColoredLine_release(cResult)
        }
        return Structs.ColoredLine(cColoredLine: cResult)
    }
    public static func returnColoredLine(input: Structs.ColoredLine) -> Structs.ColoredLine {
        let input_handle = input.convertToCType()
        defer {
            smoke_Structs_ColoredLine_release(input_handle)
        }
        let cResult = smoke_Structs_returnColoredLine(input_handle)
        defer {
            smoke_Structs_ColoredLine_release(cResult)
        }
        return Structs.ColoredLine(cColoredLine: cResult)
    }
    public static func returnAllTypesStruct(input: Structs.AllTypesStruct) -> Structs.AllTypesStruct {
        let input_handle = input.convertToCType()
        defer {
            smoke_Structs_AllTypesStruct_release(input_handle)
        }
        let cResult = smoke_Structs_returnAllTypesStruct(input_handle)
        defer {
            smoke_Structs_AllTypesStruct_release(cResult)
        }
        return Structs.AllTypesStruct(cAllTypesStruct: cResult)
    }
    public static func modifyAllTypesStruct(input: Structs.AllTypesStruct) -> Structs.AllTypesStruct {
        let input_handle = input.convertToCType()
        defer {
            smoke_Structs_AllTypesStruct_release(input_handle)
        }
        let cResult = smoke_Structs_modifyAllTypesStruct(input_handle)
        defer {
            smoke_Structs_AllTypesStruct_release(cResult)
        }
        return Structs.AllTypesStruct(cAllTypesStruct: cResult)
    }
    public static func getExternalStruct() -> Structs.ExternalStruct {
        let cResult = smoke_Structs_getExternalStruct()
        defer {
            smoke_Structs_ExternalStruct_release(cResult)
        }
        return Structs.ExternalStruct(cExternalStruct: cResult)
    }
    public static func getAnotherExternalStruct() -> Structs.AnotherExternalStruct {
        let cResult = smoke_Structs_getAnotherExternalStruct()
        defer {
            smoke_Structs_AnotherExternalStruct_release(cResult)
        }
        return Structs.AnotherExternalStruct(cAnotherExternalStruct: cResult)
    }
    public static func getYetAnotherExternalStruct() -> Structs.YetAnotherExternalStruct {
        let cResult = smoke_Structs_getYetAnotherExternalStruct()
        defer {
            smoke_Structs_YetAnotherExternalStruct_release(cResult)
        }
        return Structs.YetAnotherExternalStruct(cYetAnotherExternalStruct: cResult)
    }
}
extension Structs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
