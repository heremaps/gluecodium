//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Calculator?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Calculator_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Calculator_release_handle)
        : RefHolder(handle_copy)
}
public class Calculator {
    let c_instance : _baseRef
    init(cCalculator: _baseRef) {
        guard cCalculator != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cCalculator
    }
    deinit {
        smoke_Calculator_release_handle(c_instance)
    }
    public static func registerListener(listener: CalculatorListener?) -> Void {
        let listener_handle = getRef(listener)
        return moveFromCType(smoke_Calculator_registerListener(listener_handle.ref))
    }
    public static func unregisterListener(listener: CalculatorListener?) -> Void {
        let listener_handle = getRef(listener)
        return moveFromCType(smoke_Calculator_unregisterListener(listener_handle.ref))
    }
}
extension Calculator: NativeBase {
    var c_handle: _baseRef { return c_instance }
}