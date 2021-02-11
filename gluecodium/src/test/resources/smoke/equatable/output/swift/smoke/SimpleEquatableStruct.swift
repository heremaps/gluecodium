//
//
import Foundation
public struct SimpleEquatableStruct: Hashable {
    public var classField: NonEquatableClass
    public var interfaceField: NonEquatableInterface
    public var nullableClassField: NonEquatableClass?
    public var nullableInterfaceField: NonEquatableInterface?
    public init(classField: NonEquatableClass, interfaceField: NonEquatableInterface, nullableClassField: NonEquatableClass? = nil, nullableInterfaceField: NonEquatableInterface? = nil) {
        self.classField = classField
        self.interfaceField = interfaceField
        self.nullableClassField = nullableClassField
        self.nullableInterfaceField = nullableInterfaceField
    }
    internal init(cHandle: _baseRef) {
        classField = foobar_NonEquatableClass_moveFromCType(smoke_SimpleEquatableStruct_classField_get(cHandle))
        interfaceField = foobar_NonEquatableInterface_moveFromCType(smoke_SimpleEquatableStruct_interfaceField_get(cHandle))
        nullableClassField = foobar_NonEquatableClass_moveFromCType(smoke_SimpleEquatableStruct_nullableClassField_get(cHandle))
        nullableInterfaceField = foobar_NonEquatableInterface_moveFromCType(smoke_SimpleEquatableStruct_nullableInterfaceField_get(cHandle))
    }
    // :nodoc:
    public static func == (lhs: SimpleEquatableStruct, rhs: SimpleEquatableStruct) -> Bool {
        return
            lhs.classField === rhs.classField &&
            lhs.interfaceField === rhs.interfaceField &&
            lhs.nullableClassField === rhs.nullableClassField &&
            lhs.nullableInterfaceField === rhs.nullableInterfaceField
    }
    // :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(Unmanaged<AnyObject>.passUnretained(classField).toOpaque().hashValue)
        hasher.combine(Unmanaged<AnyObject>.passUnretained(interfaceField).toOpaque().hashValue)
        hasher.combine(nullableClassField != nil ? Unmanaged<AnyObject>.passUnretained(nullableClassField!).toOpaque().hashValue : 0)
        hasher.combine(nullableInterfaceField != nil ? Unmanaged<AnyObject>.passUnretained(nullableInterfaceField!).toOpaque().hashValue : 0)
    }
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> SimpleEquatableStruct {
    return SimpleEquatableStruct(cHandle: handle)
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> SimpleEquatableStruct {
    defer {
        smoke_SimpleEquatableStruct_release_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: SimpleEquatableStruct) -> RefHolder {
    let c_classField = foobar_moveToCType(swiftType.classField)
    let c_interfaceField = foobar_moveToCType(swiftType.interfaceField)
    let c_nullableClassField = foobar_moveToCType(swiftType.nullableClassField)
    let c_nullableInterfaceField = foobar_moveToCType(swiftType.nullableInterfaceField)
    return RefHolder(smoke_SimpleEquatableStruct_create_handle(c_classField.ref, c_interfaceField.ref, c_nullableClassField.ref, c_nullableInterfaceField.ref))
}
internal func foobar_moveToCType(_ swiftType: SimpleEquatableStruct) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_SimpleEquatableStruct_release_handle)
}
internal func foobar_copyFromCType(_ handle: _baseRef) -> SimpleEquatableStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_SimpleEquatableStruct_unwrap_optional_handle(handle)
    return SimpleEquatableStruct(cHandle: unwrappedHandle) as SimpleEquatableStruct
}
internal func foobar_moveFromCType(_ handle: _baseRef) -> SimpleEquatableStruct? {
    defer {
        smoke_SimpleEquatableStruct_release_optional_handle(handle)
    }
    return foobar_copyFromCType(handle)
}
internal func foobar_copyToCType(_ swiftType: SimpleEquatableStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_classField = foobar_moveToCType(swiftType.classField)
    let c_interfaceField = foobar_moveToCType(swiftType.interfaceField)
    let c_nullableClassField = foobar_moveToCType(swiftType.nullableClassField)
    let c_nullableInterfaceField = foobar_moveToCType(swiftType.nullableInterfaceField)
    return RefHolder(smoke_SimpleEquatableStruct_create_optional_handle(c_classField.ref, c_interfaceField.ref, c_nullableClassField.ref, c_nullableInterfaceField.ref))
}
internal func foobar_moveToCType(_ swiftType: SimpleEquatableStruct?) -> RefHolder {
    return RefHolder(ref: foobar_copyToCType(swiftType).ref, release: smoke_SimpleEquatableStruct_release_optional_handle)
}
