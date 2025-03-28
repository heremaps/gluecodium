//

//

import Foundation

/// A class, which reads temperature and updates observers according to the given interval.
/// "Subject" in observer design pattern.
public class Thermometer {

    public typealias NotificationError = String

    public typealias AnotherNotificationError = Thermometer.SomeThermometerErrorCode


    public init(interval: TimeInterval, observers: [TemperatureObserver]) {
        let _result = Thermometer.makeWithDuration(interval: interval, observers: observers)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_Thermometer_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
        Thermometer.notifyObservers(thermometer: self, someObservers: observers);
    }


    public init(observers: [TemperatureObserver]) {
        let _result = Thermometer.makeWithoutDuration(observers: observers)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_Thermometer_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
        Thermometer.notifyObservers(thermometer: self, someObservers: observers);
    }


    public init(id: Int32, observers: [TemperatureObserver]) throws {
        let _result = try Thermometer.throwingMake(id: id, observers: observers)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_Thermometer_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
        try Thermometer.throwingNotifyObservers(thermometer: self, someObservers: observers);
    }


    public init(label: String, niceObservers: [TemperatureObserver]) throws {
        let _result = Thermometer.nothrowMake(label: label, niceObservers: niceObservers)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_Thermometer_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
        try Thermometer.throwingNotifyObservers(thermometer: self, someObservers: niceObservers);
    }


    public init(dummy: Bool, observers: [TemperatureObserver]) throws {
        let _result = try Thermometer.anotherThrowingMake(dummy: dummy, observers: observers)
        guard _result != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = _result
        smoke_Thermometer_cache_swift_object_wrapper(c_instance, Unmanaged<AnyObject>.passUnretained(self).toOpaque())
        try Thermometer.throwingNotifyObservers(thermometer: self, someObservers: observers);
    }


    let c_instance : _baseRef

    init(cThermometer: _baseRef) {
        guard cThermometer != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cThermometer
    }

    deinit {
        smoke_Thermometer_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_Thermometer_release_handle(c_instance)
    }

    public enum SomeThermometerErrorCode : UInt32, CaseIterable, Codable {

        case errorNone

        case errorFatal
    }
    private static func makeWithDuration(interval: TimeInterval, observers: [TemperatureObserver]) -> _baseRef {
        let c_interval = moveToCType(interval)
        let c_observers = foobar_moveToCType(observers)
        let c_result_handle = smoke_Thermometer_makeWithDuration(c_interval.ref, c_observers.ref)
        return moveFromCType(c_result_handle)
    }
    private static func makeWithoutDuration(observers: [TemperatureObserver]) -> _baseRef {
        let c_observers = foobar_moveToCType(observers)
        let c_result_handle = smoke_Thermometer_makeWithoutDuration(c_observers.ref)
        return moveFromCType(c_result_handle)
    }
    private static func throwingMake(id: Int32, observers: [TemperatureObserver]) throws -> _baseRef {
        let c_id = moveToCType(id)
        let c_observers = foobar_moveToCType(observers)
        let RESULT = smoke_Thermometer_throwingMake(c_id.ref, c_observers.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as Thermometer.NotificationError
        }
        let c_result_handle = RESULT.returned_value
        return moveFromCType(c_result_handle)
    }
    private static func nothrowMake(label: String, niceObservers: [TemperatureObserver]) -> _baseRef {
        let c_label = moveToCType(label)
        let c_niceObservers = foobar_moveToCType(niceObservers)
        let c_result_handle = smoke_Thermometer_nothrowMake(c_label.ref, c_niceObservers.ref)
        return moveFromCType(c_result_handle)
    }
    private static func anotherThrowingMake(dummy: Bool, observers: [TemperatureObserver]) throws -> _baseRef {
        let c_dummy = moveToCType(dummy)
        let c_observers = foobar_moveToCType(observers)
        let RESULT = smoke_Thermometer_anotherThrowingMake(c_dummy.ref, c_observers.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as Thermometer.AnotherNotificationError
        }
        let c_result_handle = RESULT.returned_value
        return moveFromCType(c_result_handle)
    }
    public static func notifyObservers(thermometer: Thermometer, someObservers: [TemperatureObserver]) -> Void {
        let c_thermometer = moveToCType(thermometer)
        let c_someObservers = foobar_moveToCType(someObservers)
        smoke_Thermometer_notifyObservers(c_thermometer.ref, c_someObservers.ref)
    }
    public static func throwingNotifyObservers(thermometer: Thermometer, someObservers: [TemperatureObserver]) throws -> Void {
        let c_thermometer = moveToCType(thermometer)
        let c_someObservers = foobar_moveToCType(someObservers)
        let RESULT = smoke_Thermometer_throwingNotifyObservers(c_thermometer.ref, c_someObservers.ref)
        if (!RESULT.has_value) {
            throw moveFromCType(RESULT.error_value) as Thermometer.NotificationError
        }
    }
    public func forceUpdate() -> Void {
        smoke_Thermometer_forceUpdate(self.c_instance)
    }
    public func getCelsius() -> Double {
        let c_result_handle = smoke_Thermometer_getCelsius(self.c_instance)
        return moveFromCType(c_result_handle)
    }
    public func getKelvin() -> Double {
        let c_result_handle = smoke_Thermometer_getKelvin(self.c_instance)
        return moveFromCType(c_result_handle)
    }
    public func getFahrenheit() -> Double {
        let c_result_handle = smoke_Thermometer_getFahrenheit(self.c_instance)
        return moveFromCType(c_result_handle)
    }

}



