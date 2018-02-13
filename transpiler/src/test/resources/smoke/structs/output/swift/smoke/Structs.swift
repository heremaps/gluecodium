//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: Structs) -> RefHolder {
    return RefHolder(ref.c_instance)
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
                guard
                    let aUnwrapped = Structs.Point(cPoint: smoke_Structs_Line_a_get(cLine))
                else {
                    return nil
                }
                a = aUnwrapped
            }
            do {
                guard
                    let bUnwrapped = Structs.Point(cPoint: smoke_Structs_Line_b_get(cLine))
                else {
                    return nil
                }
                b = bUnwrapped
            }
        }

        internal func convertToCType() -> _baseRef {
            let result = smoke_Structs_Line_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cLine: _baseRef) -> Void {
            let aHandle = smoke_Structs_Line_a_get(cLine)
            a.fillFunction(aHandle)
            let bHandle = smoke_Structs_Line_b_get(cLine)
            b.fillFunction(bHandle)
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
                guard
                    let lineUnwrapped = Structs.Line(cLine: smoke_Structs_ColoredLine_line_get(cColoredLine))
                else {
                    return nil
                }
                line = lineUnwrapped
            }
            do {
                guard
                    let colorUnwrapped = Structs.Color(cColor: smoke_Structs_ColoredLine_color_get(cColoredLine))
                else {
                    return nil
                }
                color = colorUnwrapped
            }
        }

        internal func convertToCType() -> _baseRef {
            let result = smoke_Structs_ColoredLine_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cColoredLine: _baseRef) -> Void {
            let lineHandle = smoke_Structs_ColoredLine_line_get(cColoredLine)
            line.fillFunction(lineHandle)
            let colorHandle = smoke_Structs_ColoredLine_color_get(cColoredLine)
            color.fillFunction(colorHandle)
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
                let stringFieldHandle = smoke_Structs_AllTypesStruct_stringField_get(cAllTypesStruct)
                stringField = String(cString:std_string_data_get(stringFieldHandle))
            }
            booleanField = smoke_Structs_AllTypesStruct_booleanField_get(cAllTypesStruct)
            do {
                let bytesFieldFieldHandle = smoke_Structs_AllTypesStruct_bytesField_get(cAllTypesStruct)
                guard
                    let dataHandle = byteArray_data_get(bytesFieldFieldHandle)
                else {
                    return nil
                }
                bytesField = Data(bytes: dataHandle, count: Int(byteArray_size_get(bytesFieldFieldHandle)))
            }
            do {
                guard
                    let pointFieldUnwrapped = Structs.Point(cPoint: smoke_Structs_AllTypesStruct_pointField_get(cAllTypesStruct))
                else {
                    return nil
                }
                pointField = pointFieldUnwrapped
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
            let pointFieldHandle = smoke_Structs_AllTypesStruct_pointField_get(cAllTypesStruct)
            pointField.fillFunction(pointFieldHandle)
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
        let inputHandle = input.convertToCType()
        defer {
            smoke_Structs_Point_release(inputHandle)
        }
        let cResult = smoke_Structs_swapPointCoordinates(inputHandle)
        defer {
            smoke_Structs_Point_release(cResult)
        }
        return Structs.Point(cPoint: cResult)
    }

    public static func createLine(pointA: Structs.Point, pointB: Structs.Point) -> Structs.Line? {
        let pointAHandle = pointA.convertToCType()
        defer {
            smoke_Structs_Point_release(pointAHandle)
        }
        let pointBHandle = pointB.convertToCType()
        defer {
            smoke_Structs_Point_release(pointBHandle)
        }
        let cResult = smoke_Structs_createLine(pointAHandle, pointBHandle)
        defer {
            smoke_Structs_Line_release(cResult)
        }
        return Structs.Line(cLine: cResult)
    }

    public static func createColoredLine(line: Structs.Line, color: Structs.Color) -> Structs.ColoredLine? {
        let lineHandle = line.convertToCType()
        defer {
            smoke_Structs_Line_release(lineHandle)
        }
        let colorHandle = color.convertToCType()
        defer {
            smoke_Structs_Color_release(colorHandle)
        }
        let cResult = smoke_Structs_createColoredLine(lineHandle, colorHandle)
        defer {
            smoke_Structs_ColoredLine_release(cResult)
        }
        return Structs.ColoredLine(cColoredLine: cResult)
    }

    public static func returnColoredLine(input: Structs.ColoredLine) -> Structs.ColoredLine? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_Structs_ColoredLine_release(inputHandle)
        }
        let cResult = smoke_Structs_returnColoredLine(inputHandle)
        defer {
            smoke_Structs_ColoredLine_release(cResult)
        }
        return Structs.ColoredLine(cColoredLine: cResult)
    }

    public static func returnAllTypesStruct(input: Structs.AllTypesStruct) -> Structs.AllTypesStruct? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_Structs_AllTypesStruct_release(inputHandle)
        }
        let cResult = smoke_Structs_returnAllTypesStruct(inputHandle)
        defer {
            smoke_Structs_AllTypesStruct_release(cResult)
        }
        return Structs.AllTypesStruct(cAllTypesStruct: cResult)
    }

    public static func modifyAllTypesStruct(input: Structs.AllTypesStruct) -> Structs.AllTypesStruct? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_Structs_AllTypesStruct_release(inputHandle)
        }
        let cResult = smoke_Structs_modifyAllTypesStruct(inputHandle)
        defer {
            smoke_Structs_AllTypesStruct_release(cResult)
        }
        return Structs.AllTypesStruct(cAllTypesStruct: cResult)
    }

}

extension Structs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
