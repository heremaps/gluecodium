//
//

import Foundation
internal func getRef(_ ref: Dates?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Dates_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Dates_release_handle)
        : RefHolder(handle_copy)
}
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
extension Dates: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func DatescopyFromCType(_ handle: _baseRef) -> Dates {
    return Dates(cDates: smoke_Dates_copy_handle(handle))
}
internal func DatesmoveFromCType(_ handle: _baseRef) -> Dates {
    return Dates(cDates: handle)
}
internal func DatescopyFromCType(_ handle: _baseRef) -> Dates? {
    guard handle != 0 else {
        return nil
    }
    return DatesmoveFromCType(handle) as Dates
}
internal func DatesmoveFromCType(_ handle: _baseRef) -> Dates? {
    guard handle != 0 else {
        return nil
    }
    return DatesmoveFromCType(handle) as Dates
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
