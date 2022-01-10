//
//
import Foundation
public struct LocaleDefaults {
    public var english: Locale
    public var latAmSpanish: Locale
    public var romanshSursilvan: Locale
    public var serbianCyrillic: Locale
    public var traditionalChineseTaiwan: Locale
    public var zuerichGerman: Locale
    public init(english: Locale = Locale(identifier: "en"), latAmSpanish: Locale = Locale(identifier: "es-419"), romanshSursilvan: Locale = Locale(identifier: "rm-sursilv"), serbianCyrillic: Locale = Locale(identifier: "sr-Cyrl"), traditionalChineseTaiwan: Locale = Locale(identifier: "nan-Hant-TW"), zuerichGerman: Locale = Locale(identifier: "gsw-u-sd-chzh")) {
        self.english = english
        self.latAmSpanish = latAmSpanish
        self.romanshSursilvan = romanshSursilvan
        self.serbianCyrillic = serbianCyrillic
        self.traditionalChineseTaiwan = traditionalChineseTaiwan
        self.zuerichGerman = zuerichGerman
    }
    internal init(cHandle: _baseRef) {
        english = moveFromCType(smoke_LocaleDefaults_english_get(cHandle))
        latAmSpanish = moveFromCType(smoke_LocaleDefaults_latAmSpanish_get(cHandle))
        romanshSursilvan = moveFromCType(smoke_LocaleDefaults_romanshSursilvan_get(cHandle))
        serbianCyrillic = moveFromCType(smoke_LocaleDefaults_serbianCyrillic_get(cHandle))
        traditionalChineseTaiwan = moveFromCType(smoke_LocaleDefaults_traditionalChineseTaiwan_get(cHandle))
        zuerichGerman = moveFromCType(smoke_LocaleDefaults_zuerichGerman_get(cHandle))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> LocaleDefaults {
    return LocaleDefaults(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> LocaleDefaults {
    defer {
        smoke_LocaleDefaults_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: LocaleDefaults) -> RefHolder {
    let c_english = moveToCType(swiftType.english)
    let c_latAmSpanish = moveToCType(swiftType.latAmSpanish)
    let c_romanshSursilvan = moveToCType(swiftType.romanshSursilvan)
    let c_serbianCyrillic = moveToCType(swiftType.serbianCyrillic)
    let c_traditionalChineseTaiwan = moveToCType(swiftType.traditionalChineseTaiwan)
    let c_zuerichGerman = moveToCType(swiftType.zuerichGerman)
    return RefHolder(smoke_LocaleDefaults_create_handle(c_english.ref, c_latAmSpanish.ref, c_romanshSursilvan.ref, c_serbianCyrillic.ref, c_traditionalChineseTaiwan.ref, c_zuerichGerman.ref))
}
internal func moveToCType(_ swiftType: LocaleDefaults) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_LocaleDefaults_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> LocaleDefaults? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_LocaleDefaults_unwrap_optional_handle(handle)
    return LocaleDefaults(cHandle: unwrappedHandle) as LocaleDefaults
}
internal func moveFromCType(_ handle: _baseRef) -> LocaleDefaults? {
    defer {
        smoke_LocaleDefaults_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: LocaleDefaults?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_english = moveToCType(swiftType.english)
    let c_latAmSpanish = moveToCType(swiftType.latAmSpanish)
    let c_romanshSursilvan = moveToCType(swiftType.romanshSursilvan)
    let c_serbianCyrillic = moveToCType(swiftType.serbianCyrillic)
    let c_traditionalChineseTaiwan = moveToCType(swiftType.traditionalChineseTaiwan)
    let c_zuerichGerman = moveToCType(swiftType.zuerichGerman)
    return RefHolder(smoke_LocaleDefaults_create_optional_handle(c_english.ref, c_latAmSpanish.ref, c_romanshSursilvan.ref, c_serbianCyrillic.ref, c_traditionalChineseTaiwan.ref, c_zuerichGerman.ref))
}
internal func moveToCType(_ swiftType: LocaleDefaults?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_LocaleDefaults_release_optional_handle)
}
