//
//
import Foundation
public class SwiftMethodOverloads {
    let c_instance : _baseRef
    init(cSwiftMethodOverloads: _baseRef) {
        guard cSwiftMethodOverloads != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSwiftMethodOverloads
    }
    deinit {
        smoke_SwiftMethodOverloads_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_SwiftMethodOverloads_release_handle(c_instance)
    }
    public func three(input: String) -> Void {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_SwiftMethodOverloads_three_String(self.c_instance, c_input.ref))
    }
    public func three(input: [String]) -> Void {
        let c_input = foobar_moveToCType(input)
        return moveFromCType(smoke_SwiftMethodOverloads_three__3String_4(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: SwiftMethodOverloads?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SwiftMethodOverloads_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SwiftMethodOverloads_release_handle)
        : RefHolder(handle_copy)
}
extension SwiftMethodOverloads: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension SwiftMethodOverloads: Hashable {
    /// :nodoc:
    public static func == (lhs: SwiftMethodOverloads, rhs: SwiftMethodOverloads) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func SwiftMethodOverloads_copyFromCType(_ handle: _baseRef) -> SwiftMethodOverloads {
    if let swift_pointer = smoke_SwiftMethodOverloads_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SwiftMethodOverloads {
        return re_constructed
    }
    let result = SwiftMethodOverloads(cSwiftMethodOverloads: smoke_SwiftMethodOverloads_copy_handle(handle))
    smoke_SwiftMethodOverloads_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SwiftMethodOverloads_moveFromCType(_ handle: _baseRef) -> SwiftMethodOverloads {
    if let swift_pointer = smoke_SwiftMethodOverloads_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? SwiftMethodOverloads {
        smoke_SwiftMethodOverloads_release_handle(handle)
        return re_constructed
    }
    let result = SwiftMethodOverloads(cSwiftMethodOverloads: handle)
    smoke_SwiftMethodOverloads_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func SwiftMethodOverloads_copyFromCType(_ handle: _baseRef) -> SwiftMethodOverloads? {
    guard handle != 0 else {
        return nil
    }
    return SwiftMethodOverloads_moveFromCType(handle) as SwiftMethodOverloads
}
internal func SwiftMethodOverloads_moveFromCType(_ handle: _baseRef) -> SwiftMethodOverloads? {
    guard handle != 0 else {
        return nil
    }
    return SwiftMethodOverloads_moveFromCType(handle) as SwiftMethodOverloads
}
internal func copyToCType(_ swiftClass: SwiftMethodOverloads) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SwiftMethodOverloads) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SwiftMethodOverloads?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SwiftMethodOverloads?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
