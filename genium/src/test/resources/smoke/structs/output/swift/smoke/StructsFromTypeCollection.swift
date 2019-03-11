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
        let inputHandle = input.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(inputHandle)
        }
        let cResult = smoke_StructsFromTypeCollection_swapPointCoordinates(inputHandle)
        defer {
            smoke_TypeCollection_Point_release(cResult)
        }
        return Point(cPoint: cResult)
    }

    public static func createLine(pointA: Point, pointB: Point) -> Line? {
        let pointAHandle = pointA.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(pointAHandle)
        }
        let pointBHandle = pointB.convertToCType()
        defer {
            smoke_TypeCollection_Point_release(pointBHandle)
        }
        let cResult = smoke_StructsFromTypeCollection_createLine(pointAHandle, pointBHandle)
        defer {
            smoke_TypeCollection_Line_release(cResult)
        }
        return Line(cLine: cResult)
    }

    public static func createColoredLine(line: Line, color: Color) -> ColoredLine? {
        let lineHandle = line.convertToCType()
        defer {
            smoke_TypeCollection_Line_release(lineHandle)
        }
        let colorHandle = color.convertToCType()
        defer {
            smoke_TypeCollection_Color_release(colorHandle)
        }
        let cResult = smoke_StructsFromTypeCollection_createColoredLine(lineHandle, colorHandle)
        defer {
            smoke_TypeCollection_ColoredLine_release(cResult)
        }
        return ColoredLine(cColoredLine: cResult)
    }

    public static func modifyAllTypesStruct(input: AllTypesStruct) -> AllTypesStruct? {
        let inputHandle = input.convertToCType()
        defer {
            smoke_TypeCollection_AllTypesStruct_release(inputHandle)
        }
        let cResult = smoke_StructsFromTypeCollection_modifyAllTypesStruct(inputHandle)
        defer {
            smoke_TypeCollection_AllTypesStruct_release(cResult)
        }
        return AllTypesStruct(cAllTypesStruct: cResult)
    }

}

extension StructsFromTypeCollection: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
