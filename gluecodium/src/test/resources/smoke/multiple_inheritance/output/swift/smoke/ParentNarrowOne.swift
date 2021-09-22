//
//
import Foundation
public protocol ParentNarrowOne : AnyObject {
    var parentPropertyOne: String { get set }
    func parentFunctionOne() -> Void
}
internal class _ParentNarrowOne: ParentNarrowOne {
    var parentPropertyOne: String {
        get {
            let c_result_handle = smoke_ParentNarrowOne_parentPropertyOne_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_ParentNarrowOne_parentPropertyOne_set(self.c_instance, c_value.ref)
        }
    }
    let c_instance : _baseRef
    init(cParentNarrowOne: _baseRef) {
        guard cParentNarrowOne != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cParentNarrowOne
    }
    deinit {
        smoke_ParentNarrowOne_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_ParentNarrowOne_release_handle(c_instance)
    }
    public func parentFunctionOne() -> Void {
        smoke_ParentNarrowOne_parentFunctionOne(self.c_instance)
    }
}
internal func getRef(_ ref: ParentNarrowOne?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    var functions = smoke_ParentNarrowOne_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.smoke_ParentNarrowOne_parentFunctionOne = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ParentNarrowOne
        swift_class.parentFunctionOne()
    }
    functions.smoke_ParentNarrowOne_parentPropertyOne_get = {(swift_class_pointer) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ParentNarrowOne
        return copyToCType(swift_class.parentPropertyOne).ref
    }
    functions.smoke_ParentNarrowOne_parentPropertyOne_set = {(swift_class_pointer, value) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ParentNarrowOne
        swift_class.parentPropertyOne = moveFromCType(value)
    }
    let proxy = smoke_ParentNarrowOne_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_ParentNarrowOne_release_handle) : RefHolder(proxy)
}
extension _ParentNarrowOne: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func ParentNarrowOne_copyFromCType(_ handle: _baseRef) -> ParentNarrowOne {
    if let swift_pointer = smoke_ParentNarrowOne_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ParentNarrowOne {
        return re_constructed
    }
    if let swift_pointer = smoke_ParentNarrowOne_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ParentNarrowOne {
        return re_constructed
    }
    let result = _ParentNarrowOne(cParentNarrowOne: smoke_ParentNarrowOne_copy_handle(handle))
    smoke_ParentNarrowOne_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ParentNarrowOne_moveFromCType(_ handle: _baseRef) -> ParentNarrowOne {
    if let swift_pointer = smoke_ParentNarrowOne_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ParentNarrowOne {
        smoke_ParentNarrowOne_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_ParentNarrowOne_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ParentNarrowOne {
        smoke_ParentNarrowOne_release_handle(handle)
        return re_constructed
    }
    let result = _ParentNarrowOne(cParentNarrowOne: handle)
    smoke_ParentNarrowOne_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func ParentNarrowOne_copyFromCType(_ handle: _baseRef) -> ParentNarrowOne? {
    guard handle != 0 else {
        return nil
    }
    return ParentNarrowOne_moveFromCType(handle) as ParentNarrowOne
}
internal func ParentNarrowOne_moveFromCType(_ handle: _baseRef) -> ParentNarrowOne? {
    guard handle != 0 else {
        return nil
    }
    return ParentNarrowOne_moveFromCType(handle) as ParentNarrowOne
}
internal func copyToCType(_ swiftClass: ParentNarrowOne) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ParentNarrowOne) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ParentNarrowOne?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ParentNarrowOne?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
