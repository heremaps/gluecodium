//
//
import Foundation
/// This is some very useful interface.
/// There is a lot to say about this interface.
/// at least it has multiline comments.
///
/// I am a heading
/// --------------
///
/// And now comes a list:
/// * asterisk
/// * needs
/// * escaping
///
/// ```Some example code;```
public class MultiLineComments {
    let c_instance : _baseRef
    init(cMultiLineComments: _baseRef) {
        guard cMultiLineComments != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cMultiLineComments
    }
    deinit {
        smoke_MultiLineComments_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_MultiLineComments_release_handle(c_instance)
    }
    /// This is very important method.
    /// It has very important parameters.
    /// It has side effects.
    /// - Parameters:
    ///   - input: Very useful input parameter.
    ///       You must not confuse it with the second parameter.
    ///       But they are similar.
    ///   - ratio: Not as useful as the first parameter.
    ///       But still useful.
    ///       use a positive value for more happiness.
    /// - Returns: If you provide a useful input,
    ///     and a useful ratio you can expect a useful output.
    ///     Just kidding do not expect anything from a method until
    ///     you see its body.
    public func someMethodWithLongComment(input: String, ratio: Double) -> Float {
        let c_input = moveToCType(input)
        let c_ratio = moveToCType(ratio)
        return moveFromCType(smoke_MultiLineComments_someMethodWithLongComment(self.c_instance, c_input.ref, c_ratio.ref))
    }
}
internal func getRef(_ ref: MultiLineComments?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_MultiLineComments_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_MultiLineComments_release_handle)
        : RefHolder(handle_copy)
}
extension MultiLineComments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension MultiLineComments: Hashable {
    // :nodoc:
    public static func == (lhs: MultiLineComments, rhs: MultiLineComments) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    // :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func foobar_MultiLineComments_copyFromCType(_ handle: _baseRef) -> MultiLineComments {
    if let swift_pointer = smoke_MultiLineComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? MultiLineComments {
        return re_constructed
    }
    let result = MultiLineComments(cMultiLineComments: smoke_MultiLineComments_copy_handle(handle))
    smoke_MultiLineComments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_MultiLineComments_moveFromCType(_ handle: _baseRef) -> MultiLineComments {
    if let swift_pointer = smoke_MultiLineComments_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? MultiLineComments {
        smoke_MultiLineComments_release_handle(handle)
        return re_constructed
    }
    let result = MultiLineComments(cMultiLineComments: handle)
    smoke_MultiLineComments_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func foobar_MultiLineComments_copyFromCType(_ handle: _baseRef) -> MultiLineComments? {
    guard handle != 0 else {
        return nil
    }
    return foobar_MultiLineComments_moveFromCType(handle) as MultiLineComments
}
internal func foobar_MultiLineComments_moveFromCType(_ handle: _baseRef) -> MultiLineComments? {
    guard handle != 0 else {
        return nil
    }
    return foobar_MultiLineComments_moveFromCType(handle) as MultiLineComments
}
internal func foobar_copyToCType(_ swiftClass: MultiLineComments) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: MultiLineComments) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func foobar_copyToCType(_ swiftClass: MultiLineComments?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func foobar_moveToCType(_ swiftClass: MultiLineComments?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
