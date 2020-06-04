//
//
import Foundation
public class Locales {
    public typealias LocaleTypeDef = Locale
    public typealias LocaleArray = [Locale]
    public typealias LocaleMap = [String: Locale]
    public var localeProperty: Locale {
        get {
            return moveFromCType(smoke_Locales_localeProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Locales_localeProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cLocales: _baseRef) {
        guard cLocales != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cLocales
    }
    deinit {
        smoke_Locales_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_Locales_release_handle(c_instance)
    }
    public struct LocaleStruct {
        public var localeField: Locale
        public init(localeField: Locale) {
            self.localeField = localeField
        }
        internal init(cHandle: _baseRef) {
            localeField = moveFromCType(smoke_Locales_LocaleStruct_localeField_get(cHandle))
        }
    }
    public func localeMethod(input: Locale) -> Locale {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Locales_localeMethod(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: Locales?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Locales_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Locales_release_handle)
        : RefHolder(handle_copy)
}
extension Locales: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func Locales_copyFromCType(_ handle: _baseRef) -> Locales {
    if let swift_pointer = smoke_Locales_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Locales {
        return re_constructed
    }
    let result = Locales(cLocales: smoke_Locales_copy_handle(handle))
    smoke_Locales_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Locales_moveFromCType(_ handle: _baseRef) -> Locales {
    if let swift_pointer = smoke_Locales_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Locales {
        return re_constructed
    }
    let result = Locales(cLocales: handle)
    smoke_Locales_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Locales_copyFromCType(_ handle: _baseRef) -> Locales? {
    guard handle != 0 else {
        return nil
    }
    return Locales_moveFromCType(handle) as Locales
}
internal func Locales_moveFromCType(_ handle: _baseRef) -> Locales? {
    guard handle != 0 else {
        return nil
    }
    return Locales_moveFromCType(handle) as Locales
}
internal func copyToCType(_ swiftClass: Locales) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Locales) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Locales?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Locales?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> Locales.LocaleStruct {
    return Locales.LocaleStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Locales.LocaleStruct {
    defer {
        smoke_Locales_LocaleStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Locales.LocaleStruct) -> RefHolder {
    let c_localeField = moveToCType(swiftType.localeField)
    return RefHolder(smoke_Locales_LocaleStruct_create_handle(c_localeField.ref))
}
internal func moveToCType(_ swiftType: Locales.LocaleStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Locales_LocaleStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Locales.LocaleStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Locales_LocaleStruct_unwrap_optional_handle(handle)
    return Locales.LocaleStruct(cHandle: unwrappedHandle) as Locales.LocaleStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Locales.LocaleStruct? {
    defer {
        smoke_Locales_LocaleStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Locales.LocaleStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_localeField = moveToCType(swiftType.localeField)
    return RefHolder(smoke_Locales_LocaleStruct_create_optional_handle(c_localeField.ref))
}
internal func moveToCType(_ swiftType: Locales.LocaleStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Locales_LocaleStruct_release_optional_handle)
}
