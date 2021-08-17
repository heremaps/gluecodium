//
//
import Foundation
public class EquatableClass {
    let c_instance : _baseRef
    init(cEquatableClass: _baseRef) {
        guard cEquatableClass != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cEquatableClass
    }
    deinit {
        smoke_EquatableClass_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_EquatableClass_release_handle(c_instance)
    }
    public struct EquatableStruct: Hashable {
        public var intField: Int32
        public var stringField: String
        public var nestedEquatableInstance: EquatableClass
        public var nestedPointerEquatableInstance: PointerEquatableClass
        public init(intField: Int32, stringField: String, nestedEquatableInstance: EquatableClass, nestedPointerEquatableInstance: PointerEquatableClass) {
            self.intField = intField
            self.stringField = stringField
            self.nestedEquatableInstance = nestedEquatableInstance
            self.nestedPointerEquatableInstance = nestedPointerEquatableInstance
        }
        internal init(cHandle: _baseRef) {
            intField = moveFromCType(smoke_EquatableClass_EquatableStruct_intField_get(cHandle))
            stringField = moveFromCType(smoke_EquatableClass_EquatableStruct_stringField_get(cHandle))
            nestedEquatableInstance = EquatableClass_moveFromCType(smoke_EquatableClass_EquatableStruct_nestedEquatableInstance_get(cHandle))
            nestedPointerEquatableInstance = PointerEquatableClass_moveFromCType(smoke_EquatableClass_EquatableStruct_nestedPointerEquatableInstance_get(cHandle))
        }
        /// :nodoc:
        public static func == (lhs: EquatableStruct, rhs: EquatableStruct) -> Bool {
            return
                lhs.intField == rhs.intField &&
                lhs.stringField == rhs.stringField &&
                lhs.nestedEquatableInstance == rhs.nestedEquatableInstance &&
                lhs.nestedPointerEquatableInstance === rhs.nestedPointerEquatableInstance
        }
        /// :nodoc:
        public func hash(into hasher: inout Hasher) {
            hasher.combine(intField)
            hasher.combine(stringField)
            hasher.combine(nestedEquatableInstance)
            hasher.combine(Unmanaged<AnyObject>.passUnretained(nestedPointerEquatableInstance).toOpaque().hashValue)
        }
    }
}
internal func getRef(_ ref: EquatableClass?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_EquatableClass_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_EquatableClass_release_handle)
        : RefHolder(handle_copy)
}
extension EquatableClass: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension EquatableClass: Hashable {
    /// :nodoc:
    public static func == (lhs: EquatableClass, rhs: EquatableClass) -> Bool {
        return smoke_EquatableClass_equal(lhs.c_handle, rhs.c_handle)
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(smoke_EquatableClass_hash(c_handle))
    }
}
internal func EquatableClass_copyFromCType(_ handle: _baseRef) -> EquatableClass {
    if let swift_pointer = smoke_EquatableClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EquatableClass {
        return re_constructed
    }
    let result = EquatableClass(cEquatableClass: smoke_EquatableClass_copy_handle(handle))
    smoke_EquatableClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func EquatableClass_moveFromCType(_ handle: _baseRef) -> EquatableClass {
    if let swift_pointer = smoke_EquatableClass_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? EquatableClass {
        smoke_EquatableClass_release_handle(handle)
        return re_constructed
    }
    let result = EquatableClass(cEquatableClass: handle)
    smoke_EquatableClass_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func EquatableClass_copyFromCType(_ handle: _baseRef) -> EquatableClass? {
    guard handle != 0 else {
        return nil
    }
    return EquatableClass_moveFromCType(handle) as EquatableClass
}
internal func EquatableClass_moveFromCType(_ handle: _baseRef) -> EquatableClass? {
    guard handle != 0 else {
        return nil
    }
    return EquatableClass_moveFromCType(handle) as EquatableClass
}
internal func copyToCType(_ swiftClass: EquatableClass) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EquatableClass) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: EquatableClass?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: EquatableClass?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> EquatableClass.EquatableStruct {
    return EquatableClass.EquatableStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableClass.EquatableStruct {
    defer {
        smoke_EquatableClass_EquatableStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EquatableClass.EquatableStruct) -> RefHolder {
    let c_intField = moveToCType(swiftType.intField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_nestedEquatableInstance = moveToCType(swiftType.nestedEquatableInstance)
    let c_nestedPointerEquatableInstance = moveToCType(swiftType.nestedPointerEquatableInstance)
    return RefHolder(smoke_EquatableClass_EquatableStruct_create_handle(c_intField.ref, c_stringField.ref, c_nestedEquatableInstance.ref, c_nestedPointerEquatableInstance.ref))
}
internal func moveToCType(_ swiftType: EquatableClass.EquatableStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EquatableClass_EquatableStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> EquatableClass.EquatableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_EquatableClass_EquatableStruct_unwrap_optional_handle(handle)
    return EquatableClass.EquatableStruct(cHandle: unwrappedHandle) as EquatableClass.EquatableStruct
}
internal func moveFromCType(_ handle: _baseRef) -> EquatableClass.EquatableStruct? {
    defer {
        smoke_EquatableClass_EquatableStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: EquatableClass.EquatableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_intField = moveToCType(swiftType.intField)
    let c_stringField = moveToCType(swiftType.stringField)
    let c_nestedEquatableInstance = moveToCType(swiftType.nestedEquatableInstance)
    let c_nestedPointerEquatableInstance = moveToCType(swiftType.nestedPointerEquatableInstance)
    return RefHolder(smoke_EquatableClass_EquatableStruct_create_optional_handle(c_intField.ref, c_stringField.ref, c_nestedEquatableInstance.ref, c_nestedPointerEquatableInstance.ref))
}
internal func moveToCType(_ swiftType: EquatableClass.EquatableStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_EquatableClass_EquatableStruct_release_optional_handle)
}
