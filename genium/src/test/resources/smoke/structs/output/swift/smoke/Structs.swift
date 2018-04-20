//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Structs?) -> RefHolder {
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
        internal init?(cPoint: _baseRef) {
            x = smoke_Structs_Point_x_get(cPoint)
            y = smoke_Structs_Point_y_get(cPoint)
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Structs_Point_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cPoint: _baseRef) -> Void {
            smoke_Structs_Point_x_set(cPoint, x)
            smoke_Structs_Point_y_set(cPoint, y)
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
            red = smoke_Structs_Color_red_get(cColor)
            green = smoke_Structs_Color_green_get(cColor)
            blue = smoke_Structs_Color_blue_get(cColor)
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Structs_Color_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cColor: _baseRef) -> Void {
            smoke_Structs_Color_red_set(cColor, red)
            smoke_Structs_Color_green_set(cColor, green)
            smoke_Structs_Color_blue_set(cColor, blue)
        }
    }
    public struct Line {
        public var a: Structs.Point
        public var b: Structs.Point
        public init(a: Structs.Point, b: Structs.Point) {
            self.a = a
            self.b = b
        }
        internal init?(cLine: _baseRef) {
            do {
                let a_handle = smoke_Structs_Line_a_get(cLine)
                defer {
                    smoke_Structs_Point_release(a_handle)
                }
                guard
                    let a_unwrapped = Structs.Point(cPoint: a_handle)
                else {
                    return nil
                }
                a = a_unwrapped
            }
            do {
                let b_handle = smoke_Structs_Line_b_get(cLine)
                defer {
                    smoke_Structs_Point_release(b_handle)
                }
                guard
                    let b_unwrapped = Structs.Point(cPoint: b_handle)
                else {
                    return nil
                }
                b = b_unwrapped
            }
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Structs_Line_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cLine: _baseRef) -> Void {
            let a_handle = a.convertToCType()
            defer {
                smoke_Structs_Point_release(a_handle)
            }
            smoke_Structs_Line_a_set(cLine, a_handle)
            let b_handle = b.convertToCType()
            defer {
                smoke_Structs_Point_release(b_handle)
            }
            smoke_Structs_Line_b_set(cLine, b_handle)
        }
    }
    public struct ColoredLine {
        public var line: Structs.Line
        public var color: Structs.Color
        public init(line: Structs.Line, color: Structs.Color) {
            self.line = line
            self.color = color
        }
        internal init?(cColoredLine: _baseRef) {
            do {
                let line_handle = smoke_Structs_ColoredLine_line_get(cColoredLine)
                defer {
                    smoke_Structs_Line_release(line_handle)
                }
                guard
                    let line_unwrapped = Structs.Line(cLine: line_handle)
                else {
                    return nil
                }
                line = line_unwrapped
            }
            do {
                let color_handle = smoke_Structs_ColoredLine_color_get(cColoredLine)
                defer {
                    smoke_Structs_Color_release(color_handle)
                }
                guard
                    let color_unwrapped = Structs.Color(cColor: color_handle)
                else {
                    return nil
                }
                color = color_unwrapped
            }
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Structs_ColoredLine_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cColoredLine: _baseRef) -> Void {
            let line_handle = line.convertToCType()
            defer {
                smoke_Structs_Line_release(line_handle)
            }
            smoke_Structs_ColoredLine_line_set(cColoredLine, line_handle)
            let color_handle = color.convertToCType()
            defer {
                smoke_Structs_Color_release(color_handle)
            }
            smoke_Structs_ColoredLine_color_set(cColoredLine, color_handle)
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
        public var pointField: Structs.Point
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
        internal init?(cAllTypesStruct: _baseRef) {
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
                guard
                    let array_data_handle = byteArray_data_get(bytesField_handle)
                else {
                    return nil
                }
                bytesField = Data(bytes: array_data_handle, count: Int(byteArray_size_get(bytesField_handle)))
            }
            do {
                let pointField_handle = smoke_Structs_AllTypesStruct_pointField_get(cAllTypesStruct)
                defer {
                    smoke_Structs_Point_release(pointField_handle)
                }
                guard
                    let pointField_unwrapped = Structs.Point(cPoint: pointField_handle)
                else {
                    return nil
                }
                pointField = pointField_unwrapped
            }
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Structs_AllTypesStruct_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cAllTypesStruct: _baseRef) -> Void {
            smoke_Structs_AllTypesStruct_int8Field_set(cAllTypesStruct, int8Field)
            smoke_Structs_AllTypesStruct_uint8Field_set(cAllTypesStruct, uint8Field)
            smoke_Structs_AllTypesStruct_int16Field_set(cAllTypesStruct, int16Field)
            smoke_Structs_AllTypesStruct_uint16Field_set(cAllTypesStruct, uint16Field)
            smoke_Structs_AllTypesStruct_int32Field_set(cAllTypesStruct, int32Field)
            smoke_Structs_AllTypesStruct_uint32Field_set(cAllTypesStruct, uint32Field)
            smoke_Structs_AllTypesStruct_int64Field_set(cAllTypesStruct, int64Field)
            smoke_Structs_AllTypesStruct_uint64Field_set(cAllTypesStruct, uint64Field)
            smoke_Structs_AllTypesStruct_floatField_set(cAllTypesStruct, floatField)
            smoke_Structs_AllTypesStruct_doubleField_set(cAllTypesStruct, doubleField)
            smoke_Structs_AllTypesStruct_stringField_set(cAllTypesStruct, stringField)
            smoke_Structs_AllTypesStruct_booleanField_set(cAllTypesStruct, booleanField)
            bytesField.withUnsafeBytes { (bytesField_ptr: UnsafePointer<UInt8>) in
                smoke_Structs_AllTypesStruct_bytesField_set(cAllTypesStruct, bytesField_ptr, Int64(bytesField.count))
            }
            let pointField_handle = pointField.convertToCType()
            defer {
                smoke_Structs_Point_release(pointField_handle)
            }
            smoke_Structs_AllTypesStruct_pointField_set(cAllTypesStruct, pointField_handle)
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
        internal init?(cExternalStruct: _baseRef) {
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
                guard
                    let externalStructField_unwrapped = Structs.AnotherExternalStruct(cAnotherExternalStruct: externalStructField_handle)
                else {
                    return nil
                }
                externalStructField = externalStructField_unwrapped
            }
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Structs_ExternalStruct_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cExternalStruct: _baseRef) -> Void {
            smoke_Structs_ExternalStruct_stringField_set(cExternalStruct, stringField)
            smoke_Structs_ExternalStruct_externalStringField_set(cExternalStruct, externalStringField)
            let externalArrayField_conversion = externalArrayField.c_conversion()
            smoke_Structs_ExternalStruct_externalArrayField_set(cExternalStruct, externalArrayField_conversion.c_type)
            externalArrayField_conversion.cleanup()
            let externalStructField_handle = externalStructField.convertToCType()
            defer {
                smoke_Structs_AnotherExternalStruct_release(externalStructField_handle)
            }
            smoke_Structs_ExternalStruct_externalStructField_set(cExternalStruct, externalStructField_handle)
        }
    }
    public struct AnotherExternalStruct {
        public var intField: Int8
        public init(intField: Int8) {
            self.intField = intField
        }
        internal init?(cAnotherExternalStruct: _baseRef) {
            intField = smoke_Structs_AnotherExternalStruct_intField_get(cAnotherExternalStruct)
        }
        internal func convertToCType() -> _baseRef {
            let result = smoke_Structs_AnotherExternalStruct_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cAnotherExternalStruct: _baseRef) -> Void {
            smoke_Structs_AnotherExternalStruct_intField_set(cAnotherExternalStruct, intField)
        }
    }
    public static func createPoint(x: Double, y: Double) -> Structs.Point? {
        let cResult = smoke_Structs_createPoint(x, y)
        defer {
            smoke_Structs_Point_release(cResult)
        }
        return Structs.Point(cPoint: cResult)
    }
    public static func swapPointCoordinates(input: Structs.Point) -> Structs.Point? {
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
    public static func createLine(pointA: Structs.Point, pointB: Structs.Point) -> Structs.Line? {
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
    public static func createColoredLine(line: Structs.Line, color: Structs.Color) -> Structs.ColoredLine? {
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
    public static func returnColoredLine(input: Structs.ColoredLine) -> Structs.ColoredLine? {
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
    public static func returnAllTypesStruct(input: Structs.AllTypesStruct) -> Structs.AllTypesStruct? {
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
    public static func modifyAllTypesStruct(input: Structs.AllTypesStruct) -> Structs.AllTypesStruct? {
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
    public static func getExternalStruct() -> Structs.ExternalStruct? {
        let cResult = smoke_Structs_getExternalStruct()
        defer {
            smoke_Structs_ExternalStruct_release(cResult)
        }
        return Structs.ExternalStruct(cExternalStruct: cResult)
    }
}
extension Structs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
