//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: MethodOverloads?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_MethodOverloads_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_MethodOverloads_release_handle)
        : RefHolder(handle_copy)
}
public class MethodOverloads {
    let c_instance : _baseRef
    init(cMethodOverloads: _baseRef) {
        guard cMethodOverloads != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cMethodOverloads
    }
    deinit {
        smoke_MethodOverloads_release_handle(c_instance)
    }
    public struct Point {
        public var x: Double
        public var y: Double
        public init(x: Double, y: Double) {
            self.x = x
            self.y = y
        }
        internal init(cHandle: _baseRef) {
            x = moveFromCType(smoke_MethodOverloads_Point_x_get(cHandle))
            y = moveFromCType(smoke_MethodOverloads_Point_y_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let c_x = moveToCType(x)
            let c_y = moveToCType(y)
            return smoke_MethodOverloads_Point_create_handle(c_x.ref, c_y.ref)
        }
    }
    public func isBoolean(input: Bool) -> Bool {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean_boolOverload(self.c_instance, c_input.ref))
    }
    public func isBoolean(input: Int8) -> Bool {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean_intOverload(self.c_instance, c_input.ref))
    }
    public func isBoolean(input: String) -> Bool {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean_stringOverload(self.c_instance, c_input.ref))
    }
    public func isBoolean(input: MethodOverloads.Point) -> Bool {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean_structOverload(self.c_instance, c_input.ref))
    }
    public func isBoolean(input1: Bool, input2: Int8, input3: String, input4: MethodOverloads.Point) -> Bool {
            let c_input1 = moveToCType(input1)
            let c_input2 = moveToCType(input2)
            let c_input3 = moveToCType(input3)
            let c_input4 = moveToCType(input4)
        return moveFromCType(smoke_MethodOverloads_isBoolean_everythingOverload(self.c_instance, c_input1.ref, c_input2.ref, c_input3.ref, c_input4.ref))
    }
    public func isBoolean(input: [String]) -> Bool {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean_stringArrayOverload(self.c_instance, c_input.ref))
    }
    public func isBoolean(input: [Int8]) -> Bool {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean_intArrayOverload(self.c_instance, c_input.ref))
    }
    public func isBoolean() -> Bool {
        return moveFromCType(smoke_MethodOverloads_isBoolean_constOverload(self.c_instance))
    }
    public func isFloat(input: String) -> Bool {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isFloat_stringOverload(self.c_instance, c_input.ref))
    }
    public func isFloat(input: [Int8]) -> Bool {
            let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isFloat_intArrayOverload(self.c_instance, c_input.ref))
    }
}
extension MethodOverloads: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func MethodOverloadscopyFromCType(_ handle: _baseRef) -> MethodOverloads {
    return MethodOverloads(cMethodOverloads: handle)
}
internal func MethodOverloadsmoveFromCType(_ handle: _baseRef) -> MethodOverloads {
    return MethodOverloadscopyFromCType(handle)
}
internal func MethodOverloadscopyFromCType(_ handle: _baseRef) -> MethodOverloads? {
    guard handle != 0 else {
        return nil
    }
    return MethodOverloadsmoveFromCType(handle) as MethodOverloads
}
internal func MethodOverloadsmoveFromCType(_ handle: _baseRef) -> MethodOverloads? {
    return MethodOverloadscopyFromCType(handle)
}
internal func copyToCType(_ swiftClass: MethodOverloads) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: MethodOverloads) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: MethodOverloads?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: MethodOverloads?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> MethodOverloads.Point {
    return MethodOverloads.Point(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> MethodOverloads.Point {
    defer {
        smoke_MethodOverloads_Point_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: MethodOverloads.Point) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: MethodOverloads.Point) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_MethodOverloads_Point_release_handle)
}
