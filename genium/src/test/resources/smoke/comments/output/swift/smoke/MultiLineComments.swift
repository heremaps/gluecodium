//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
@_cdecl("_CBridgeInitsmoke_MultiLineComments")
internal func _CBridgeInitsmoke_MultiLineComments(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = MultiLineComments(cMultiLineComments: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
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
extension MultiLineComments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func MultiLineCommentscopyFromCType(_ handle: _baseRef) -> MultiLineComments {
    if let swift_pointer = smoke_MultiLineComments_get_typed(smoke_MultiLineComments_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? MultiLineComments {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func MultiLineCommentsmoveFromCType(_ handle: _baseRef) -> MultiLineComments {
    if let swift_pointer = smoke_MultiLineComments_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? MultiLineComments {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func MultiLineCommentscopyFromCType(_ handle: _baseRef) -> MultiLineComments? {
    guard handle != 0 else {
        return nil
    }
    return MultiLineCommentsmoveFromCType(handle) as MultiLineComments
}
internal func MultiLineCommentsmoveFromCType(_ handle: _baseRef) -> MultiLineComments? {
    guard handle != 0 else {
        return nil
    }
    return MultiLineCommentsmoveFromCType(handle) as MultiLineComments
}
internal func copyToCType(_ swiftClass: MultiLineComments) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: MultiLineComments) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: MultiLineComments?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: MultiLineComments?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}