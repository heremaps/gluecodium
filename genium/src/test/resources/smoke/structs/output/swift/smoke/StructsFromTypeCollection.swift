//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: StructsFromTypeCollection?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class StructsFromTypeCollection {
    let c_instance : _baseRef

    public init?(cStructsFromTypeCollection: _baseRef) {
        guard cStructsFromTypeCollection != 0 else {
            return nil
        }
        c_instance = cStructsFromTypeCollection
    }

    deinit {
        smoke_StructsFromTypeCollection_release(c_instance)
    }
    public static func createPoint(x: Double, y: Double) -> Point? {
        let cResult = smoke_StructsFromTypeCollection_createPoint(x, y)
        defer {
            smoke_TypeCollection_Point_release(cResult)
        }
        return Point(cPoint: cResult)
    }

    public static func swapPointCoordinates(input: Point) -> Point? {
        let input_handle = input.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(input_handle)
        }
        let cResult = smoke_StructsFromTypeCollection_swapPointCoordinates(input_handle)
        defer {
            smoke_TypeCollection_Point_release(cResult)
        }
        return Point(cPoint: cResult)
    }

    public static func createLine(pointA: Point, pointB: Point) -> Line? {
        let pointA_handle = pointA.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(pointA_handle)
        }
        let pointB_handle = pointB.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(pointB_handle)
        }
        let cResult = smoke_StructsFromTypeCollection_createLine(pointA_handle, pointB_handle)
        defer {
            smoke_TypeCollection_Line_release(cResult)
        }
        return Line(cLine: cResult)
    }

    public static func createColoredLine(line: Line, color: Color) -> ColoredLine? {
        let line_handle = line.convertToCType()
        defer {
            smoke_TypeCollection_Line_release(line_handle)
        }
        let color_handle = color.convertToCType()
        defer {
            smoke_TypeCollection_Color_release(color_handle)
        }
        let cResult = smoke_StructsFromTypeCollection_createColoredLine(line_handle, color_handle)
        defer {
            smoke_TypeCollection_ColoredLine_release(cResult)
        }
        return ColoredLine(cColoredLine: cResult)
    }

    public static func modifyAllTypesStruct(input: AllTypesStruct) -> AllTypesStruct? {
        let input_handle = input.convertToCType()
        defer {
            smoke_TypeCollection_AllTypesStruct_release(input_handle)
        }
        let cResult = smoke_StructsFromTypeCollection_modifyAllTypesStruct(input_handle)
        defer {
            smoke_TypeCollection_AllTypesStruct_release(cResult)
        }
        return AllTypesStruct(cAllTypesStruct: cResult)
    }

}

extension StructsFromTypeCollection: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
