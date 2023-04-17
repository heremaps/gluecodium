//
//
import Foundation
public class FirstParentIsClassClass: ParentClass, ParentNarrowOne {
    public var parentPropertyOne: String {
        get {
            let c_result_handle = smoke_FirstParentIsClassClass_parentPropertyOne_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_FirstParentIsClassClass_parentPropertyOne_set(self.c_instance, c_value.ref)
        }
    }
    public var childProperty: String {
        get {
            let c_result_handle = smoke_FirstParentIsClassClass_childProperty_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_FirstParentIsClassClass_childProperty_set(self.c_instance, c_value.ref)
        }
    }
    init(cFirstParentIsClassClass: _baseRef) {
        super.init(cParentClass: cFirstParentIsClassClass)
    }
    public func parentFunctionOne() -> Void {
        smoke_FirstParentIsClassClass_parentFunctionOne(self.c_instance)
    }
    public func childFunction() -> Void {
        smoke_FirstParentIsClassClass_childFunction(self.c_instance)
    }
}
@_cdecl("_CBridgeInitsmoke_FirstParentIsClassClass")
internal func _CBridgeInitsmoke_FirstParentIsClassClass(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = FirstParentIsClassClass(cFirstParentIsClassClass: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: FirstParentIsClassClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_FirstParentIsClassClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_FirstParentIsClassClass_release_handle)
        : RefHolder(handle_copy)
}
internal func FirstParentIsClassClass_copyFromCType(_ handle: _baseRef) -> FirstParentIsClassClass {
    if let swift_pointer = smoke_FirstParentIsClassClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? FirstParentIsClassClass {
        return re_constructed
    }
    if let swift_pointer = smoke_FirstParentIsClassClass_get_typed(smoke_FirstParentIsClassClass_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? FirstParentIsClassClass {
        smoke_FirstParentIsClassClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func FirstParentIsClassClass_moveFromCType(_ handle: _baseRef) -> FirstParentIsClassClass {
    if let swift_pointer = smoke_FirstParentIsClassClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? FirstParentIsClassClass {
        smoke_FirstParentIsClassClass_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_FirstParentIsClassClass_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? FirstParentIsClassClass {
        smoke_FirstParentIsClassClass_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func FirstParentIsClassClass_copyFromCType(_ handle: _baseRef) -> FirstParentIsClassClass? {
    guard handle != 0 else {
        return nil
    }
    return FirstParentIsClassClass_moveFromCType(handle) as FirstParentIsClassClass
}
internal func FirstParentIsClassClass_moveFromCType(_ handle: _baseRef) -> FirstParentIsClassClass? {
    guard handle != 0 else {
        return nil
    }
    return FirstParentIsClassClass_moveFromCType(handle) as FirstParentIsClassClass
}
internal func copyToCType(_ swiftClass: FirstParentIsClassClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: FirstParentIsClassClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: FirstParentIsClassClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: FirstParentIsClassClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
