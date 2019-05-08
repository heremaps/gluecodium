//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
public struct Vector {
    public var x: Double
    public var y: Double
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    internal init(cHandle: _baseRef) {
        x = moveFromCType(smoke_StructsWithMethods_Vector_x_get(cHandle))
        y = moveFromCType(smoke_StructsWithMethods_Vector_y_get(cHandle))
    }
    public func distanceTo(other: Vector) -> Double {
        let c_self_handle = moveToCType(self)
        let c_other = moveToCType(other)
        return moveFromCType(smoke_StructsWithMethods_Vector_distanceTo(c_self_handle.ref, c_other.ref))
    }
    public func add(other: Vector) -> Vector {
        let c_self_handle = moveToCType(self)
        let c_other = moveToCType(other)
        return moveFromCType(smoke_StructsWithMethods_Vector_add(c_self_handle.ref, c_other.ref))
    }
    public static func validate(x: Double, y: Double) -> Bool {
        let c_x = moveToCType(x)
        let c_y = moveToCType(y)
        return moveFromCType(smoke_StructsWithMethods_Vector_validate(c_x.ref, c_y.ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> Vector {
    return Vector(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Vector {
    defer {
        smoke_StructsWithMethods_Vector_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Vector) -> RefHolder {
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_StructsWithMethods_Vector_create_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: Vector) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructsWithMethods_Vector_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Vector? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructsWithMethods_Vector_unwrap_optional_handle(handle)
    return Vector(cHandle: unwrappedHandle) as Vector
}
internal func moveFromCType(_ handle: _baseRef) -> Vector? {
    defer {
        smoke_StructsWithMethods_Vector_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Vector?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_StructsWithMethods_Vector_create_optional_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: Vector?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructsWithMethods_Vector_release_optional_handle)
}
