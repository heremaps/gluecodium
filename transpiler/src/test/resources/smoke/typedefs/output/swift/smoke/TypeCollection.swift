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

public typealias PointTypeDef = Point
public typealias StorageId = UInt64
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
public struct StructHavingAliasFieldDefinedBelow {
    public var field: StorageId

    public init(field: StorageId) {
        self.field = field
    }

    internal init?(cStructHavingAliasFieldDefinedBelow: _baseRef) {
        field = smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_field_get(cStructHavingAliasFieldDefinedBelow)
    }

    internal func convertToCType() -> _baseRef {
        let result = smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_create()
        fillFunction(result)
        return result
    }

    internal func fillFunction(_ cStructHavingAliasFieldDefinedBelow: _baseRef) -> Void {
        smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_field_set(cStructHavingAliasFieldDefinedBelow, field)
    }
}
