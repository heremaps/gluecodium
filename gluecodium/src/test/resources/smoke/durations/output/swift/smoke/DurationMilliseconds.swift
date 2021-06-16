//
//
import Foundation
public class DurationMilliseconds {
    public typealias DurationTypeAlias = TimeInterval
    public typealias DurationList = [TimeInterval]
    public typealias DurationSet = Set<TimeInterval>
    public typealias DurationMap = [String: TimeInterval]
    public typealias DurationKeyMap = [TimeInterval: String]
    public var durationProperty: TimeInterval {
        get {
            let c_result_handle = smoke_DurationMilliseconds_durationProperty_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_DurationMilliseconds_durationProperty_set(self.c_instance, c_value.ref)
        }
    }
    let c_instance : _baseRef
    init(cDurationMilliseconds: _baseRef) {
        guard cDurationMilliseconds != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cDurationMilliseconds
    }
    deinit {
        smoke_DurationMilliseconds_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_DurationMilliseconds_release_handle(c_instance)
    }
    public struct DurationStruct {
        public var durationField: TimeInterval
        public init(durationField: TimeInterval) {
            self.durationField = durationField
        }
        internal init(cHandle: _baseRef) {
            durationField = moveFromCType(smoke_DurationMilliseconds_DurationStruct_durationField_get(cHandle))
        }
    }
    public func durationFunction(input: TimeInterval) -> TimeInterval {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_DurationMilliseconds_durationFunction(self.c_instance, c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public func nullableDurationFunction(input: TimeInterval?) -> TimeInterval? {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_DurationMilliseconds_nullableDurationFunction(self.c_instance, c_input.ref)
        return moveFromCType(c_result_handle)
    }
}
internal func getRef(_ ref: DurationMilliseconds?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_DurationMilliseconds_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_DurationMilliseconds_release_handle)
        : RefHolder(handle_copy)
}
extension DurationMilliseconds: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension DurationMilliseconds: Hashable {
    /// :nodoc:
    public static func == (lhs: DurationMilliseconds, rhs: DurationMilliseconds) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func DurationMilliseconds_copyFromCType(_ handle: _baseRef) -> DurationMilliseconds {
    if let swift_pointer = smoke_DurationMilliseconds_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DurationMilliseconds {
        return re_constructed
    }
    let result = DurationMilliseconds(cDurationMilliseconds: smoke_DurationMilliseconds_copy_handle(handle))
    smoke_DurationMilliseconds_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func DurationMilliseconds_moveFromCType(_ handle: _baseRef) -> DurationMilliseconds {
    if let swift_pointer = smoke_DurationMilliseconds_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DurationMilliseconds {
        smoke_DurationMilliseconds_release_handle(handle)
        return re_constructed
    }
    let result = DurationMilliseconds(cDurationMilliseconds: handle)
    smoke_DurationMilliseconds_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func DurationMilliseconds_copyFromCType(_ handle: _baseRef) -> DurationMilliseconds? {
    guard handle != 0 else {
        return nil
    }
    return DurationMilliseconds_moveFromCType(handle) as DurationMilliseconds
}
internal func DurationMilliseconds_moveFromCType(_ handle: _baseRef) -> DurationMilliseconds? {
    guard handle != 0 else {
        return nil
    }
    return DurationMilliseconds_moveFromCType(handle) as DurationMilliseconds
}
internal func copyToCType(_ swiftClass: DurationMilliseconds) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DurationMilliseconds) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: DurationMilliseconds?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DurationMilliseconds?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> DurationMilliseconds.DurationStruct {
    return DurationMilliseconds.DurationStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DurationMilliseconds.DurationStruct {
    defer {
        smoke_DurationMilliseconds_DurationStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DurationMilliseconds.DurationStruct) -> RefHolder {
    let c_durationField = moveToCType(swiftType.durationField)
    return RefHolder(smoke_DurationMilliseconds_DurationStruct_create_handle(c_durationField.ref))
}
internal func moveToCType(_ swiftType: DurationMilliseconds.DurationStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DurationMilliseconds_DurationStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DurationMilliseconds.DurationStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DurationMilliseconds_DurationStruct_unwrap_optional_handle(handle)
    return DurationMilliseconds.DurationStruct(cHandle: unwrappedHandle) as DurationMilliseconds.DurationStruct
}
internal func moveFromCType(_ handle: _baseRef) -> DurationMilliseconds.DurationStruct? {
    defer {
        smoke_DurationMilliseconds_DurationStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DurationMilliseconds.DurationStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_durationField = moveToCType(swiftType.durationField)
    return RefHolder(smoke_DurationMilliseconds_DurationStruct_create_optional_handle(c_durationField.ref))
}
internal func moveToCType(_ swiftType: DurationMilliseconds.DurationStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DurationMilliseconds_DurationStruct_release_optional_handle)
}
