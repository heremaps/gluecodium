//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ChildClassFromClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_ChildClassFromClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_ChildClassFromClass_release_handle)
        : RefHolder(handle_copy)
}
public class ChildClassFromClass: ParentClass {
    init(cChildClassFromClass: _baseRef) {
        super.init(cParentClass: cChildClassFromClass)
    }
    public func childClassMethod() -> Void {
        return moveFromCType(smoke_ChildClassFromClass_childClassMethod(self.c_instance))
    }
}
internal func ChildClassFromClasscopyFromCType(_ handle: _baseRef) -> ChildClassFromClass {
    return ChildClassFromClass(cChildClassFromClass: smoke_ChildClassFromClass_copy_handle(handle))
}
internal func ChildClassFromClassmoveFromCType(_ handle: _baseRef) -> ChildClassFromClass {
    return ChildClassFromClass(cChildClassFromClass: handle)
}
internal func ChildClassFromClasscopyFromCType(_ handle: _baseRef) -> ChildClassFromClass? {
    guard handle != 0 else {
        return nil
    }
    return ChildClassFromClassmoveFromCType(handle) as ChildClassFromClass
}
internal func ChildClassFromClassmoveFromCType(_ handle: _baseRef) -> ChildClassFromClass? {
    guard handle != 0 else {
        return nil
    }
    return ChildClassFromClassmoveFromCType(handle) as ChildClassFromClass
}
internal func copyToCType(_ swiftClass: ChildClassFromClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildClassFromClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ChildClassFromClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ChildClassFromClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
