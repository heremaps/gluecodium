//
//
import Foundation
public class LevelOne {
    let c_instance : _baseRef
    init(cLevelOne: _baseRef) {
        guard cLevelOne != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cLevelOne
    }
    deinit {
        smoke_LevelOne_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_LevelOne_release_handle(c_instance)
    }
    public class LevelTwo {
        let c_instance : _baseRef
        init(cLevelTwo: _baseRef) {
            guard cLevelTwo != 0 else {
                fatalError("Nullptr value is not supported for initializers")
            }
            c_instance = cLevelTwo
        }
        deinit {
            smoke_LevelOne_LevelTwo_remove_swift_object_from_wrapper_cache(c_instance)
            smoke_LevelOne_LevelTwo_release_handle(c_instance)
        }
        public class LevelThree {
            let c_instance : _baseRef
            init(cLevelThree: _baseRef) {
                guard cLevelThree != 0 else {
                    fatalError("Nullptr value is not supported for initializers")
                }
                c_instance = cLevelThree
            }
            deinit {
                smoke_LevelOne_LevelTwo_LevelThree_remove_swift_object_from_wrapper_cache(c_instance)
                smoke_LevelOne_LevelTwo_LevelThree_release_handle(c_instance)
            }
            public enum LevelFourEnum : UInt32, CaseIterable, Codable {
                case none
            }
            public struct LevelFour {
                public static let foo: Bool = false
                public var stringField: String
                public init(stringField: String) {
                    self.stringField = stringField
                }
                internal init(cHandle: _baseRef) {
                    stringField = moveFromCType(smoke_LevelOne_LevelTwo_LevelThree_LevelFour_stringField_get(cHandle))
                }
                public static func fooFactory() -> LevelOne.LevelTwo.LevelThree.LevelFour {
                    return moveFromCType(smoke_LevelOne_LevelTwo_LevelThree_LevelFour_fooFactory())
                }
            }
            public func foo(input: InnerInterface) -> InnerClass {
                let c_input = moveToCType(input)
                return InnerClass_moveFromCType(smoke_LevelOne_LevelTwo_LevelThree_foo(self.c_instance, c_input.ref))
            }
        }
    }
}
internal func getRef(_ ref: LevelOne?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_LevelOne_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_LevelOne_release_handle)
        : RefHolder(handle_copy)
}
extension LevelOne: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension LevelOne: Hashable {
    /// :nodoc:
    public static func == (lhs: LevelOne, rhs: LevelOne) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func LevelOne_copyFromCType(_ handle: _baseRef) -> LevelOne {
    if let swift_pointer = smoke_LevelOne_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LevelOne {
        return re_constructed
    }
    let result = LevelOne(cLevelOne: smoke_LevelOne_copy_handle(handle))
    smoke_LevelOne_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func LevelOne_moveFromCType(_ handle: _baseRef) -> LevelOne {
    if let swift_pointer = smoke_LevelOne_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LevelOne {
        smoke_LevelOne_release_handle(handle)
        return re_constructed
    }
    let result = LevelOne(cLevelOne: handle)
    smoke_LevelOne_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func LevelOne_copyFromCType(_ handle: _baseRef) -> LevelOne? {
    guard handle != 0 else {
        return nil
    }
    return LevelOne_moveFromCType(handle) as LevelOne
}
internal func LevelOne_moveFromCType(_ handle: _baseRef) -> LevelOne? {
    guard handle != 0 else {
        return nil
    }
    return LevelOne_moveFromCType(handle) as LevelOne
}
internal func copyToCType(_ swiftClass: LevelOne) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: LevelOne) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: LevelOne?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: LevelOne?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: LevelOne.LevelTwo?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_LevelOne_LevelTwo_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_LevelOne_LevelTwo_release_handle)
        : RefHolder(handle_copy)
}
extension LevelOne.LevelTwo: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension LevelOne.LevelTwo: Hashable {
    /// :nodoc:
    public static func == (lhs: LevelOne.LevelTwo, rhs: LevelOne.LevelTwo) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func LevelOne_LevelTwo_copyFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo {
    if let swift_pointer = smoke_LevelOne_LevelTwo_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LevelOne.LevelTwo {
        return re_constructed
    }
    let result = LevelOne.LevelTwo(cLevelTwo: smoke_LevelOne_LevelTwo_copy_handle(handle))
    smoke_LevelOne_LevelTwo_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func LevelOne_LevelTwo_moveFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo {
    if let swift_pointer = smoke_LevelOne_LevelTwo_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LevelOne.LevelTwo {
        smoke_LevelOne_LevelTwo_release_handle(handle)
        return re_constructed
    }
    let result = LevelOne.LevelTwo(cLevelTwo: handle)
    smoke_LevelOne_LevelTwo_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func LevelOne_LevelTwo_copyFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo? {
    guard handle != 0 else {
        return nil
    }
    return LevelOne_LevelTwo_moveFromCType(handle) as LevelOne.LevelTwo
}
internal func LevelOne_LevelTwo_moveFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo? {
    guard handle != 0 else {
        return nil
    }
    return LevelOne_LevelTwo_moveFromCType(handle) as LevelOne.LevelTwo
}
internal func copyToCType(_ swiftClass: LevelOne.LevelTwo) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: LevelOne.LevelTwo) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: LevelOne.LevelTwo?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: LevelOne.LevelTwo?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func getRef(_ ref: LevelOne.LevelTwo.LevelThree?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_LevelOne_LevelTwo_LevelThree_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_LevelOne_LevelTwo_LevelThree_release_handle)
        : RefHolder(handle_copy)
}
extension LevelOne.LevelTwo.LevelThree: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension LevelOne.LevelTwo.LevelThree: Hashable {
    /// :nodoc:
    public static func == (lhs: LevelOne.LevelTwo.LevelThree, rhs: LevelOne.LevelTwo.LevelThree) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func LevelOne_LevelTwo_LevelThree_copyFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo.LevelThree {
    if let swift_pointer = smoke_LevelOne_LevelTwo_LevelThree_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LevelOne.LevelTwo.LevelThree {
        return re_constructed
    }
    let result = LevelOne.LevelTwo.LevelThree(cLevelThree: smoke_LevelOne_LevelTwo_LevelThree_copy_handle(handle))
    smoke_LevelOne_LevelTwo_LevelThree_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func LevelOne_LevelTwo_LevelThree_moveFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo.LevelThree {
    if let swift_pointer = smoke_LevelOne_LevelTwo_LevelThree_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? LevelOne.LevelTwo.LevelThree {
        smoke_LevelOne_LevelTwo_LevelThree_release_handle(handle)
        return re_constructed
    }
    let result = LevelOne.LevelTwo.LevelThree(cLevelThree: handle)
    smoke_LevelOne_LevelTwo_LevelThree_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func LevelOne_LevelTwo_LevelThree_copyFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo.LevelThree? {
    guard handle != 0 else {
        return nil
    }
    return LevelOne_LevelTwo_LevelThree_moveFromCType(handle) as LevelOne.LevelTwo.LevelThree
}
internal func LevelOne_LevelTwo_LevelThree_moveFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo.LevelThree? {
    guard handle != 0 else {
        return nil
    }
    return LevelOne_LevelTwo_LevelThree_moveFromCType(handle) as LevelOne.LevelTwo.LevelThree
}
internal func copyToCType(_ swiftClass: LevelOne.LevelTwo.LevelThree) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: LevelOne.LevelTwo.LevelThree) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: LevelOne.LevelTwo.LevelThree?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: LevelOne.LevelTwo.LevelThree?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo.LevelThree.LevelFour {
    return LevelOne.LevelTwo.LevelThree.LevelFour(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo.LevelThree.LevelFour {
    defer {
        smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: LevelOne.LevelTwo.LevelThree.LevelFour) -> RefHolder {
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: LevelOne.LevelTwo.LevelThree.LevelFour) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo.LevelThree.LevelFour? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_LevelOne_LevelTwo_LevelThree_LevelFour_unwrap_optional_handle(handle)
    return LevelOne.LevelTwo.LevelThree.LevelFour(cHandle: unwrappedHandle) as LevelOne.LevelTwo.LevelThree.LevelFour
}
internal func moveFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo.LevelThree.LevelFour? {
    defer {
        smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: LevelOne.LevelTwo.LevelThree.LevelFour?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_stringField = moveToCType(swiftType.stringField)
    return RefHolder(smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_optional_handle(c_stringField.ref))
}
internal func moveToCType(_ swiftType: LevelOne.LevelTwo.LevelThree.LevelFour?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: LevelOne.LevelTwo.LevelThree.LevelFourEnum) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: LevelOne.LevelTwo.LevelThree.LevelFourEnum) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: LevelOne.LevelTwo.LevelThree.LevelFourEnum?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: LevelOne.LevelTwo.LevelThree.LevelFourEnum?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> LevelOne.LevelTwo.LevelThree.LevelFourEnum {
    return LevelOne.LevelTwo.LevelThree.LevelFourEnum(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> LevelOne.LevelTwo.LevelThree.LevelFourEnum {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo.LevelThree.LevelFourEnum? {
    guard handle != 0 else {
        return nil
    }
    return LevelOne.LevelTwo.LevelThree.LevelFourEnum(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> LevelOne.LevelTwo.LevelThree.LevelFourEnum? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
