//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: INameRules?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = namerules_NameRules_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: namerules_NameRules_release_handle)
        : RefHolder(handle_copy)
}
public class INameRules {
    public typealias IStringArray = [String]
    public init() {
        let _result = INameRules.create()
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    public var intPropertyPod: UInt32 {
        get {
            return moveFromCType(namerules_NameRules_intProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(namerules_NameRules_intProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var isBooleanPropertyPod: Bool {
        get {
            return moveFromCType(namerules_NameRules_booleanProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(namerules_NameRules_booleanProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    public var structPropertyPod: INameRules.IExampleStruct {
        get {
            return moveFromCType(namerules_NameRules_structProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(namerules_NameRules_structProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cINameRules: _baseRef) {
        guard cINameRules != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cINameRules
    }
    deinit {
        namerules_NameRules_release_handle(c_instance)
    }
    public enum IExampleError : UInt32, CaseIterable {
        case none
        case fatal
    }
    public struct IExampleStruct {
        public var iValue: Double
        public var iIntValue: [Int64]
        public init(iValue: Double, iIntValue: [Int64]) {
            self.iValue = iValue
            self.iIntValue = iIntValue
        }
        internal init(cHandle: _baseRef) {
            iValue = moveFromCType(namerules_NameRules_ExampleStruct_iValue_get(cHandle))
            iIntValue = moveFromCType(namerules_NameRules_ExampleStruct_iIntValue_get(cHandle))
        }
    }
    private static func create() -> _baseRef {
        return moveFromCType(namerules_NameRules_create())
    }
    public func someMethod(someArgument: INameRules.IExampleStruct) throws -> Double {
        let c_someArgument = moveToCType(someArgument)
        let RESULT = namerules_NameRules_someMethod(self.c_instance, c_someArgument.ref)
        if (RESULT.has_value) {
            return moveFromCType(RESULT.returned_value)
        } else {
            throw INameRules.IExampleError(rawValue: RESULT.error_code)!
        }
    }
}
extension INameRules: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func INameRulescopyFromCType(_ handle: _baseRef) -> INameRules {
    return INameRules(cINameRules: namerules_NameRules_copy_handle(handle))
}
internal func INameRulesmoveFromCType(_ handle: _baseRef) -> INameRules {
    return INameRules(cINameRules: handle)
}
internal func INameRulescopyFromCType(_ handle: _baseRef) -> INameRules? {
    guard handle != 0 else {
        return nil
    }
    return INameRulesmoveFromCType(handle) as INameRules
}
internal func INameRulesmoveFromCType(_ handle: _baseRef) -> INameRules? {
    guard handle != 0 else {
        return nil
    }
    return INameRulesmoveFromCType(handle) as INameRules
}
internal func copyToCType(_ swiftClass: INameRules) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: INameRules) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: INameRules?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: INameRules?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> INameRules.IExampleStruct {
    return INameRules.IExampleStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> INameRules.IExampleStruct {
    defer {
        namerules_NameRules_ExampleStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: INameRules.IExampleStruct) -> RefHolder {
    let c_iValue = moveToCType(swiftType.iValue)
    let c_iIntValue = moveToCType(swiftType.iIntValue)
    return RefHolder(namerules_NameRules_ExampleStruct_create_handle(c_iValue.ref, c_iIntValue.ref))
}
internal func moveToCType(_ swiftType: INameRules.IExampleStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: namerules_NameRules_ExampleStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> INameRules.IExampleStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = namerules_NameRules_ExampleStruct_unwrap_optional_handle(handle)
    return INameRules.IExampleStruct(cHandle: unwrappedHandle) as INameRules.IExampleStruct
}
internal func moveFromCType(_ handle: _baseRef) -> INameRules.IExampleStruct? {
    defer {
        namerules_NameRules_ExampleStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: INameRules.IExampleStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_iValue = moveToCType(swiftType.iValue)
    let c_iIntValue = moveToCType(swiftType.iIntValue)
    return RefHolder(namerules_NameRules_ExampleStruct_create_optional_handle(c_iValue.ref, c_iIntValue.ref))
}
internal func moveToCType(_ swiftType: INameRules.IExampleStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: namerules_NameRules_ExampleStruct_release_optional_handle)
}
internal func copyToCType(_ swiftEnum: INameRules.IExampleError) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: INameRules.IExampleError) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}
internal func copyToCType(_ swiftEnum: INameRules.IExampleError?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: INameRules.IExampleError?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}
internal func copyFromCType(_ cValue: UInt32) -> INameRules.IExampleError {
    return INameRules.IExampleError(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> INameRules.IExampleError {
    return copyFromCType(cValue)
}
internal func copyFromCType(_ handle: _baseRef) -> INameRules.IExampleError? {
    guard handle != 0 else {
        return nil
    }
    return INameRules.IExampleError(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> INameRules.IExampleError? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}
extension INameRules.IExampleError : Error {
}