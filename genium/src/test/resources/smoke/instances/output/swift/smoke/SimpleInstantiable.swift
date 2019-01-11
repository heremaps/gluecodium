//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: SimpleInstantiable?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_SimpleInstantiable_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_SimpleInstantiable_release_handle)
        : RefHolder(handle_copy)
}
public class SimpleInstantiable {
    let c_instance : _baseRef
    init(cSimpleInstantiable: _baseRef) {
        guard cSimpleInstantiable != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cSimpleInstantiable
    }
    deinit {
        smoke_SimpleInstantiable_release_handle(c_instance)
    }
    public func setStringValue(stringValue: String) -> Void {
        return smoke_SimpleInstantiable_setStringValue(c_instance, stringValue)
    }
    public func getStringValue() -> String {
        return moveFromCType(smoke_SimpleInstantiable_getStringValue(c_instance))
    }
}
extension SimpleInstantiable: NativeBase {
    var c_handle: _baseRef { return c_instance }
}