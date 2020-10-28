//
//
import Foundation
@OnLambda
public typealias AttributesLambda = () -> Void
internal func copyFromCType(_ handle: _baseRef) -> AttributesLambda {
    return moveFromCType(smoke_AttributesLambda_copy_handle(handle))
}
internal func moveFromCType(_ handle: _baseRef) -> AttributesLambda {
    let refHolder = RefHolder(ref: handle, release: smoke_AttributesLambda_release_handle)
    return { () -> Void in
        return moveFromCType(smoke_AttributesLambda_call(refHolder.ref))
    }
}
internal func copyFromCType(_ handle: _baseRef) -> AttributesLambda? {
    guard handle != 0 else {
        return nil
    }
    return copyFromCType(handle) as AttributesLambda
}
internal func moveFromCType(_ handle: _baseRef) -> AttributesLambda? {
    guard handle != 0 else {
        return nil
    }
    return moveFromCType(handle) as AttributesLambda
}
internal func createFunctionalTable(_ swiftType: @escaping AttributesLambda) -> smoke_AttributesLambda_FunctionTable {
    class smoke_AttributesLambda_Holder {
        let closure: AttributesLambda
        init(_ closure: @escaping AttributesLambda) {
            self.closure = closure
        }
    }
    var functions = smoke_AttributesLambda_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(smoke_AttributesLambda_Holder(swiftType)).toOpaque()
    functions.release = { swift_closure_pointer in
        if let swift_closure = swift_closure_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_closure).release()
        }
    }
    functions.smoke_AttributesLambda_call = { swift_closure_pointer in
        let closure_holder = Unmanaged<AnyObject>.fromOpaque(swift_closure_pointer!).takeUnretainedValue() as! smoke_AttributesLambda_Holder
        return copyToCType(closure_holder.closure()).ref
    }
    return functions
}
internal func copyToCType(_ swiftType: @escaping AttributesLambda) -> RefHolder {
    let handle = smoke_AttributesLambda_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: @escaping AttributesLambda) -> RefHolder {
    let handle = smoke_AttributesLambda_create_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_AttributesLambda_release_handle)
}
internal func copyToCType(_ swiftType: AttributesLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_AttributesLambda_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(handle)
}
internal func moveToCType(_ swiftType: AttributesLambda?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let handle = smoke_AttributesLambda_create_optional_proxy(createFunctionalTable(swiftType))
    return RefHolder(ref: handle, release: smoke_AttributesLambda_release_handle)
}
