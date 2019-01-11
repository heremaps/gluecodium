//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: InheritanceChildClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_InheritanceChildClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_InheritanceChildClass_release_handle)
        : RefHolder(handle_copy)
}
public class InheritanceChildClass: InheritanceRoot {
    public var rootAttribute: String {
        get {
            return moveFromCType(smoke_InheritanceRoot_rootAttribute_get(c_instance))
        }
        set {
            return moveFromCType(smoke_InheritanceRoot_rootAttribute_set(c_instance, newValue))
        }
    }
    let c_instance : _baseRef
    init(cInheritanceChildClass: _baseRef) {
        guard cInheritanceChildClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cInheritanceChildClass
    }
    deinit {
        smoke_InheritanceChildClass_release_handle(c_instance)
    }
    public func rootMethod() -> Void {
        return moveFromCType(smoke_InheritanceRoot_rootMethod(c_instance))
    }
    public func childClassMethod() -> Void {
        return moveFromCType(smoke_InheritanceChildClass_childClassMethod(c_instance))
    }
}
extension InheritanceChildClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}