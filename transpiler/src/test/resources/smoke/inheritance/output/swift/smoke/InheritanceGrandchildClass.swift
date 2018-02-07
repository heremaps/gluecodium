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

internal func getRef(_ ref: InheritanceGrandchildClass?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}

public class InheritanceGrandchildClass: InheritanceChildClass {
    public init?(cInheritanceGrandchildClass: _baseRef) {
        super.init(cInheritanceChildClass: cInheritanceGrandchildClass)
    }
    public func grandchildClassMethod() -> Void {
        return smoke_InheritanceGrandchildClass_grandchildClassMethod(c_instance)
    }
}
