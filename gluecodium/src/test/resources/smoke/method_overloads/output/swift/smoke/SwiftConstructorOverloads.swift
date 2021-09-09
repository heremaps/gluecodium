//
//
import Foundation
public class SwiftConstructorOverloads {
    public init(input: String) {
        let _result = SwiftConstructorOverloads.make(input: input)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_SwiftConstructorOverloads_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    public init(throughput: String) {
        let _result = SwiftConstructorOverloads.makeDo(throughput: throughput)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_SwiftConstructorOverloads_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
    }
    let c_instance : _baseRef
    init(cSwiftConstructorOverloads: _baseRef) {
        guard cSwiftConstructorOverloads != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSwiftConstructorOverloads
    }
    deinit {
        smoke_SwiftConstructorOverloads_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SwiftConstructorOverloads_release_handle(c_instance)
    }
    private static func make(input: String) -> _baseRef {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_SwiftConstructorOverloads_make(c_input.ref)
        return moveFromCType(c_result_handle)
    }
    private static func makeDo(throughput: String) -> _baseRef {
        let c_throughput = moveToCType(throughput)
        let c_result_handle = smoke_SwiftConstructorOverloads_makeDo(c_throughput.ref)
        return moveFromCType(c_result_handle)
    }
}
internal func getRef(_ ref: SwiftConstructorOverloads?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SwiftConstructorOverloads_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SwiftConstructorOverloads_release_handle)
        : RefHolder(handle_copy)
}
extension SwiftConstructorOverloads: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension SwiftConstructorOverloads: Hashable {
    /// :nodoc:
    public static func == (lhs: SwiftConstructorOverloads, rhs: SwiftConstructorOverloads) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func SwiftConstructorOverloads_copyFromCType(_ handle: _baseRef) -> SwiftConstructorOverloads {
    if let swift_pointer = smoke_SwiftConstructorOverloads_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SwiftConstructorOverloads {
        return re_constructed
    }
    let result = SwiftConstructorOverloads(cSwiftConstructorOverloads: smoke_SwiftConstructorOverloads_copy_handle(handle))
    smoke_SwiftConstructorOverloads_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SwiftConstructorOverloads_moveFromCType(_ handle: _baseRef) -> SwiftConstructorOverloads {
    if let swift_pointer = smoke_SwiftConstructorOverloads_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SwiftConstructorOverloads {
        smoke_SwiftConstructorOverloads_release_handle(handle)
        return re_constructed
    }
    let result = SwiftConstructorOverloads(cSwiftConstructorOverloads: handle)
    smoke_SwiftConstructorOverloads_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SwiftConstructorOverloads_copyFromCType(_ handle: _baseRef) -> SwiftConstructorOverloads? {
    guard handle != 0 else {
        return nil
    }
    return SwiftConstructorOverloads_moveFromCType(handle) as SwiftConstructorOverloads
}
internal func SwiftConstructorOverloads_moveFromCType(_ handle: _baseRef) -> SwiftConstructorOverloads? {
    guard handle != 0 else {
        return nil
    }
    return SwiftConstructorOverloads_moveFromCType(handle) as SwiftConstructorOverloads
}
internal func copyToCType(_ swiftClass: SwiftConstructorOverloads) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SwiftConstructorOverloads) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SwiftConstructorOverloads?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SwiftConstructorOverloads?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
