//
//
import Foundation
public class SimpleClass {
    let c_instance : _baseRef
    init(cSimpleClass: _baseRef) {
        guard cSimpleClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSimpleClass
    }
    deinit {
        smoke_SimpleClass_release_handle(c_instance)
    }
    public func getStringValue() -> String {
        return moveFromCType(smoke_SimpleClass_getStringValue(self.c_instance))
    }
}
internal func getRef(_ ref: SimpleClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SimpleClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SimpleClass_release_handle)
        : RefHolder(handle_copy)
}
extension SimpleClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func SimpleClass_copyFromCType(_ handle: _baseRef) -> SimpleClass {
    return SimpleClass(cSimpleClass: smoke_SimpleClass_copy_handle(handle))
}
internal func SimpleClass_moveFromCType(_ handle: _baseRef) -> SimpleClass {
    return SimpleClass(cSimpleClass: handle)
}
internal func SimpleClass_copyFromCType(_ handle: _baseRef) -> SimpleClass? {
    guard handle != 0 else {
        return nil
    }
    return SimpleClass_moveFromCType(handle) as SimpleClass
}
internal func SimpleClass_moveFromCType(_ handle: _baseRef) -> SimpleClass? {
    guard handle != 0 else {
        return nil
    }
    return SimpleClass_moveFromCType(handle) as SimpleClass
}
internal func copyToCType(_ swiftClass: SimpleClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SimpleClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: SimpleClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: SimpleClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
