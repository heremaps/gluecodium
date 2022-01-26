//
//
import Foundation
public class NoCacheClass {
    public init() {
        let _result = NoCacheClass.make()
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    let c_instance : _baseRef
    init(cNoCacheClass: _baseRef) {
        guard cNoCacheClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cNoCacheClass
    }
    deinit {
        smoke_NoCacheClass_release_handle(c_instance)
    }
    private static func make() -> _baseRef {
        let c_result_handle = smoke_NoCacheClass_make()
        return moveFromCType(c_result_handle)
    }
    public func foo() -> Void {
        smoke_NoCacheClass_foo(self.c_instance)
    }
}
internal func getRef(_ ref: NoCacheClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_NoCacheClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_NoCacheClass_release_handle)
        : RefHolder(handle_copy)
}
extension NoCacheClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension NoCacheClass: Hashable {
    /// :nodoc:
    public static func == (lhs: NoCacheClass, rhs: NoCacheClass) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func NoCacheClass_copyFromCType(_ handle: _baseRef) -> NoCacheClass {
    let result = NoCacheClass(cNoCacheClass: smoke_NoCacheClass_copy_handle(handle))
    return result
}
internal func NoCacheClass_moveFromCType(_ handle: _baseRef) -> NoCacheClass {
    let result = NoCacheClass(cNoCacheClass: handle)
    return result
}
internal func NoCacheClass_copyFromCType(_ handle: _baseRef) -> NoCacheClass? {
    guard handle != 0 else {
        return nil
    }
    return NoCacheClass_moveFromCType(handle) as NoCacheClass
}
internal func NoCacheClass_moveFromCType(_ handle: _baseRef) -> NoCacheClass? {
    guard handle != 0 else {
        return nil
    }
    return NoCacheClass_moveFromCType(handle) as NoCacheClass
}
internal func copyToCType(_ swiftClass: NoCacheClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: NoCacheClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: NoCacheClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: NoCacheClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
