//
//
import Foundation
import UIKit
internal struct UIColor_internal {
    public var red: Float
    public var green: Float
    public var blue: Float
    public var alpha: Float
    internal init(red: Float, green: Float, blue: Float, alpha: Float) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    internal init(cHandle: _baseRef) {
        red = moveFromCType(smoke_UIColor_red_get(cHandle))
        green = moveFromCType(smoke_UIColor_green_get(cHandle))
        blue = moveFromCType(smoke_UIColor_blue_get(cHandle))
        alpha = moveFromCType(smoke_UIColor_alpha_get(cHandle))
    }
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> UIColor {
    return ColorConverter.convertFromInternal(UIColor_internal(cHandle: handle))
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> UIColor {
    defer {
        smoke_UIColor_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType_ext: UIColor) -> RefHolder {
    let swiftType = ColorConverter.convertToInternal(swiftType_ext)
    let c_red = moveToCType(swiftType.red)
    let c_green = moveToCType(swiftType.green)
    let c_blue = moveToCType(swiftType.blue)
    let c_alpha = moveToCType(swiftType.alpha)
    return RefHolder(smoke_UIColor_create_handle(c_red.ref, c_green.ref, c_blue.ref, c_alpha.ref))
}
internal func foobar_moveToCType(_ swiftType: UIColor) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_UIColor_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> UIColor? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_UIColor_unwrap_optional_handle(handle)
    return ColorConverter.convertFromInternal(UIColor_internal(cHandle: unwrappedHandle))
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> UIColor? {
    defer {
        smoke_UIColor_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType_ext: UIColor?) -> RefHolder {
    guard let swiftType_ext = swiftType_ext else {
        return RefHolder(0)
    }
    let swiftType = ColorConverter.convertToInternal(swiftType_ext)
    let c_red = moveToCType(swiftType.red)
    let c_green = moveToCType(swiftType.green)
    let c_blue = moveToCType(swiftType.blue)
    let c_alpha = moveToCType(swiftType.alpha)
    return RefHolder(smoke_UIColor_create_optional_handle(c_red.ref, c_green.ref, c_blue.ref, c_alpha.ref))
}
internal func foobar_moveToCType(_ swiftType: UIColor?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_UIColor_release_optional_handle)
}
