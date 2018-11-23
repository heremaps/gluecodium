//
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
    internal init(cPoint: _baseRef) {
        x = smoke_TypeCollection_Point_x_get(cPoint)
        y = smoke_TypeCollection_Point_y_get(cPoint)
    }
    internal func convertToCType() -> _baseRef {
        let x_handle = x
        let y_handle = y
        return smoke_TypeCollection_Point_create_handle(x_handle, y_handle)
    }
}
public struct StructHavingAliasFieldDefinedBelow {
    public var field: StorageId
    public init(field: StorageId) {
        self.field = field
    }
    internal init(cStructHavingAliasFieldDefinedBelow: _baseRef) {
        field = smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_field_get(cStructHavingAliasFieldDefinedBelow)
    }
    internal func convertToCType() -> _baseRef {
        let field_handle = field
        return smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_create_handle(field_handle)
    }
}
public struct TypeCollection {
    public static let invalidStorageId: StorageId = 0
}