internal func getRef(_ ref: Thermometer?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = smoke_Thermometer_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: smoke_Thermometer_release_handle)
        : RefHolder(handle_copy)
}

extension Thermometer: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
extension Thermometer: Hashable {
    /// :nodoc:
    public static func == (lhs: Thermometer, rhs: Thermometer) -> Bool {
        return lhs.c_handle == rhs.c_handle
    }

    /// :nodoc:
    public func hash(into hasher: inout Hasher) {
        hasher.combine(c_handle)
    }
}

internal func Thermometer_copyFromCType(_ handle: _baseRef) -> Thermometer {
    if let swift_pointer = smoke_Thermometer_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Thermometer {
        return re_constructed
    }
    let result = Thermometer(cThermometer: smoke_Thermometer_copy_handle(handle))
    smoke_Thermometer_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func Thermometer_moveFromCType(_ handle: _baseRef) -> Thermometer {
    if let swift_pointer = smoke_Thermometer_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? Thermometer {
        smoke_Thermometer_release_handle(handle)
        return re_constructed
    }
    let result = Thermometer(cThermometer: handle)
    smoke_Thermometer_cache_swift_object_wrapper(handle, Unmanaged<AnyObject>.passUnretained(result).toOpaque())
    return result
}

internal func Thermometer_copyFromCType(_ handle: _baseRef) -> Thermometer? {
    guard handle != 0 else {
        return nil
    }
    return Thermometer_moveFromCType(handle) as Thermometer
}
internal func Thermometer_moveFromCType(_ handle: _baseRef) -> Thermometer? {
    guard handle != 0 else {
        return nil
    }
    return Thermometer_moveFromCType(handle) as Thermometer
}

internal func copyToCType(_ swiftClass: Thermometer) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: Thermometer) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftClass: Thermometer?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: Thermometer?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftEnum: Thermometer.SomeThermometerErrorCode) -> PrimitiveHolder<UInt32> {
    return PrimitiveHolder(swiftEnum.rawValue)
}
internal func moveToCType(_ swiftEnum: Thermometer.SomeThermometerErrorCode) -> PrimitiveHolder<UInt32> {
    return copyToCType(swiftEnum)
}

internal func copyToCType(_ swiftEnum: Thermometer.SomeThermometerErrorCode?) -> RefHolder {
    return copyToCType(swiftEnum?.rawValue)
}
internal func moveToCType(_ swiftEnum: Thermometer.SomeThermometerErrorCode?) -> RefHolder {
    return moveToCType(swiftEnum?.rawValue)
}

internal func copyFromCType(_ cValue: UInt32) -> Thermometer.SomeThermometerErrorCode {
    return Thermometer.SomeThermometerErrorCode(rawValue: cValue)!
}
internal func moveFromCType(_ cValue: UInt32) -> Thermometer.SomeThermometerErrorCode {
    return copyFromCType(cValue)
}

internal func copyFromCType(_ handle: _baseRef) -> Thermometer.SomeThermometerErrorCode? {
    guard handle != 0 else {
        return nil
    }
    return Thermometer.SomeThermometerErrorCode(rawValue: uint32_t_value_get(handle))!
}
internal func moveFromCType(_ handle: _baseRef) -> Thermometer.SomeThermometerErrorCode? {
    defer {
        uint32_t_release_handle(handle)
    }
    return copyFromCType(handle)
}


extension String : Error {
}
extension Thermometer.SomeThermometerErrorCode : Error {
}
