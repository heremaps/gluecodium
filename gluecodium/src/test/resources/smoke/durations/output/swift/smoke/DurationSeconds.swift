//
//
import Foundation
public class DurationSeconds {
    public typealias DurationTypeAlias = TimeInterval
    public typealias DurationList = [TimeInterval]
    public typealias DurationSet = Set<TimeInterval>
    public typealias DurationMap = [String: TimeInterval]
    public typealias DurationKeyMap = [TimeInterval: String]
    public var durationProperty: TimeInterval {
        get {
            let c_result_handle = smoke_DurationSeconds_durationProperty_get(self.c_instance)
            return moveFromCType(c_result_handle)
        }
        set {
            let c_value = moveToCType(newValue)
            smoke_DurationSeconds_durationProperty_set(self.c_instance, c_value.ref)
        }
    }
    let c_instance : _baseRef
    init(cDurationSeconds: _baseRef) {
        guard cDurationSeconds != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cDurationSeconds
    }
    deinit {
        smoke_DurationSeconds_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_DurationSeconds_release_handle(c_instance)
    }
    public struct DurationStruct {
        public var durationField: TimeInterval
        public init(durationField: TimeInterval) {
            self.durationField = durationField
        }
        internal init(cHandle: _baseRef) {
            durationField = moveFromCType(smoke_DurationSeconds_DurationStruct_durationField_get(cHandle))
        }
    }
    public func durationFunction(input: TimeInterval) -> TimeInterval {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_DurationSeconds_durationFunction(self.c_instance, c_input.ref)
        return moveFromCType(c_result_handle)
    }
    public func nullableDurationFunction(input: TimeInterval?) -> TimeInterval? {
        let c_input = moveToCType(input)
        let c_result_handle = smoke_DurationSeconds_nullableDurationFunction(self.c_instance, c_input.ref)
        return moveFromCType(c_result_handle)
    }
}
internal func getRef(_ ref: DurationSeconds?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_DurationSeconds_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_DurationSeconds_release_handle)
        : RefHolder(handle_copy)
}
extension DurationSeconds: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension DurationSeconds: Hashable {
    /// :nodoc:
    public static func == (lhs: DurationSeconds, rhs: DurationSeconds) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }
    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}
internal func DurationSeconds_copyFromCType(_ handle: _baseRef) -> DurationSeconds {
    if let swift_pointer = smoke_DurationSeconds_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DurationSeconds {
        return re_constructed
    }
    let result = DurationSeconds(cDurationSeconds: smoke_DurationSeconds_copy_handle(handle))
    smoke_DurationSeconds_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func DurationSeconds_moveFromCType(_ handle: _baseRef) -> DurationSeconds {
    if let swift_pointer = smoke_DurationSeconds_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? DurationSeconds {
        smoke_DurationSeconds_release_handle(handle)
        return re_constructed
    }
    let result = DurationSeconds(cDurationSeconds: handle)
    smoke_DurationSeconds_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func DurationSeconds_copyFromCType(_ handle: _baseRef) -> DurationSeconds? {
    guard handle != 0 else {
        return nil
    }
    return DurationSeconds_moveFromCType(handle) as DurationSeconds
}
internal func DurationSeconds_moveFromCType(_ handle: _baseRef) -> DurationSeconds? {
    guard handle != 0 else {
        return nil
    }
    return DurationSeconds_moveFromCType(handle) as DurationSeconds
}
internal func copyToCType(_ swiftClass: DurationSeconds) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DurationSeconds) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: DurationSeconds?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: DurationSeconds?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> DurationSeconds.DurationStruct {
    return DurationSeconds.DurationStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> DurationSeconds.DurationStruct {
    defer {
        smoke_DurationSeconds_DurationStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DurationSeconds.DurationStruct) -> RefHolder {
    let c_durationField = moveToCType(swiftType.durationField)
    return RefHolder(smoke_DurationSeconds_DurationStruct_create_handle(c_durationField.ref))
}
internal func moveToCType(_ swiftType: DurationSeconds.DurationStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DurationSeconds_DurationStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> DurationSeconds.DurationStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_DurationSeconds_DurationStruct_unwrap_optional_handle(handle)
    return DurationSeconds.DurationStruct(cHandle: unwrappedHandle) as DurationSeconds.DurationStruct
}
internal func moveFromCType(_ handle: _baseRef) -> DurationSeconds.DurationStruct? {
    defer {
        smoke_DurationSeconds_DurationStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: DurationSeconds.DurationStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_durationField = moveToCType(swiftType.durationField)
    return RefHolder(smoke_DurationSeconds_DurationStruct_create_optional_handle(c_durationField.ref))
}
internal func moveToCType(_ swiftType: DurationSeconds.DurationStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_DurationSeconds_DurationStruct_release_optional_handle)
}
