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
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    public init(other: Constructors?) {
        let _result = Constructors.create(other: other)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    public init(foo: String, bar: UInt64) {
        let _result = Constructors.create(foo: foo, bar: bar)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    public init(input: String) throws {
        let _result = try Constructors.create(input: input)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    public init<Tinput: Collection>(input: Tinput) where Tinput.Element == Double {
        let _result = Constructors.create(input: input)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    let c_instance : _baseRef
    init(cConstructors: _baseRef) {
        guard cConstructors != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cConstructors
    }
    deinit {
        smoke_Constructors_release_handle(c_instance)
    }
    public enum ErrorEnum : UInt32 {
        case none
        case crashed
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
    private static func create(input: String) throws -> _baseRef {
        let RESULT = smoke_Constructors_create_withError(input)
        if (RESULT.has_value) {
            return RESULT.returned_value
        } else {
            throw Constructors.ErrorEnum(rawValue: RESULT.error_code)!
        }
    }
    private static func create<Tinput: Collection>(input: Tinput) -> _baseRef where Tinput.Element == Double {
        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }
        return smoke_Constructors_create_withArray(input_handle.c_type)
    }
}
extension Constructors: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
