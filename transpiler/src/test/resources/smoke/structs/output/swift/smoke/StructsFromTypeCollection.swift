//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation




public class StructsFromTypeCollection {

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
