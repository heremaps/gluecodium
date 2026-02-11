//

//

import Foundation

public class CachedProperties {



    public private(set) lazy var cachedProperty: [String] = {
        let c_result_handle = smoke_CachedProperties_cachedProperty_get(self.c_instance)
        return foobar_moveFromCType(c_result_handle)
    }()

    internal private(set) lazy var internalCachedProperty: [String] = {
        let c_result_handle = smoke_CachedProperties_internalCachedProperty_get(self.c_instance)
        return foobar_moveFromCType(c_result_handle)
    }()

    public private(set) static var staticCachedProperty: Data = {
        let c_result_handle = smoke_CachedProperties_staticCachedProperty_get()
        return moveFromCType(c_result_handle)
    }()

    internal private(set) static var internalStaticCachedProperty: Data = {
        let c_result_handle = smoke_CachedProperties_internalStaticCachedProperty_get()
        return moveFromCType(c_result_handle)
    }()
    let c_instance : _baseRef

    init(cCachedProperties: _baseRef) {
        guard cCachedProperties != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCachedProperties
    }

    deinit {
        smoke_CachedProperties_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_CachedProperties_release_handle(c_instance)
    }


}



internal func getRef(_ ref: CachedProperties?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CachedProperties_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CachedProperties_release_handle)
        : RefHolder(handle_copy)
}

extension CachedProperties: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension CachedProperties: Hashable {
    /// :nodoc:
    public static func == (lhs: CachedProperties, rhs: CachedProperties) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }

    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}

internal func CachedProperties_copyFromCType(_ handle: _baseRef) -> CachedProperties {
    if let swift_pointer = smoke_CachedProperties_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CachedProperties {
        return re_constructed
    }
    let result = CachedProperties(cCachedProperties: smoke_CachedProperties_copy_handle(handle))
    smoke_CachedProperties_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func CachedProperties_moveFromCType(_ handle: _baseRef) -> CachedProperties {
    if let swift_pointer = smoke_CachedProperties_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CachedProperties {
        smoke_CachedProperties_release_handle(handle)
        return re_constructed
    }
    let result = CachedProperties(cCachedProperties: handle)
    smoke_CachedProperties_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func CachedProperties_copyFromCType(_ handle: _baseRef) -> CachedProperties? {
    guard handle != 0 else {
        return nil
    }
    return CachedProperties_moveFromCType(handle) as CachedProperties
}
internal func CachedProperties_moveFromCType(_ handle: _baseRef) -> CachedProperties? {
    guard handle != 0 else {
        return nil
    }
    return CachedProperties_moveFromCType(handle) as CachedProperties
}

internal func copyToCType(_ swiftClass: CachedProperties) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: CachedProperties) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftClass: CachedProperties?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: CachedProperties?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}



