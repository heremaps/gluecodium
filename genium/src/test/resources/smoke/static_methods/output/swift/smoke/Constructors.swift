//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Constructors?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Constructors_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Constructors_release_handle)
        : RefHolder(handle_copy)
}
public class Constructors {
    public init() {
        let _result = Constructors.create()
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers: Constructors")
        }
        c_instance = _result
    }
    public init(other: Constructors?) {
        let _result = Constructors.create(other)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers: Constructors")
        }
        c_instance = _result
    }
    public init(foo: String, bar: UInt64) {
        let _result = Constructors.create(foo, bar)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers: Constructors")
        }
        c_instance = _result
    }
    let c_instance : _baseRef
    init?(cConstructors: _baseRef) {
        guard cConstructors != 0 else {
            return nil
        }
        c_instance = cConstructors
    }
    deinit {
        smoke_Constructors_release_handle(c_instance)
    }
    private static func create() -> _baseRef {
        return smoke_Constructors_create_noArgs()
    }
    private static func create(other: Constructors?) -> _baseRef {
        let other_handle = getRef(other)
        return smoke_Constructors_create_copyCtor(other_handle.ref)
    }
    private static func create(foo: String, bar: UInt64) -> _baseRef {
        return smoke_Constructors_create_twoArgs(foo, bar)
    }
}
extension Constructors: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
