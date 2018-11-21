//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: MultiLineComments?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
/// This is some very useful interface. There is a lot to say about this interface. at least it has multiline comments.
public class MultiLineComments {
    let c_instance : _baseRef
    init?(cMultiLineComments: _baseRef) {
        guard cMultiLineComments != 0 else {
            return nil
        }
        c_instance = cMultiLineComments
    }
    deinit {
        smoke_MultiLineComments_release(c_instance)
    }
    /// This is very important method. It has very important parameters. It has side effects.
    /// - Parameter input: Very useful input parameter. You must not confuse it with the second parameter. But they are similar.
    /// - Parameter ratio: Not as useful as the first parameter. But still useful. use a positive value for more happiness.
    /// - Returns: If you provide a useful input, and a useful ratio you can expect a useful output. Just kidding do not expect anything from a method until you see its body.
    public func someMethodWithLongComment(input: String, ratio: Double) -> Float {
        return smoke_MultiLineComments_someMethodWithLongComment(c_instance, input, ratio)
    }
}
extension MultiLineComments: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
