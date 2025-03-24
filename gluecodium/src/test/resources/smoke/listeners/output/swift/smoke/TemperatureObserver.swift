//

//

import Foundation

/// Observer interface for monitoring changes in thermometer ("Observer of subject").
public protocol TemperatureObserver : AnyObject {

    func onTemperatureUpdate(thermometer: Thermometer) -> Void
}

internal class _TemperatureObserver: TemperatureObserver {

    let c_instance : _baseRef

    init(cTemperatureObserver: _baseRef) {
        guard cTemperatureObserver != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cTemperatureObserver
    }

    deinit {
        smoke_TemperatureObserver_remove_swift_object_from_wrapper_cache(c_instance)
        smoke_TemperatureObserver_release_handle(c_instance)
    }

    public func onTemperatureUpdate(thermometer: Thermometer) -> Void {
        let c_thermometer = moveToCType(thermometer)
        smoke_TemperatureObserver_onTemperatureUpdate(self.c_instance, c_thermometer.ref)
    }

}






@_cdecl("_CBridgeInitsmoke_TemperatureObserver")
internal func _CBridgeInitsmoke_TemperatureObserver(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = _TemperatureObserver(cTemperatureObserver: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}

internal func getRef(_ ref: TemperatureObserver?, owning: Bool = true) -> RefHolder {

    guard let reference = ref else {
        return RefHolder(0)
    }

    if let instanceReference = reference as? NativeBase {
        let handle_copy = smoke_TemperatureObserver_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: smoke_TemperatureObserver_release_handle)
            : RefHolder(handle_copy)
    }

    var functions = smoke_TemperatureObserver_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }


    functions.smoke_TemperatureObserver_onTemperatureUpdate = {(swift_class_pointer, thermometer) in

        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! TemperatureObserver

        swift_class.onTemperatureUpdate(thermometer: Thermometer_moveFromCType(thermometer))
    }
    let proxy = smoke_TemperatureObserver_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: smoke_TemperatureObserver_release_handle) : RefHolder(proxy)
}

extension _TemperatureObserver: NativeBase {
    /// :nodoc:
    var c_handle: _baseRef { return c_instance }
}
internal func TemperatureObserver_copyFromCType(_ handle: _baseRef) -> TemperatureObserver {
    if let swift_pointer = smoke_TemperatureObserver_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? TemperatureObserver {
        return re_constructed
    }
    if let swift_pointer = smoke_TemperatureObserver_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? TemperatureObserver {
        return re_constructed
    }
    if let swift_pointer = smoke_TemperatureObserver_get_typed(smoke_TemperatureObserver_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? TemperatureObserver {
        smoke_TemperatureObserver_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}

internal func TemperatureObserver_moveFromCType(_ handle: _baseRef) -> TemperatureObserver {
    if let swift_pointer = smoke_TemperatureObserver_get_swift_object_from_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? TemperatureObserver {
        smoke_TemperatureObserver_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_TemperatureObserver_get_swift_object_from_wrapper_cache(handle),
        let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? TemperatureObserver {
        smoke_TemperatureObserver_release_handle(handle)
        return re_constructed
    }
    if let swift_pointer = smoke_TemperatureObserver_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? TemperatureObserver {
        smoke_TemperatureObserver_cache_swift_object_wrapper(handle, swift_pointer)
        return typed
    }
    fatalError("Failed to initialize Swift object")
}

internal func TemperatureObserver_copyFromCType(_ handle: _baseRef) -> TemperatureObserver? {
    guard handle != 0 else {
        return nil
    }
    return TemperatureObserver_moveFromCType(handle) as TemperatureObserver
}
internal func TemperatureObserver_moveFromCType(_ handle: _baseRef) -> TemperatureObserver? {
    guard handle != 0 else {
        return nil
    }
    return TemperatureObserver_moveFromCType(handle) as TemperatureObserver
}

internal func copyToCType(_ swiftClass: TemperatureObserver) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: TemperatureObserver) -> RefHolder {
    return getRef(swiftClass, owning: true)
}

internal func copyToCType(_ swiftClass: TemperatureObserver?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}

internal func moveToCType(_ swiftClass: TemperatureObserver?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}



