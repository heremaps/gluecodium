//
//
import Foundation
public class MethodOverloads {
    public typealias StringArray = [String]
    public typealias IntArray = [Int8]
    let c_instance : _baseRef
    init(cMethodOverloads: _baseRef) {
        guard cMethodOverloads != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cMethodOverloads
    }
    deinit {
        smoke_MethodOverloads_remove_swift_object_from_wrapper_cache(c_instance)
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
    }
    public func isBoolean(input: Bool) -> Bool {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean_Boolean(self.c_instance, c_input.ref))
    }
    public func isBoolean(input: Int8) -> Bool {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean_Byte(self.c_instance, c_input.ref))
    }
    public func isBoolean(input: String) -> Bool {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean_String(self.c_instance, c_input.ref))
    }
    public func isBoolean(input: MethodOverloads.Point) -> Bool {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean_Point(self.c_instance, c_input.ref))
    }
    public func isBoolean(input1: Bool, input2: Int8, input3: String, input4: MethodOverloads.Point) -> Bool {
        let c_input1 = moveToCType(input1)
        let c_input2 = moveToCType(input2)
        let c_input3 = moveToCType(input3)
        let c_input4 = moveToCType(input4)
        return moveFromCType(smoke_MethodOverloads_isBoolean_Boolean_Byte_String_Point(self.c_instance, c_input1.ref, c_input2.ref, c_input3.ref, c_input4.ref))
    }
    public func isBoolean(input: MethodOverloads.StringArray) -> Bool {
        let c_input = foobar_moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean__3String_4(self.c_instance, c_input.ref))
    }
    public func isBoolean(input: MethodOverloads.IntArray) -> Bool {
        let c_input = foobar_moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isBoolean__3Byte_4(self.c_instance, c_input.ref))
    }
    public func isBoolean() -> Bool {
        return moveFromCType(smoke_MethodOverloads_isBoolean_(self.c_instance))
    }
    public func isFloat(input: String) -> Bool {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isFloat_String(self.c_instance, c_input.ref))
    }
    public func isFloat(input: MethodOverloads.IntArray) -> Bool {
        let c_input = foobar_moveToCType(input)
        return moveFromCType(smoke_MethodOverloads_isFloat__3Byte_4(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: MethodOverloads?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_MethodOverloads_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_MethodOverloads_release_handle)
        : RefHolder(handle_copy)
}
extension MethodOverloads: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
extension MethodOverloads: Hashable {
    // :nodoc:
    public static func == (lhs: MethodOverloads, rhs: MethodOverloads) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    // :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func MethodOverloads_copyFromCType(_ handle: _baseRef) -> MethodOverloads {
    if let swift_pointer = smoke_MethodOverloads_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? MethodOverloads {
        return re_constructed
    }
    let result = MethodOverloads(cMethodOverloads: smoke_MethodOverloads_copy_handle(handle))
    smoke_MethodOverloads_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func MethodOverloads_moveFromCType(_ handle: _baseRef) -> MethodOverloads {
    if let swift_pointer = smoke_MethodOverloads_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? MethodOverloads {
        smoke_MethodOverloads_release_handle(handle)
        return re_constructed
    }
    let result = MethodOverloads(cMethodOverloads: handle)
    smoke_MethodOverloads_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func MethodOverloads_copyFromCType(_ handle: _baseRef) -> MethodOverloads? {
    guard handle != 0 else {
        return nil
    }
    return MethodOverloads_moveFromCType(handle) as MethodOverloads
}
internal func MethodOverloads_moveFromCType(_ handle: _baseRef) -> MethodOverloads? {
    guard handle != 0 else {
        return nil
    }
    return MethodOverloads_moveFromCType(handle) as MethodOverloads
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
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_MethodOverloads_Point_create_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: MethodOverloads.Point) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_MethodOverloads_Point_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> MethodOverloads.Point? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_MethodOverloads_Point_unwrap_optional_handle(handle)
    return MethodOverloads.Point(cHandle: unwrappedHandle) as MethodOverloads.Point
}
internal func moveFromCType(_ handle: _baseRef) -> MethodOverloads.Point? {
    defer {
        smoke_MethodOverloads_Point_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: MethodOverloads.Point?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_x = moveToCType(swiftType.x)
    let c_y = moveToCType(swiftType.y)
    return RefHolder(smoke_MethodOverloads_Point_create_optional_handle(c_x.ref, c_y.ref))
}
internal func moveToCType(_ swiftType: MethodOverloads.Point?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_MethodOverloads_Point_release_optional_handle)
}
