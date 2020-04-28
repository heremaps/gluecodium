//
//
import Foundation
public class Dates {
    public typealias DateTypeDef = Date
    public typealias DateArray = [Date]
    public typealias DateMap = [String: Date]
    public var dateProperty: Date {
        get {
            return moveFromCType(smoke_Dates_dateProperty_get(self.c_instance))
        }
        set {
            let c_newValue = moveToCType(newValue)
            return moveFromCType(smoke_Dates_dateProperty_set(self.c_instance, c_newValue.ref))
        }
    }
    let c_instance : _baseRef
    init(cDates: _baseRef) {
        guard cDates != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cDates
    }
    deinit {
        smoke_Dates_release_handle(c_instance)
    }
    public struct DateStruct {
        public var dateField: Date
        public init(dateField: Date) {
            self.dateField = dateField
        }
        internal init(cHandle: _baseRef) {
            dateField = moveFromCType(smoke_Dates_DateStruct_dateField_get(cHandle))
        }
    }
    public func dateMethod(input: Date) -> Date {
        let c_input = moveToCType(input)
        return moveFromCType(smoke_Dates_dateMethod(self.c_instance, c_input.ref))
    }
}
internal func getRef(_ ref: Dates?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Dates_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Dates_release_handle)
        : RefHolder(handle_copy)
}
extension Dates: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func Dates_copyFromCType(_ handle: _baseRef) -> Dates {
    if let swift_pointer = smoke_Dates_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Dates {
        return re_constructed
    }
    let result = Dates(cDates: smoke_Dates_copy_handle(handle))
    smoke_Dates_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Dates_moveFromCType(_ handle: _baseRef) -> Dates {
    if let swift_pointer = smoke_Dates_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Dates {
        return re_constructed
    }
    let result = Dates(cDates: handle)
    smoke_Dates_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}
internal func Dates_copyFromCType(_ handle: _baseRef) -> Dates? {
    guard handle != 0 else {
        return nil
    }
    return Dates_moveFromCType(handle) as Dates
}
internal func Dates_moveFromCType(_ handle: _baseRef) -> Dates? {
    guard handle != 0 else {
        return nil
    }
    return Dates_moveFromCType(handle) as Dates
}
internal func copyToCType(_ swiftClass: Dates) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Dates) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Dates?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Dates?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyFromCType(_ handle: _baseRef) -> Dates.DateStruct {
    return Dates.DateStruct(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Dates.DateStruct {
    defer {
        smoke_Dates_DateStruct_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Dates.DateStruct) -> RefHolder {
    let c_dateField = moveToCType(swiftType.dateField)
    return RefHolder(smoke_Dates_DateStruct_create_handle(c_dateField.ref))
}
internal func moveToCType(_ swiftType: Dates.DateStruct) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Dates_DateStruct_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Dates.DateStruct? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = smoke_Dates_DateStruct_unwrap_optional_handle(handle)
    return Dates.DateStruct(cHandle: unwrappedHandle) as Dates.DateStruct
}
internal func moveFromCType(_ handle: _baseRef) -> Dates.DateStruct? {
    defer {
        smoke_Dates_DateStruct_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Dates.DateStruct?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_dateField = moveToCType(swiftType.dateField)
    return RefHolder(smoke_Dates_DateStruct_create_optional_handle(c_dateField.ref))
}
internal func moveToCType(_ swiftType: Dates.DateStruct?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: smoke_Dates_DateStruct_release_optional_handle)
}
