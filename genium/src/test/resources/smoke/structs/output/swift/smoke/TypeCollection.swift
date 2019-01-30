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
        x = moveFromCType(smoke_TypeCollection_Point_x_get(cHandle))
        y = moveFromCType(smoke_TypeCollection_Point_y_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let c_x = moveToCType(x)
        let c_y = moveToCType(y)
        return smoke_TypeCollection_Point_create_handle(c_x.ref, c_y.ref)
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
internal func copyToCType(_ swiftType: Point) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Point) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Point_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Point? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_Point_unwrap_optional_handle(handle)
    return Point(cHandle: unwrappedHandle) as Point
}
internal func moveFromCType(_ handle: _baseRef) -> Point? {
    defer {
        smoke_TypeCollection_Point_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Point?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_TypeCollection_Point_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Point?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Point_release_optional_handle)
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
        red = moveFromCType(smoke_TypeCollection_Color_red_get(cHandle))
        green = moveFromCType(smoke_TypeCollection_Color_green_get(cHandle))
        blue = moveFromCType(smoke_TypeCollection_Color_blue_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let c_red = moveToCType(red)
        let c_green = moveToCType(green)
        let c_blue = moveToCType(blue)
        return smoke_TypeCollection_Color_create_handle(c_red.ref, c_green.ref, c_blue.ref)
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
internal func copyToCType(_ swiftType: Color) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Color) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Color_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Color? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_Color_unwrap_optional_handle(handle)
    return Color(cHandle: unwrappedHandle) as Color
}
internal func moveFromCType(_ handle: _baseRef) -> Color? {
    defer {
        smoke_TypeCollection_Color_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Color?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_TypeCollection_Color_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Color?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Color_release_optional_handle)
}
public struct Line {
    public var a: Point
    public var b: Point
    public init(a: Point, b: Point) {
        self.a = a
        self.b = b
    }
    internal init(cHandle: _baseRef) {
        a = moveFromCType(smoke_TypeCollection_Line_a_get(cHandle))
        b = moveFromCType(smoke_TypeCollection_Line_b_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let c_a = moveToCType(a)
        let c_b = moveToCType(b)
        return smoke_TypeCollection_Line_create_handle(c_a.ref, c_b.ref)
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
internal func copyToCType(_ swiftType: Line) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Line) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Line_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Line? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_Line_unwrap_optional_handle(handle)
    return Line(cHandle: unwrappedHandle) as Line
}
internal func moveFromCType(_ handle: _baseRef) -> Line? {
    defer {
        smoke_TypeCollection_Line_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Line?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_TypeCollection_Line_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Line?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Line_release_optional_handle)
}
public struct ColoredLine {
    public var line: Line
    public var color: Color
    public init(line: Line, color: Color) {
        self.line = line
        self.color = color
    }
    internal init(cHandle: _baseRef) {
        line = moveFromCType(smoke_TypeCollection_ColoredLine_line_get(cHandle))
        color = moveFromCType(smoke_TypeCollection_ColoredLine_color_get(cHandle))
    }
    internal func convertToCType() -> _baseRef {
        let c_line = moveToCType(line)
        let c_color = moveToCType(color)
        return smoke_TypeCollection_ColoredLine_create_handle(c_line.ref, c_color.ref)
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
internal func copyToCType(_ swiftType: ColoredLine) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: ColoredLine) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_ColoredLine_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> ColoredLine? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_ColoredLine_unwrap_optional_handle(handle)
    return ColoredLine(cHandle: unwrappedHandle) as ColoredLine
}
internal func moveFromCType(_ handle: _baseRef) -> ColoredLine? {
    defer {
        smoke_TypeCollection_ColoredLine_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: ColoredLine?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_TypeCollection_ColoredLine_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: ColoredLine?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_ColoredLine_release_optional_handle)
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
        return smoke_TypeCollection_AllTypesStruct_create_handle(c_int8Field.ref, c_uint8Field.ref, c_int16Field.ref, c_uint16Field.ref, c_int32Field.ref, c_uint32Field.ref, c_int64Field.ref, c_uint64Field.ref, c_floatField.ref, c_doubleField.ref, c_stringField.ref, c_booleanField.ref, c_bytesField.ref, c_pointField.ref)
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
internal func copyToCType(_ swiftType: AllTypesStruct) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: AllTypesStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_AllTypesStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> AllTypesStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_AllTypesStruct_unwrap_optional_handle(handle)
    return AllTypesStruct(cHandle: unwrappedHandle) as AllTypesStruct
}
internal func moveFromCType(_ handle: _baseRef) -> AllTypesStruct? {
    defer {
        smoke_TypeCollection_AllTypesStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: AllTypesStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(smoke_TypeCollection_AllTypesStruct_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: AllTypesStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_AllTypesStruct_release_optional_handle)
}