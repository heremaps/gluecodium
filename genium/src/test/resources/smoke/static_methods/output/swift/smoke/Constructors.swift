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
    public init(other: Constructors) {
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
    public init(input: [Double]) {
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
    public enum ErrorEnum : UInt32, CaseIterable {
        case none
        case crashed
    }
    private static func create() -> _baseRef {
        return moveFromCType(smoke_Constructors_create_())
    }
    private static func create(other: Constructors) -> _baseRef {
        let c_other = moveToCType(other)
        return moveFromCType(smoke_Constructors_create_Constructors(c_other.ref))
    }
    private static func create(foo: String, bar: UInt64) -> _baseRef {
        let c_foo = moveToCType(foo)
        let c_bar = moveToCType(bar)
        return moveFromCType(smoke_Constructors_create_String_ULong(c_foo.ref, c_bar.ref))
    }
    private static func create(input: String) throws -> _baseRef {
        let c_input = moveToCType(input)
        let RESULT = smoke_Constructors_create_String(c_input.ref)
        if (RESULT.has_value) {
            return moveFromCType(RESULT.returned_value)
        } else {
            throw Constructors.ErrorEnum(rawValue: RESULT.error_code)!
        }
    }
    private static func create(input: [Double]) -> _baseRef {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Constructors_create__3Double_4(c_input.ref))
    }
}
extension Constructors: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ConstructorscopyFromCType(_ handle: _baseRef) -> Constructors {
    return Constructors(cConstructors: smoke_Constructors_copy_handle(handle))
}
internal func ConstructorsmoveFromCType(_ handle: _baseRef) -> Constructors {
    return Constructors(cConstructors: handle)
}
internal func ConstructorscopyFromCType(_ handle: _baseRef) -> Constructors? {
    guard handle != 0 else {
        return nil
    }
    return ConstructorsmoveFromCType(handle) as Constructors
}
internal func ConstructorsmoveFromCType(_ handle: _baseRef) -> Constructors? {
    guard handle != 0 else {
        return nil
    }
    return ConstructorsmoveFromCType(handle) as Constructors
}
internal func copyToCType(_ swiftClass: Constructors) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Constructors) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Constructors?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Constructors?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftEnum: Constructors.ErrorEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Constructors.ErrorEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: Constructors.ErrorEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Constructors.ErrorEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> Constructors.ErrorEnum {
    return Constructors.ErrorEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Constructors.ErrorEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> Constructors.ErrorEnum? {
    guard handle != 0 else {
        return nil
    }
    return Constructors.ErrorEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Constructors.ErrorEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
