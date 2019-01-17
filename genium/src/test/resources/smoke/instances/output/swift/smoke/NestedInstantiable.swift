//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: NestedInstantiable?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_NestedInstantiable_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_NestedInstantiable_release_handle)
        : RefHolder(handle_copy)
}
public class NestedInstantiable {
    let c_instance : _baseRef
    init(cNestedInstantiable: _baseRef) {
        guard cNestedInstantiable != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cNestedInstantiable
    }
    deinit {
        smoke_NestedInstantiable_release_handle(c_instance)
    }
    public func setSameTypeInstances(instanceOne: SimpleInstantiable?, instanceTwo: SimpleInstantiable?) -> Void {
            let c_instanceOne = moveToCType(instanceOne)
            let c_instanceTwo = moveToCType(instanceTwo)
        return moveFromCType(smoke_NestedInstantiable_setSameTypeInstances(self.c_instance, c_instanceOne.ref, c_instanceTwo.ref))
    }
    public func getInstanceOne() -> SimpleInstantiable? {
        return SimpleInstantiablemoveFromCType(smoke_NestedInstantiable_getInstanceOne(self.c_instance))
    }
    public func instanceNotNullMethod(input: SimpleInstantiable) -> SimpleInstantiable {
            let c_input = moveToCType(input)
        return SimpleInstantiablemoveFromCType(smoke_NestedInstantiable_instanceNotNullMethod(self.c_instance, c_input.ref))
    }
}
extension NestedInstantiable: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func NestedInstantiablecopyFromCType(_ handle: _baseRef) -> NestedInstantiable {
    return NestedInstantiable(cNestedInstantiable: handle)
}
internal func NestedInstantiablemoveFromCType(_ handle: _baseRef) -> NestedInstantiable {
    return NestedInstantiablecopyFromCType(handle)
}
internal func NestedInstantiablecopyFromCType(_ handle: _baseRef) -> NestedInstantiable? {
    guard handle != 0 else {
        return nil
    }
    return NestedInstantiablemoveFromCType(handle) as NestedInstantiable
}
internal func NestedInstantiablemoveFromCType(_ handle: _baseRef) -> NestedInstantiable? {
    return NestedInstantiablecopyFromCType(handle)
}
internal func copyToCType(_ swiftClass: NestedInstantiable) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: NestedInstantiable) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: NestedInstantiable?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: NestedInstantiable?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}