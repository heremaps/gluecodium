//
//
import Foundation
public struct TypeCollection {
    public static let invalidStorageId: TypeCollection.StorageId = 0
    public typealias PointTypeDef = TypeCollection.Point
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
    public struct StructHavingAliasFieldDefinedBelow {
        public var field: TypeCollection.StorageId
        public init(field: TypeCollection.StorageId) {
            self.field = field
        }
        internal init(cHandle: _baseRef) {
            field = moveFromCType(smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_field_get(cHandle))
        }
    }
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection.Point {
    return TypeCollection.Point(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection.Point {
    defer {
        smoke_TypeCollection_Point_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeCollection.Point) -> RefHolder {
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_TypeCollection_Point_create_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: TypeCollection.Point) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Point_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection.Point? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_Point_unwrap_optional_handle(handle)
    return TypeCollection.Point(cHandle: unwrappedHandle) as TypeCollection.Point
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection.Point? {
    defer {
        smoke_TypeCollection_Point_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeCollection.Point?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_TypeCollection_Point_create_optional_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: TypeCollection.Point?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_Point_release_optional_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection.StructHavingAliasFieldDefinedBelow {
    return TypeCollection.StructHavingAliasFieldDefinedBelow(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection.StructHavingAliasFieldDefinedBelow {
    defer {
        smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeCollection.StructHavingAliasFieldDefinedBelow) -> RefHolder {
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_create_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: TypeCollection.StructHavingAliasFieldDefinedBelow) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> TypeCollection.StructHavingAliasFieldDefinedBelow? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_unwrap_optional_handle(handle)
    return TypeCollection.StructHavingAliasFieldDefinedBelow(cHandle: unwrappedHandle) as TypeCollection.StructHavingAliasFieldDefinedBelow
}
internal func moveFromCType(_ handle: _baseRef) -> TypeCollection.StructHavingAliasFieldDefinedBelow? {
    defer {
        smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: TypeCollection.StructHavingAliasFieldDefinedBelow?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_field = moveToCType(swiftType.field)
    return RefHolder(smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_create_optional_handle(c_field.ref))
}
internal func moveToCType(_ swiftType: TypeCollection.StructHavingAliasFieldDefinedBelow?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_TypeCollection_StructHavingAliasFieldDefinedBelow_release_optional_handle)
}
