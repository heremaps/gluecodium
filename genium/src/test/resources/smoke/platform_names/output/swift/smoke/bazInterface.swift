//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: bazInterface?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_PlatformNamesInterface_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_PlatformNamesInterface_release_handle)
        : RefHolder(handle_copy)
}
public class bazInterface {
    public init(_ makeParameter: String) {
        let _result = bazInterface.make(makeParameter)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
    }
    public var BAZ_ATTRIBUTE: UInt32 {
        get {
            return moveFromCType(smoke_PlatformNamesInterface_basicAttribute_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_PlatformNamesInterface_basicAttribute_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cbazInterface: _baseRef) {
        guard cbazInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cbazInterface
    }
    deinit {
        smoke_PlatformNamesInterface_release_handle(c_instance)
    }
    public func BazMethod(_ BazParameter: String) -> bazStruct {
        let c_BazParameter = moveToCType(BazParameter)
        return moveFromCType(smoke_PlatformNamesInterface_BazMethod(self.c_instance, c_BazParameter.ref))
    }
    private static func make(_ makeParameter: String) -> _baseRef {
        let c_makeParameter = moveToCType(makeParameter)
        return moveFromCType(smoke_PlatformNamesInterface_make(c_makeParameter.ref))
    }
}
extension bazInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func bazInterfacecopyFromCType(_ handle: _baseRef) -> bazInterface {
    return bazInterface(cbazInterface: smoke_PlatformNamesInterface_copy_handle(handle))
}
internal func bazInterfacemoveFromCType(_ handle: _baseRef) -> bazInterface {
    return bazInterface(cbazInterface: handle)
}
internal func bazInterfacecopyFromCType(_ handle: _baseRef) -> bazInterface? {
    guard handle != 0 else {
        return nil
    }
    return bazInterfacemoveFromCType(handle) as bazInterface
}
internal func bazInterfacemoveFromCType(_ handle: _baseRef) -> bazInterface? {
    guard handle != 0 else {
        return nil
    }
    return bazInterfacemoveFromCType(handle) as bazInterface
}
internal func copyToCType(_ swiftClass: bazInterface) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: bazInterface) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: bazInterface?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: bazInterface?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
