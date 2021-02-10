//
//
import Foundation
public struct FreePoint {
    public static let aBar: FreeEnum = FreeEnum.bar
    public var x: Double
    public var y: Double
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    internal init(cHandle: _baseRef) {
        x = moveFromCType(smoke_FreePoint_x_get(cHandle))
        y = moveFromCType(smoke_FreePoint_y_get(cHandle))
    }
    public func flip() -> FreePoint {
        let c_self_handle = foobar_moveToCType(self)
        return foobar_moveFromCType(smoke_FreePoint_flip(c_self_handle.ref))
    }
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> FreePoint {
    return FreePoint(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> FreePoint {
    defer {
        smoke_FreePoint_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: FreePoint) -> RefHolder {
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_FreePoint_create_handle(c_x.ref, c_y.ref))
}
internal func foobar_moveToCType(_ swiftType: FreePoint) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_FreePoint_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> FreePoint? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_FreePoint_unwrap_optional_handle(handle)
    return FreePoint(cHandle: unwrappedHandle) as FreePoint
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> FreePoint? {
    defer {
        smoke_FreePoint_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: FreePoint?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_FreePoint_create_optional_handle(c_x.ref, c_y.ref))
}
internal func foobar_moveToCType(_ swiftType: FreePoint?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_FreePoint_release_optional_handle)
}
