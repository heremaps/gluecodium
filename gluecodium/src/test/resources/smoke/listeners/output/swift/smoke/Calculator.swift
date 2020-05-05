//
//
import Foundation
public class Calculator {
    let c_instance : _baseRef
    init(cCalculator: _baseRef) {
        guard cCalculator != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCalculator
    }
    deinit {
        smoke_Calculator_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_Calculator_release_handle(c_instance)
    }
    public static func registerListener(listener: CalculatorListener) -> Void {
        let c_listener = moveToCType(listener)
        return moveFromCType(smoke_Calculator_registerListener(c_listener.ref))
    }
    public static func unregisterListener(listener: CalculatorListener) -> Void {
        let c_listener = moveToCType(listener)
        return moveFromCType(smoke_Calculator_unregisterListener(c_listener.ref))
    }
}
internal func getRef(_ ref: Calculator?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Calculator_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Calculator_release_handle)
        : RefHolder(handle_copy)
}
extension Calculator: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func Calculator_copyFromCType(_ handle: _baseRef) -> Calculator {
    if let swift_pointer = smoke_Calculator_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Calculator {
        return re_constructed
    }
    let result = Calculator(cCalculator: smoke_Calculator_copy_handle(handle))
    smoke_Calculator_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Calculator_moveFromCType(_ handle: _baseRef) -> Calculator {
    if let swift_pointer = smoke_Calculator_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Calculator {
        return re_constructed
    }
    let result = Calculator(cCalculator: handle)
    smoke_Calculator_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Calculator_copyFromCType(_ handle: _baseRef) -> Calculator? {
    guard handle != 0 else {
        return nil
    }
    return Calculator_moveFromCType(handle) as Calculator
}
internal func Calculator_moveFromCType(_ handle: _baseRef) -> Calculator? {
    guard handle != 0 else {
        return nil
    }
    return Calculator_moveFromCType(handle) as Calculator
}
internal func copyToCType(_ swiftClass: Calculator) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Calculator) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Calculator?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Calculator?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
