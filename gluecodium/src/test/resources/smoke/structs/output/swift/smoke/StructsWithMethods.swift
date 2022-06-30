//
//
import Foundation
public struct StructsWithMethods {
    public struct Vector {
        public var x: Double
        public var y: Double
        internal init(cHandle: _baseRef) {
            x = moveFromCType(smoke_StructsWithMethods_Vector_x_get(cHandle))
            y = moveFromCType(smoke_StructsWithMethods_Vector_y_get(cHandle))
        }
        public init(x: Double, y: Double) {
            let _result_handle = StructsWithMethods.Vector.create(x: x, y: y)
            guard _result_handle != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            let _result: StructsWithMethods.Vector = moveFromCType(_result_handle)
            self.x = _result.x
            self.y = _result.y
        }
        public init(other: StructsWithMethods.Vector) throws {
            let _result_handle = try StructsWithMethods.Vector.create(other: other)
            guard _result_handle != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            let _result: StructsWithMethods.Vector = moveFromCType(_result_handle)
            self.x = _result.x
            self.y = _result.y
        }
        public func distanceTo(other: StructsWithMethods.Vector) -> Double {
            let c_self_handle = moveToCType(self)
            let c_other = moveToCType(other)
            let c_result_handle = smoke_StructsWithMethods_Vector_distanceTo(c_self_handle.ref, c_other.ref)
            return moveFromCType(c_result_handle)
        }
        public func add(other: StructsWithMethods.Vector) -> StructsWithMethods.Vector {
            let c_self_handle = moveToCType(self)
            let c_other = moveToCType(other)
            let c_result_handle = smoke_StructsWithMethods_Vector_add(c_self_handle.ref, c_other.ref)
            return moveFromCType(c_result_handle)
        }
        public static func validate(x: Double, y: Double) -> Bool {
            let c_x = moveToCType(x)
            let c_y = moveToCType(y)
            let c_result_handle = smoke_StructsWithMethods_Vector_validate(c_x.ref, c_y.ref)
            return moveFromCType(c_result_handle)
        }
        private static func create(x: Double, y: Double) -> _baseRef {
            let c_x = moveToCType(x)
            let c_y = moveToCType(y)
            let c_result_handle = smoke_StructsWithMethods_Vector_create_Double_Double(c_x.ref, c_y.ref)
            return moveFromCType(c_result_handle)
        }
        private static func create(other: StructsWithMethods.Vector) throws -> _baseRef {
            let c_other = moveToCType(other)
            let RESULT = smoke_StructsWithMethods_Vector_create_Vector(c_other.ref)
            if (!RESULT.has_value) {
                throw moveFromCType(RESULT.error_value) as ValidationUtils.ValidationError
            }
            let c_result_handle = RESULT.returned_value
            return moveFromCType(c_result_handle)
        }
    }
}
internal func copyFromCType(_ handle: _baseRef) -> StructsWithMethods.Vector {
    return StructsWithMethods.Vector(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> StructsWithMethods.Vector {
    defer {
        smoke_StructsWithMethods_Vector_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructsWithMethods.Vector) -> RefHolder {
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_StructsWithMethods_Vector_create_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: StructsWithMethods.Vector) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructsWithMethods_Vector_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> StructsWithMethods.Vector? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_StructsWithMethods_Vector_unwrap_optional_handle(handle)
    return StructsWithMethods.Vector(cHandle: unwrappedHandle) as StructsWithMethods.Vector
}
internal func moveFromCType(_ handle: _baseRef) -> StructsWithMethods.Vector? {
    defer {
        smoke_StructsWithMethods_Vector_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: StructsWithMethods.Vector?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_StructsWithMethods_Vector_create_optional_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: StructsWithMethods.Vector?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_StructsWithMethods_Vector_release_optional_handle)
}
