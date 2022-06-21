//
//
import Foundation
public class CtorLinks {
    let c_instance : _baseRef
    init(cCtorLinks: _baseRef) {
        guard cCtorLinks != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCtorLinks
    }
    deinit {
        smoke_CtorLinks_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_CtorLinks_release_handle(c_instance)
    }
    /// This class has just one constructor `CtorLinks.SingleCtor.init(...)`.
    public class SingleCtor {
        public init() {
            let _result = CtorLinks.SingleCtor.create()
            guard _result != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            c_instance = _result
            smoke_CtorLinks_SingleCtor_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
        }
        let c_instance : _baseRef
        init(cSingleCtor: _baseRef) {
            guard cSingleCtor != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            c_instance = cSingleCtor
        }
        deinit {
            smoke_CtorLinks_SingleCtor_remove_swift_object_from_wrapper_cache(c_instance)
            smoke_CtorLinks_SingleCtor_release_handle(c_instance)
        }
        private static func create() -> _baseRef {
            let c_result_handle = smoke_CtorLinks_SingleCtor_create()
            return moveFromCType(c_result_handle)
        }
    }
    public class OverloadedCtors {
        public init(input: String) {
            let _result = CtorLinks.OverloadedCtors.create(input: input)
            guard _result != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            c_instance = _result
            smoke_CtorLinks_OverloadedCtors_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
        }
        ///
        /// - Parameters:
        ///   - input:
        ///   - flag:
        @available(*, deprecated, message: "Use `CtorLinks.OverloadedCtors.init(String)` instead.")
        public init(input: String, flag: Bool) {
            let _result = CtorLinks.OverloadedCtors.create(input: input, flag: flag)
            guard _result != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            c_instance = _result
            smoke_CtorLinks_OverloadedCtors_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
        }
        let c_instance : _baseRef
        init(cOverloadedCtors: _baseRef) {
            guard cOverloadedCtors != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            c_instance = cOverloadedCtors
        }
        deinit {
            smoke_CtorLinks_OverloadedCtors_remove_swift_object_from_wrapper_cache(c_instance)
            smoke_CtorLinks_OverloadedCtors_release_handle(c_instance)
        }
        private static func create(input: String) -> _baseRef {
            let c_input = moveToCType(input)
            let c_result_handle = smoke_CtorLinks_OverloadedCtors_create_String(c_input.ref)
            return moveFromCType(c_result_handle)
        }
        private static func create(input: String, flag: Bool) -> _baseRef {
            let c_input = moveToCType(input)
            let c_flag = moveToCType(flag)
            let c_result_handle = smoke_CtorLinks_OverloadedCtors_create_String_Boolean(c_input.ref, c_flag.ref)
            return moveFromCType(c_result_handle)
        }
    }
}
internal func getRef(_ ref: CtorLinks?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CtorLinks_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CtorLinks_release_handle)
        : RefHolder(handle_copy)
}
extension CtorLinks: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension CtorLinks: Hashable {
    /// :nodoc:
    public static func == (lhs: CtorLinks, rhs: CtorLinks) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func CtorLinks_copyFromCType(_ handle: _baseRef) -> CtorLinks {
    if let swift_pointer = smoke_CtorLinks_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CtorLinks {
        return re_constructed
    }
    let result = CtorLinks(cCtorLinks: smoke_CtorLinks_copy_handle(handle))
    smoke_CtorLinks_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CtorLinks_moveFromCType(_ handle: _baseRef) -> CtorLinks {
    if let swift_pointer = smoke_CtorLinks_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CtorLinks {
        smoke_CtorLinks_release_handle(handle)
        return re_constructed
    }
    let result = CtorLinks(cCtorLinks: handle)
    smoke_CtorLinks_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CtorLinks_copyFromCType(_ handle: _baseRef) -> CtorLinks? {
    guard handle != 0 else {
        return nil
    }
    return CtorLinks_moveFromCType(handle) as CtorLinks
}
internal func CtorLinks_moveFromCType(_ handle: _baseRef) -> CtorLinks? {
    guard handle != 0 else {
        return nil
    }
    return CtorLinks_moveFromCType(handle) as CtorLinks
}
internal func copyToCType(_ swiftClass: CtorLinks) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CtorLinks) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CtorLinks?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CtorLinks?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: CtorLinks.SingleCtor?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CtorLinks_SingleCtor_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CtorLinks_SingleCtor_release_handle)
        : RefHolder(handle_copy)
}
extension CtorLinks.SingleCtor: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension CtorLinks.SingleCtor: Hashable {
    /// :nodoc:
    public static func == (lhs: CtorLinks.SingleCtor, rhs: CtorLinks.SingleCtor) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func CtorLinks_SingleCtor_copyFromCType(_ handle: _baseRef) -> CtorLinks.SingleCtor {
    if let swift_pointer = smoke_CtorLinks_SingleCtor_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CtorLinks.SingleCtor {
        return re_constructed
    }
    let result = CtorLinks.SingleCtor(cSingleCtor: smoke_CtorLinks_SingleCtor_copy_handle(handle))
    smoke_CtorLinks_SingleCtor_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CtorLinks_SingleCtor_moveFromCType(_ handle: _baseRef) -> CtorLinks.SingleCtor {
    if let swift_pointer = smoke_CtorLinks_SingleCtor_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CtorLinks.SingleCtor {
        smoke_CtorLinks_SingleCtor_release_handle(handle)
        return re_constructed
    }
    let result = CtorLinks.SingleCtor(cSingleCtor: handle)
    smoke_CtorLinks_SingleCtor_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CtorLinks_SingleCtor_copyFromCType(_ handle: _baseRef) -> CtorLinks.SingleCtor? {
    guard handle != 0 else {
        return nil
    }
    return CtorLinks_SingleCtor_moveFromCType(handle) as CtorLinks.SingleCtor
}
internal func CtorLinks_SingleCtor_moveFromCType(_ handle: _baseRef) -> CtorLinks.SingleCtor? {
    guard handle != 0 else {
        return nil
    }
    return CtorLinks_SingleCtor_moveFromCType(handle) as CtorLinks.SingleCtor
}
internal func copyToCType(_ swiftClass: CtorLinks.SingleCtor) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CtorLinks.SingleCtor) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CtorLinks.SingleCtor?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CtorLinks.SingleCtor?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: CtorLinks.OverloadedCtors?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_CtorLinks_OverloadedCtors_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_CtorLinks_OverloadedCtors_release_handle)
        : RefHolder(handle_copy)
}
extension CtorLinks.OverloadedCtors: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension CtorLinks.OverloadedCtors: Hashable {
    /// :nodoc:
    public static func == (lhs: CtorLinks.OverloadedCtors, rhs: CtorLinks.OverloadedCtors) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func CtorLinks_OverloadedCtors_copyFromCType(_ handle: _baseRef) -> CtorLinks.OverloadedCtors {
    if let swift_pointer = smoke_CtorLinks_OverloadedCtors_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CtorLinks.OverloadedCtors {
        return re_constructed
    }
    let result = CtorLinks.OverloadedCtors(cOverloadedCtors: smoke_CtorLinks_OverloadedCtors_copy_handle(handle))
    smoke_CtorLinks_OverloadedCtors_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CtorLinks_OverloadedCtors_moveFromCType(_ handle: _baseRef) -> CtorLinks.OverloadedCtors {
    if let swift_pointer = smoke_CtorLinks_OverloadedCtors_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? CtorLinks.OverloadedCtors {
        smoke_CtorLinks_OverloadedCtors_release_handle(handle)
        return re_constructed
    }
    let result = CtorLinks.OverloadedCtors(cOverloadedCtors: handle)
    smoke_CtorLinks_OverloadedCtors_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func CtorLinks_OverloadedCtors_copyFromCType(_ handle: _baseRef) -> CtorLinks.OverloadedCtors? {
    guard handle != 0 else {
        return nil
    }
    return CtorLinks_OverloadedCtors_moveFromCType(handle) as CtorLinks.OverloadedCtors
}
internal func CtorLinks_OverloadedCtors_moveFromCType(_ handle: _baseRef) -> CtorLinks.OverloadedCtors? {
    guard handle != 0 else {
        return nil
    }
    return CtorLinks_OverloadedCtors_moveFromCType(handle) as CtorLinks.OverloadedCtors
}
internal func copyToCType(_ swiftClass: CtorLinks.OverloadedCtors) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CtorLinks.OverloadedCtors) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: CtorLinks.OverloadedCtors?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: CtorLinks.OverloadedCtors?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
