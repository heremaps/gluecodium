//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: NestedInstantiableTwo?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class NestedInstantiableTwo {
    let c_instance : _baseRef

    public init?(cNestedInstantiableTwo: _baseRef) {
        guard cNestedInstantiableTwo != 0 else {
            return nil
        }
        c_instance = cNestedInstantiableTwo
    }

    deinit {
        smoke_NestedInstantiableTwo_release(c_instance)
    }
    public func setMultipleTypeInstances(instanceOne: SimpleInstantiableOne, instanceTwo: SimpleInstantiableTwo, nestedInstantiable: NestedInstantiableOne) -> Void {
        let instanceOneHandle = getRef(instanceOne)
        let instanceTwoHandle = getRef(instanceTwo)
        let nestedInstantiableHandle = getRef(nestedInstantiable)
        return smoke_NestedInstantiableTwo_setMultipleTypeInstances(c_instance, instanceOneHandle.ref, instanceTwoHandle.ref, nestedInstantiableHandle.ref)
    }

    public func getInstantiableOne() -> SimpleInstantiableOne? {
        let cResult = smoke_NestedInstantiableTwo_getInstantiableOne(c_instance)
        return SimpleInstantiableOne(cSimpleInstantiableOne: cResult)
    }

    public func getInstantiableTwo() -> SimpleInstantiableTwo? {
        let cResult = smoke_NestedInstantiableTwo_getInstantiableTwo(c_instance)
        return SimpleInstantiableTwo(cSimpleInstantiableTwo: cResult)
    }

    public func getNestedInstantiable() -> NestedInstantiableOne? {
        let cResult = smoke_NestedInstantiableTwo_getNestedInstantiable(c_instance)
        return NestedInstantiableOne(cNestedInstantiableOne: cResult)
    }

    public func setSelfInstantiable(selfInstance: NestedInstantiableTwo) -> Void {
        let selfInstanceHandle = getRef(selfInstance)
        return smoke_NestedInstantiableTwo_setSelfInstantiable(c_instance, selfInstanceHandle.ref)
    }

    public func getSelfInstantiable() -> NestedInstantiableTwo? {
        let cResult = smoke_NestedInstantiableTwo_getSelfInstantiable(c_instance)
        return NestedInstantiableTwo(cNestedInstantiableTwo: cResult)
    }

}

extension NestedInstantiableTwo: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
