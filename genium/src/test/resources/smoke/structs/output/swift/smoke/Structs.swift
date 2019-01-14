//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Structs?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Structs_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Structs_release_handle)
        : RefHolder(handle_copy)
}
public class Structs {
    let c_instance : _baseRef
    init(cStructs: _baseRef) {
        guard cStructs != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cStructs
    }
    deinit {
        smoke_Structs_release_handle(c_instance)
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
        internal init(cHandle: _baseRef) {
            x = moveFromCType(smoke_Structs_Point_x_get(cHandle))
            y = moveFromCType(smoke_Structs_Point_y_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let x_handle = x
            let y_handle = y
            return smoke_Structs_Point_create_handle(x_handle, y_handle)
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
        internal init(cHandle: _baseRef) {
            red = moveFromCType(smoke_Structs_Color_red_get(cHandle))
            green = moveFromCType(smoke_Structs_Color_green_get(cHandle))
            blue = moveFromCType(smoke_Structs_Color_blue_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let red_handle = red
            let green_handle = green
            let blue_handle = blue
            return smoke_Structs_Color_create_handle(red_handle, green_handle, blue_handle)
        }
    }
    public struct Line {
        public var a: Structs.Point
        public var b: Structs.Point
        public init(a: Structs.Point, b: Structs.Point) {
            self.a = a
            self.b = b
        }
        internal init(cHandle: _baseRef) {
            a = moveFromCType(smoke_Structs_Line_a_get(cHandle))
            b = moveFromCType(smoke_Structs_Line_b_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let a_handle = a.convertToCType()
            defer {
                smoke_Structs_Point_release_handle(a_handle)
            }
            let b_handle = b.convertToCType()
            defer {
                smoke_Structs_Point_release_handle(b_handle)
            }
            return smoke_Structs_Line_create_handle(a_handle, b_handle)
        }
    }
    public struct ColoredLine {
        public var line: Structs.Line
        public var color: Structs.Color
        public init(line: Structs.Line, color: Structs.Color) {
            self.line = line
            self.color = color
        }
        internal init(cHandle: _baseRef) {
            line = moveFromCType(smoke_Structs_ColoredLine_line_get(cHandle))
            color = moveFromCType(smoke_Structs_ColoredLine_color_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let line_handle = line.convertToCType()
            defer {
                smoke_Structs_Line_release_handle(line_handle)
            }
            let color_handle = color.convertToCType()
            defer {
                smoke_Structs_Color_release_handle(color_handle)
            }
            return smoke_Structs_ColoredLine_create_handle(line_handle, color_handle)
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
        internal init(cHandle: _baseRef) {
            int8Field = moveFromCType(smoke_Structs_AllTypesStruct_int8Field_get(cHandle))
            uint8Field = moveFromCType(smoke_Structs_AllTypesStruct_uint8Field_get(cHandle))
            int16Field = moveFromCType(smoke_Structs_AllTypesStruct_int16Field_get(cHandle))
            uint16Field = moveFromCType(smoke_Structs_AllTypesStruct_uint16Field_get(cHandle))
            int32Field = moveFromCType(smoke_Structs_AllTypesStruct_int32Field_get(cHandle))
            uint32Field = moveFromCType(smoke_Structs_AllTypesStruct_uint32Field_get(cHandle))
            int64Field = moveFromCType(smoke_Structs_AllTypesStruct_int64Field_get(cHandle))
            uint64Field = moveFromCType(smoke_Structs_AllTypesStruct_uint64Field_get(cHandle))
            floatField = moveFromCType(smoke_Structs_AllTypesStruct_floatField_get(cHandle))
            doubleField = moveFromCType(smoke_Structs_AllTypesStruct_doubleField_get(cHandle))
            stringField = moveFromCType(smoke_Structs_AllTypesStruct_stringField_get(cHandle))
            booleanField = moveFromCType(smoke_Structs_AllTypesStruct_booleanField_get(cHandle))
            bytesField = moveFromCType(smoke_Structs_AllTypesStruct_bytesField_get(cHandle))
            pointField = moveFromCType(smoke_Structs_AllTypesStruct_pointField_get(cHandle))
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
                smoke_Structs_Point_release_handle(pointField_handle)
            }
            return smoke_Structs_AllTypesStruct_create_handle(int8Field_handle, uint8Field_handle, int16Field_handle, uint16Field_handle, int32Field_handle, uint32Field_handle, int64Field_handle, uint64Field_handle, floatField_handle, doubleField_handle, stringField_handle, booleanField_handle, bytesField_handle, pointField_handle)
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
        internal init(cHandle: _baseRef) {
            stringField = moveFromCType(smoke_Structs_ExternalStruct_stringField_get(cHandle))
            externalStringField = moveFromCType(smoke_Structs_ExternalStruct_externalStringField_get(cHandle))
            externalArrayField = moveFromCType(smoke_Structs_ExternalStruct_externalArrayField_get(cHandle))
            externalStructField = moveFromCType(smoke_Structs_ExternalStruct_externalStructField_get(cHandle))
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
                smoke_Structs_AnotherExternalStruct_release_handle(externalStructField_handle)
            }
            return smoke_Structs_ExternalStruct_create_handle(stringField_handle, externalStringField_handle, externalArrayField_handle, externalStructField_handle)
        }
    }
    public struct AnotherExternalStruct {
        public var intField: Int8
        public init(intField: Int8) {
            self.intField = intField
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_Structs_AnotherExternalStruct_intField_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let intField_handle = intField
            return smoke_Structs_AnotherExternalStruct_create_handle(intField_handle)
        }
    }
    public struct YetAnotherExternalStruct {
        public var stringField: String
        public init(stringField: String) {
            self.stringField = stringField
        }
        internal init(cHandle: _baseRef) {
            stringField = moveFromCType(smoke_Structs_YetAnotherExternalStruct_stringField_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let stringField_handle = stringField
            return smoke_Structs_YetAnotherExternalStruct_create_handle(stringField_handle)
        }
    }
    public static func createPoint(x: Double, y: Double) -> Structs.Point {
        return moveFromCType(smoke_Structs_createPoint(x, y))
    }
    public static func swapPointCoordinates(input: Structs.Point) -> Structs.Point {
        let input_handle = input.convertToCType()
        defer {
            smoke_Structs_Point_release_handle(input_handle)
        }
        return moveFromCType(smoke_Structs_swapPointCoordinates(input_handle))
    }
    public static func createLine(pointA: Structs.Point, pointB: Structs.Point) -> Structs.Line {
        let pointA_handle = pointA.convertToCType()
        defer {
            smoke_Structs_Point_release_handle(pointA_handle)
        }
        let pointB_handle = pointB.convertToCType()
        defer {
            smoke_Structs_Point_release_handle(pointB_handle)
        }
        return moveFromCType(smoke_Structs_createLine(pointA_handle, pointB_handle))
    }
    public static func createColoredLine(line: Structs.Line, color: Structs.Color) -> Structs.ColoredLine {
        let line_handle = line.convertToCType()
        defer {
            smoke_Structs_Line_release_handle(line_handle)
        }
        let color_handle = color.convertToCType()
        defer {
            smoke_Structs_Color_release_handle(color_handle)
        }
        return moveFromCType(smoke_Structs_createColoredLine(line_handle, color_handle))
    }
    public static func returnColoredLine(input: Structs.ColoredLine) -> Structs.ColoredLine {
        let input_handle = input.convertToCType()
        defer {
            smoke_Structs_ColoredLine_release_handle(input_handle)
        }
        return moveFromCType(smoke_Structs_returnColoredLine(input_handle))
    }
    public static func returnAllTypesStruct(input: Structs.AllTypesStruct) -> Structs.AllTypesStruct {
        let input_handle = input.convertToCType()
        defer {
            smoke_Structs_AllTypesStruct_release_handle(input_handle)
        }
        return moveFromCType(smoke_Structs_returnAllTypesStruct(input_handle))
    }
    public static func modifyAllTypesStruct(input: Structs.AllTypesStruct) -> Structs.AllTypesStruct {
        let input_handle = input.convertToCType()
        defer {
            smoke_Structs_AllTypesStruct_release_handle(input_handle)
        }
        return moveFromCType(smoke_Structs_modifyAllTypesStruct(input_handle))
    }
    public static func getExternalStruct() -> Structs.ExternalStruct {
        return moveFromCType(smoke_Structs_getExternalStruct())
    }
    public static func getAnotherExternalStruct() -> Structs.AnotherExternalStruct {
        return moveFromCType(smoke_Structs_getAnotherExternalStruct())
    }
    public static func getYetAnotherExternalStruct() -> Structs.YetAnotherExternalStruct {
        return moveFromCType(smoke_Structs_getYetAnotherExternalStruct())
    }
}
extension Structs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func StructscopyFromCType(_ handle: _baseRef) -> Structs {
    return Structs(cStructs: handle)
}
internal func StructsmoveFromCType(_ handle: _baseRef) -> Structs {
    return StructscopyFromCType(handle)
}
internal func StructscopyFromCType(_ handle: _baseRef) -> Structs? {
    guard handle != 0 else {
        return nil
    }
    return StructsmoveFromCType(handle) as Structs
}
internal func StructsmoveFromCType(_ handle: _baseRef) -> Structs? {
    return StructscopyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.Point {
    return Structs.Point(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.Point {
    defer {
        smoke_Structs_Point_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.Color {
    return Structs.Color(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.Color {
    defer {
        smoke_Structs_Color_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.Line {
    return Structs.Line(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.Line {
    defer {
        smoke_Structs_Line_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.ColoredLine {
    return Structs.ColoredLine(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.ColoredLine {
    defer {
        smoke_Structs_ColoredLine_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.AllTypesStruct {
    return Structs.AllTypesStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.AllTypesStruct {
    defer {
        smoke_Structs_AllTypesStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.ExternalStruct {
    return Structs.ExternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.ExternalStruct {
    defer {
        smoke_Structs_ExternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.AnotherExternalStruct {
    return Structs.AnotherExternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.AnotherExternalStruct {
    defer {
        smoke_Structs_AnotherExternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.YetAnotherExternalStruct {
    return Structs.YetAnotherExternalStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.YetAnotherExternalStruct {
    defer {
        smoke_Structs_YetAnotherExternalStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ cValue: UInt32) -> Structs.FooBar {
    return Structs.FooBar(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Structs.FooBar {
    return copyFromCType(cValue)
}