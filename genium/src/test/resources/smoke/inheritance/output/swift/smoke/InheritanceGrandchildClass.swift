//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: InheritanceGrandchildClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_InheritanceGrandchildClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_InheritanceGrandchildClass_release_handle)
        : RefHolder(handle_copy)
}
public class InheritanceGrandchildClass: InheritanceChildClass {
    init(cInheritanceGrandchildClass: _baseRef) {
        super.init(cInheritanceChildClass: cInheritanceGrandchildClass)
    }
    public func grandchildClassMethod() -> Void {
        return smoke_InheritanceGrandchildClass_grandchildClassMethod(c_instance)
    }
}