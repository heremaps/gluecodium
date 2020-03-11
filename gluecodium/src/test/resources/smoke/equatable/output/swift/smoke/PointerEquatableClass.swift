//
//
import Foundation
public class PointerEquatableClass {
    let c_instance : _baseRef
    init(cPointerEquatableClass: _baseRef) {
        guard cPointerEquatableClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cPointerEquatableClass
    }
    deinit {
        smoke_PointerEquatableClass_release_handle(c_instance)
    }
}
internal func getRef(_ ref: PointerEquatableClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_PointerEquatableClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_PointerEquatableClass_release_handle)
        : RefHolder(handle_copy)
}
extension PointerEquatableClass: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension PointerEquatableClass: Hashable {
    public static func == (lhs: PointerEquatableClass, rhs: PointerEquatableClass) -> Bool {
        return smoke_PointerEquatableClass_equal(lhs.c_handle, rhs.c_handle)
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(smoke_PointerEquatableClass_hash(c_handle))
    }
}
internal func PointerEquatableClass_copyFromCType(_ handle: _baseRef) -> PointerEquatableClass {
    return PointerEquatableClass(cPointerEquatableClass: smoke_PointerEquatableClass_copy_handle(handle))
}
internal func PointerEquatableClass_moveFromCType(_ handle: _baseRef) -> PointerEquatableClass {
    return PointerEquatableClass(cPointerEquatableClass: handle)
}
internal func PointerEquatableClass_copyFromCType(_ handle: _baseRef) -> PointerEquatableClass? {
    guard handle != 0 else {
        return nil
    }
    return PointerEquatableClass_moveFromCType(handle) as PointerEquatableClass
}
internal func PointerEquatableClass_moveFromCType(_ handle: _baseRef) -> PointerEquatableClass? {
    guard handle != 0 else {
        return nil
    }
    return PointerEquatableClass_moveFromCType(handle) as PointerEquatableClass
}
internal func copyToCType(_ swiftClass: PointerEquatableClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PointerEquatableClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: PointerEquatableClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: PointerEquatableClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
