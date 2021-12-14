//
//
import Foundation
public struct DurationDefaults {
    public var dayz: TimeInterval
    public var hourz: TimeInterval
    public var minutez: TimeInterval
    public var secondz: TimeInterval
    public var milliz: TimeInterval
    public var microz: TimeInterval
    public var nanoz: TimeInterval
    public init(dayz: TimeInterval = 28 * 86400, hourz: TimeInterval = 22 * 3600, minutez: TimeInterval = 45 * 60, secondz: TimeInterval = 42, milliz: TimeInterval = 500 * 0.001, microz: TimeInterval = 665 * 1.0E-6, nanoz: TimeInterval = 314635 * 1.0E-9) {
        self.dayz = dayz
        self.hourz = hourz
        self.minutez = minutez
        self.secondz = secondz
        self.milliz = milliz
        self.microz = microz
        self.nanoz = nanoz
    }
    internal init(cHandle: _baseRef) {
        dayz = moveFromCType(smoke_DurationDefaults_dayz_get(cHandle))
        hourz = moveFromCType(smoke_DurationDefaults_hourz_get(cHandle))
        minutez = moveFromCType(smoke_DurationDefaults_minutez_get(cHandle))
        secondz = moveFromCType(smoke_DurationDefaults_secondz_get(cHandle))
        milliz = moveFromCType(smoke_DurationDefaults_milliz_get(cHandle))
        microz = moveFromCType(smoke_DurationDefaults_microz_get(cHandle))
        nanoz = moveFromCType(smoke_DurationDefaults_nanoz_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> DurationDefaults {
    return DurationDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DurationDefaults {
    defer {
        smoke_DurationDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DurationDefaults) -> RefHolder {
    let c_dayz = moveToCType(swiftType.dayz)
    let c_hourz = moveToCType(swiftType.hourz)
    let c_minutez = moveToCType(swiftType.minutez)
    let c_secondz = moveToCType(swiftType.secondz)
    let c_milliz = moveToCType(swiftType.milliz)
    let c_microz = moveToCType(swiftType.microz)
    let c_nanoz = moveToCType(swiftType.nanoz)
    return RefHolder(smoke_DurationDefaults_create_handle(c_dayz.ref, c_hourz.ref, c_minutez.ref, c_secondz.ref, c_milliz.ref, c_microz.ref, c_nanoz.ref))
}
internal func moveToCType(_ swiftType: DurationDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DurationDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DurationDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DurationDefaults_unwrap_optional_handle(handle)
    return DurationDefaults(cHandle: unwrappedHandle) as DurationDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> DurationDefaults? {
    defer {
        smoke_DurationDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DurationDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_dayz = moveToCType(swiftType.dayz)
    let c_hourz = moveToCType(swiftType.hourz)
    let c_minutez = moveToCType(swiftType.minutez)
    let c_secondz = moveToCType(swiftType.secondz)
    let c_milliz = moveToCType(swiftType.milliz)
    let c_microz = moveToCType(swiftType.microz)
    let c_nanoz = moveToCType(swiftType.nanoz)
    return RefHolder(smoke_DurationDefaults_create_optional_handle(c_dayz.ref, c_hourz.ref, c_minutez.ref, c_secondz.ref, c_milliz.ref, c_microz.ref, c_nanoz.ref))
}
internal func moveToCType(_ swiftType: DurationDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DurationDefaults_release_optional_handle)
}
