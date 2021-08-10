//
//
import Foundation
public typealias StandaloneProducer = () -> String
internal func StandaloneProducer_copyFromCType(_ handle: _baseRef) -> StandaloneProducer {
    return StandaloneProducer_moveFromCType(smoke_StandaloneProducer_copy_handle(handle))
}
internal func StandaloneProducer_moveFromCType(_ handle: _baseRef) -> StandaloneProducer {
    let refHolder = RefHolder(ref: handle, release: smoke_StandaloneProducer_release_handle)
    return { () -> String in
        return moveFromCType(smoke_StandaloneProducer_call(refHolder.ref))
    }
}
internal func StandaloneProducer_copyFromCType(_ handle: _baseRef) -> StandaloneProducer? {
    guard handle != 0 else {
        return nil
    }
    return StandaloneProducer_copyFromCType(handle) as StandaloneProducer
}
internal func StandaloneProducer_moveFromCType(_ handle: _baseRef) -> StandaloneProducer? {
    guard handle != 0 else {
        return nil
    }
    return StandaloneProducer_moveFromCType(handle) as StandaloneProducer
}
internal func StandaloneProducer_createFunctionalTable(_ swiftType: @escaping StandaloneProducer) -> smoke_StandaloneProducer_FunctionTable {
    class smoke_StandaloneProducer_Holder {
        let closure: StandaloneProducer
        init(_ closure: @escaping StandaloneProducer) {
            self.closure = closure
        }
    }
    var functions = smoke_StandaloneProducer_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_StandaloneProducer_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_StandaloneProducer_call = { swift_closure_pointer in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_StandaloneProducer_Holder
        return copyToCType(closure_holder.closure()).ref
    }
    return functions
}
internal func StandaloneProducer_copyToCType(_ swiftType: @escaping StandaloneProducer) -> RefHolder {
    let handle = smoke_StandaloneProducer_create_proxy(StandaloneProducer_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func StandaloneProducer_moveToCType(_ swiftType: @escaping StandaloneProducer) -> RefHolder {
    let handle = smoke_StandaloneProducer_create_proxy(StandaloneProducer_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_StandaloneProducer_release_handle)
}
internal func StandaloneProducer_copyToCType(_ swiftType: StandaloneProducer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_StandaloneProducer_create_optional_proxy(StandaloneProducer_createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func StandaloneProducer_moveToCType(_ swiftType: StandaloneProducer?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_StandaloneProducer_create_optional_proxy(StandaloneProducer_createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_StandaloneProducer_release_handle)
}
