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
    public enum FooBar : UInt32, CaseIterable {
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
            let c_x = moveToCType(x)
            let c_y = moveToCType(y)
            return smoke_Structs_Point_create_handle(c_x.ref, c_y.ref)
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
            let c_red = moveToCType(red)
            let c_green = moveToCType(green)
            let c_blue = moveToCType(blue)
            return smoke_Structs_Color_create_handle(c_red.ref, c_green.ref, c_blue.ref)
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
            let c_a = moveToCType(a)
            let c_b = moveToCType(b)
            return smoke_Structs_Line_create_handle(c_a.ref, c_b.ref)
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
            let c_line = moveToCType(line)
            let c_color = moveToCType(color)
            return smoke_Structs_ColoredLine_create_handle(c_line.ref, c_color.ref)
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
            let c_int8Field = moveToCType(int8Field)
            let c_uint8Field = moveToCType(uint8Field)
            let c_int16Field = moveToCType(int16Field)
            let c_uint16Field = moveToCType(uint16Field)
            let c_int32Field = moveToCType(int32Field)
            let c_uint32Field = moveToCType(uint32Field)
            let c_int64Field = moveToCType(int64Field)
            let c_uint64Field = moveToCType(uint64Field)
            let c_floatField = moveToCType(floatField)
            let c_doubleField = moveToCType(doubleField)
            let c_stringField = moveToCType(stringField)
            let c_booleanField = moveToCType(booleanField)
            let c_bytesField = moveToCType(bytesField)
            let c_pointField = moveToCType(pointField)
            return smoke_Structs_AllTypesStruct_create_handle(c_int8Field.ref, c_uint8Field.ref, c_int16Field.ref, c_uint16Field.ref, c_int32Field.ref, c_uint32Field.ref, c_int64Field.ref, c_uint64Field.ref, c_floatField.ref, c_doubleField.ref, c_stringField.ref, c_booleanField.ref, c_bytesField.ref, c_pointField.ref)
        }
    }
    public struct ExternalStruct {
        public var stringField: String
        public var externalStringField: String
        public var externalArrayField: [Int8]
        public var externalStructField: Structs.AnotherExternalStruct
        public init(stringField: String, externalStringField: String, externalArrayField: [Int8], externalStructField: Structs.AnotherExternalStruct) {
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
            let c_stringField = moveToCType(stringField)
            let c_externalStringField = moveToCType(externalStringField)
            let c_externalArrayField = moveToCType(externalArrayField)
            let c_externalStructField = moveToCType(externalStructField)
            return smoke_Structs_ExternalStruct_create_handle(c_stringField.ref, c_externalStringField.ref, c_externalArrayField.ref, c_externalStructField.ref)
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
            let c_intField = moveToCType(intField)
            return smoke_Structs_AnotherExternalStruct_create_handle(c_intField.ref)
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
            let c_stringField = moveToCType(stringField)
            return smoke_Structs_YetAnotherExternalStruct_create_handle(c_stringField.ref)
        }
    }
    public static func createPoint(x: Double, y: Double) -> Structs.Point {
            let c_x = moveToCType(x)
            let c_y = moveToCType(y)
        return moveFromCType(smoke_Structs_createPoint(c_x.ref, c_y.ref))
    }
    public static func swapPointCoordinates(input: Structs.Point) -> Structs.Point {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Structs_swapPointCoordinates(c_input.ref))
    }
    public static func createLine(pointA: Structs.Point, pointB: Structs.Point) -> Structs.Line {
            let c_pointA = moveToCType(pointA)
            let c_pointB = moveToCType(pointB)
        return moveFromCType(smoke_Structs_createLine(c_pointA.ref, c_pointB.ref))
    }
    public static func createColoredLine(line: Structs.Line, color: Structs.Color) -> Structs.ColoredLine {
            let c_line = moveToCType(line)
            let c_color = moveToCType(color)
        return moveFromCType(smoke_Structs_createColoredLine(c_line.ref, c_color.ref))
    }
    public static func returnColoredLine(input: Structs.ColoredLine) -> Structs.ColoredLine {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Structs_returnColoredLine(c_input.ref))
    }
    public static func returnAllTypesStruct(input: Structs.AllTypesStruct) -> Structs.AllTypesStruct {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Structs_returnAllTypesStruct(c_input.ref))
    }
    public static func modifyAllTypesStruct(input: Structs.AllTypesStruct) -> Structs.AllTypesStruct {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_Structs_modifyAllTypesStruct(c_input.ref))
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
    return Structs(cStructs: smoke_Structs_copy_handle(handle))
}
internal func StructsmoveFromCType(_ handle: _baseRef) -> Structs {
    return Structs(cStructs: handle)
}
internal func StructscopyFromCType(_ handle: _baseRef) -> Structs? {
    guard handle != 0 else {
        return nil
    }
    return StructsmoveFromCType(handle) as Structs
}
internal func StructsmoveFromCType(_ handle: _baseRef) -> Structs? {
    guard handle != 0 else {
        return nil
    }
    return StructsmoveFromCType(handle) as Structs
}
internal func copyToCType(_ swiftClass: Structs) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Structs) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Structs?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Structs?) -> RefHolder {
    return getRef(swiftClass, owning: true)
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
internal func copyToCType(_ swiftType: Structs.Point) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.Point) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_Point_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.Point? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Structs_Point_unwrap_optional_handle(handle)
    return Structs.Point(cHandle: unwrappedHandle) as Structs.Point
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.Point? {
    defer {
        smoke_Structs_Point_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.Point?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Structs_Point_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.Point?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_Point_release_optional_handle)
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
internal func copyToCType(_ swiftType: Structs.Color) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.Color) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_Color_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.Color? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Structs_Color_unwrap_optional_handle(handle)
    return Structs.Color(cHandle: unwrappedHandle) as Structs.Color
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.Color? {
    defer {
        smoke_Structs_Color_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.Color?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Structs_Color_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.Color?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_Color_release_optional_handle)
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
internal func copyToCType(_ swiftType: Structs.Line) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.Line) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_Line_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.Line? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Structs_Line_unwrap_optional_handle(handle)
    return Structs.Line(cHandle: unwrappedHandle) as Structs.Line
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.Line? {
    defer {
        smoke_Structs_Line_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.Line?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Structs_Line_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.Line?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_Line_release_optional_handle)
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
internal func copyToCType(_ swiftType: Structs.ColoredLine) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.ColoredLine) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_ColoredLine_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.ColoredLine? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Structs_ColoredLine_unwrap_optional_handle(handle)
    return Structs.ColoredLine(cHandle: unwrappedHandle) as Structs.ColoredLine
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.ColoredLine? {
    defer {
        smoke_Structs_ColoredLine_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.ColoredLine?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Structs_ColoredLine_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.ColoredLine?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_ColoredLine_release_optional_handle)
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
internal func copyToCType(_ swiftType: Structs.AllTypesStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.AllTypesStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_AllTypesStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.AllTypesStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Structs_AllTypesStruct_unwrap_optional_handle(handle)
    return Structs.AllTypesStruct(cHandle: unwrappedHandle) as Structs.AllTypesStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.AllTypesStruct? {
    defer {
        smoke_Structs_AllTypesStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.AllTypesStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Structs_AllTypesStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.AllTypesStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_AllTypesStruct_release_optional_handle)
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
internal func copyToCType(_ swiftType: Structs.ExternalStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.ExternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_ExternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.ExternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Structs_ExternalStruct_unwrap_optional_handle(handle)
    return Structs.ExternalStruct(cHandle: unwrappedHandle) as Structs.ExternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.ExternalStruct? {
    defer {
        smoke_Structs_ExternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.ExternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Structs_ExternalStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.ExternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_ExternalStruct_release_optional_handle)
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
internal func copyToCType(_ swiftType: Structs.AnotherExternalStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.AnotherExternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_AnotherExternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.AnotherExternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Structs_AnotherExternalStruct_unwrap_optional_handle(handle)
    return Structs.AnotherExternalStruct(cHandle: unwrappedHandle) as Structs.AnotherExternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.AnotherExternalStruct? {
    defer {
        smoke_Structs_AnotherExternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.AnotherExternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Structs_AnotherExternalStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.AnotherExternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_AnotherExternalStruct_release_optional_handle)
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
internal func copyToCType(_ swiftType: Structs.YetAnotherExternalStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.YetAnotherExternalStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_YetAnotherExternalStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.YetAnotherExternalStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Structs_YetAnotherExternalStruct_unwrap_optional_handle(handle)
    return Structs.YetAnotherExternalStruct(cHandle: unwrappedHandle) as Structs.YetAnotherExternalStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.YetAnotherExternalStruct? {
    defer {
        smoke_Structs_YetAnotherExternalStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.YetAnotherExternalStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_Structs_YetAnotherExternalStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.YetAnotherExternalStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Structs_YetAnotherExternalStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: Structs.FooBar) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Structs.FooBar) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Structs.FooBar?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Structs.FooBar?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Structs.FooBar {
    return Structs.FooBar(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Structs.FooBar {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.FooBar? {
    guard handle != 0 else {
        return nil
    }
    return Structs.FooBar(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.FooBar? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}