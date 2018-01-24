//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: MultiLineComments) -> RefHolder {
    return RefHolder(ref.c_instance)
}
/**
 This is some very useful interface. There is a lot to say about this interface. at least it has multiline comments.
 */
public class MultiLineComments {
    let c_instance : _baseRef
    public init?(cMultiLineComments: _baseRef) {
        guard cMultiLineComments.private_pointer != nil else {
            return nil
        }
        c_instance = cMultiLineComments
    }
    deinit {
        smoke_MultiLineComments_release(c_instance)
    }
    /**
     This is very important method. It has very important parameters. It has side effects.
     - Parameter input: Very useful input parameter. You must not confuse it with the second parameter. But they are similar.
     - Parameter ratio: Not as useful as the first parameter. But still useful. use a positive value for more happiness.
     - Returns: If you provide a useful input, and a useful ratio you can expect a useful output. Just kidding do not expect anything from a method until you see its body.
     */
    public func someMethodWithLongComment(input: String, ratio: Double) -> Float {
        return smoke_MultiLineComments_someMethodWithLongComment(c_instance, input, ratio)
    }
}