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
    internal init(cHandle: _baseRef) {
        x = smoke_TypeCollection_Point_x_get(cHandle)
        y = smoke_TypeCollection_Point_y_get(cHandle)
    }
    internal func convertToCType() -> _baseRef {
        let x_handle = x
        let y_handle = y
        return smoke_TypeCollection_Point_create_handle(x_handle, y_handle)
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
public struct StructHavingAliasFieldDefinedBelow {
    public var field: StorageId
    public init(field: StorageId) {
        self.field = field
    }
    internal init(cHandle: _baseRef) {
        field = smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_field_get(cHandle)
    }
    internal func convertToCType() -> _baseRef {
        let field_handle = field
        return smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_create_handle(field_handle)
    }
}
internal func copyFromCType(_ handle: _baseRef) -> StructHavingAliasFieldDefinedBelow {
    return StructHavingAliasFieldDefinedBelow(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> StructHavingAliasFieldDefinedBelow {
    defer {
        smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_release_handle(handle)
    }
    return copyFromCType(handle)
}
public struct TypeCollection {
    public static let invalidStorageId: StorageId = 0
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection {
    return TypeCollection()
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection {
    return copyFromCType(handle)
}