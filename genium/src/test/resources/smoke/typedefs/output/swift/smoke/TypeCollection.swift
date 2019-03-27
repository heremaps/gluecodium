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
        x = moveFromCType(smoke_TypeCollection_Point_x_get(cHandle))
        y = moveFromCType(smoke_TypeCollection_Point_y_get(cHandle))
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
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_TypeCollection_Point_create_handle(c_x.ref, c_y.ref))
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
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_TypeCollection_Point_create_optional_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: Point?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Point_release_optional_handle)
}
public struct StructHavingAliasFieldDefinedBelow {
    public var field: StorageId
    public init(field: StorageId) {
        self.field = field
    }
    internal init(cHandle: _baseRef) {
        field = moveFromCType(smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_field_get(cHandle))
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
internal func copyToCType(_ swiftType: StructHavingAliasFieldDefinedBelow) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: StructHavingAliasFieldDefinedBelow) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructHavingAliasFieldDefinedBelow? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_unwrap_optional_handle(handle)
    return StructHavingAliasFieldDefinedBelow(cHandle: unwrappedHandle) as StructHavingAliasFieldDefinedBelow
}
internal func moveFromCType(_ handle: _baseRef) -> StructHavingAliasFieldDefinedBelow? {
    defer {
        smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructHavingAliasFieldDefinedBelow?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: StructHavingAliasFieldDefinedBelow?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_release_optional_handle)
}
public struct TypeCollection {
    public static let invalidStorageId: StorageId = 0
}