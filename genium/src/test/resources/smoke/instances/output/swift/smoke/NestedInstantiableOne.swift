//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: NestedInstantiableOne?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class NestedInstantiableOne {
    let c_instance : _baseRef

    public init?(cNestedInstantiableOne: _baseRef) {
        guard cNestedInstantiableOne != 0 else {
            return nil
        }
        c_instance = cNestedInstantiableOne
    }

    deinit {
        smoke_NestedInstantiableOne_release(c_instance)
    }
    public func setSameTypeInstances(instanceOne: SimpleInstantiableOne?, instanceTwo: SimpleInstantiableOne?) -> Void {
        let instanceOne_handle = getRef(instanceOne)
        let instanceTwo_handle = getRef(instanceTwo)
        return smoke_NestedInstantiableOne_setSameTypeInstances(c_instance, instanceOne_handle.ref, instanceTwo_handle.ref)
    }

    public func getInstanceOne() -> SimpleInstantiableOne? {
        let cResult = smoke_NestedInstantiableOne_getInstanceOne(c_instance)
        return SimpleInstantiableOne(cSimpleInstantiableOne: cResult)
    }

    public func getInstanceTwo() -> SimpleInstantiableOne? {
        let cResult = smoke_NestedInstantiableOne_getInstanceTwo(c_instance)
        return SimpleInstantiableOne(cSimpleInstantiableOne: cResult)
    }

}

extension NestedInstantiableOne: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
