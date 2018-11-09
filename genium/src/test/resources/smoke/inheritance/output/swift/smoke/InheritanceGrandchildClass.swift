//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: InheritanceGrandchildClass?, owning: Bool = false) -> RefHolder {
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
