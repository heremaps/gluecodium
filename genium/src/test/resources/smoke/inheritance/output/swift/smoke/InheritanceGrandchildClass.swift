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
        return moveFromCType(smoke_InheritanceGrandchildClass_grandchildClassMethod(c_instance))
    }
}
internal func InheritanceGrandchildClasscopyFromCType(_ handle: _baseRef) -> InheritanceGrandchildClass {
    return InheritanceGrandchildClass(cInheritanceGrandchildClass: handle)
}
internal func InheritanceGrandchildClassmoveFromCType(_ handle: _baseRef) -> InheritanceGrandchildClass {
    return InheritanceGrandchildClasscopyFromCType(handle)
}
internal func InheritanceGrandchildClasscopyFromCType(_ handle: _baseRef) -> InheritanceGrandchildClass? {
    guard handle != 0 else {
        return nil
    }
    return InheritanceGrandchildClassmoveFromCType(handle) as InheritanceGrandchildClass
}
internal func InheritanceGrandchildClassmoveFromCType(_ handle: _baseRef) -> InheritanceGrandchildClass? {
    return InheritanceGrandchildClasscopyFromCType(handle)
}