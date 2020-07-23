//
//
import Foundation
internal struct PseudoColor_internal {
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
        red = moveFromCType(smoke_PseudoColor_red_get(cHandle))
        green = moveFromCType(smoke_PseudoColor_green_get(cHandle))
        blue = moveFromCType(smoke_PseudoColor_blue_get(cHandle))
        alpha = moveFromCType(smoke_PseudoColor_alpha_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> PseudoColor {
    return ColorConverter.convertFromInternal(PseudoColor_internal(cHandle: handle))
}
internal func moveFromCType(_ handle: _baseRef) -> PseudoColor {
    defer {
        smoke_PseudoColor_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType_ext: PseudoColor) -> RefHolder {
    let swiftType = ColorConverter.convertToInternal(swiftType_ext)
    let c_red = moveToCType(swiftType.red)
    let c_green = moveToCType(swiftType.green)
    let c_blue = moveToCType(swiftType.blue)
    let c_alpha = moveToCType(swiftType.alpha)
    return RefHolder(smoke_PseudoColor_create_handle(c_red.ref, c_green.ref, c_blue.ref, c_alpha.ref))
}
internal func moveToCType(_ swiftType: PseudoColor) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PseudoColor_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> PseudoColor? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_PseudoColor_unwrap_optional_handle(handle)
    return ColorConverter.convertFromInternal(PseudoColor_internal(cHandle: unwrappedHandle))
}
internal func moveFromCType(_ handle: _baseRef) -> PseudoColor? {
    defer {
        smoke_PseudoColor_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType_ext: PseudoColor?) -> RefHolder {
    guard let swiftType_ext = swiftType_ext else {
        return RefHolder(0)
    }
    let swiftType = ColorConverter.convertToInternal(swiftType_ext)
    let c_red = moveToCType(swiftType.red)
    let c_green = moveToCType(swiftType.green)
    let c_blue = moveToCType(swiftType.blue)
    let c_alpha = moveToCType(swiftType.alpha)
    return RefHolder(smoke_PseudoColor_create_optional_handle(c_red.ref, c_green.ref, c_blue.ref, c_alpha.ref))
}
internal func moveToCType(_ swiftType: PseudoColor?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_PseudoColor_release_optional_handle)
}
