//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Typedefs) -> RefHolder<examples_TypedefsRef> {
    return RefHolder<examples_TypedefsRef>(ref.c_instance)
}
public class Typedefs {
    public typealias ExampleAlias = UInt32
    let c_instance : examples_TypedefsRef
    public required init?(cTypedefs: examples_TypedefsRef) {
        c_instance = cTypedefs
    }
    deinit {
        examples_Typedefs_release(c_instance)
    }

    public static func typedefMethod(input: Typedefs.ExampleAlias) -> Typedefs.ExampleAlias {
        return examples_Typedefs_typedefMethod(input)
    }

}
