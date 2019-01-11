//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ProfileManagerInterface?, owning: Bool = true) -> RefHolder {
    guard let reference = ref else {
        return RefHolder(0)
    }
    if let instanceReference = reference as? NativeBase {
        let handle_copy = examples_ProfileManagerInterface_copy_handle(instanceReference.c_handle)
        return owning
            ? RefHolder(ref: handle_copy, release: examples_ProfileManagerInterface_release_handle)
            : RefHolder(handle_copy)
    }
    var functions = examples_ProfileManagerInterface_FunctionTable()
    functions.swift_pointer = Unmanaged<AnyObject>.passRetained(reference).toOpaque()
    functions.release = {swift_class_pointer in
        if let swift_class = swift_class_pointer {
            Unmanaged<AnyObject>.fromOpaque(swift_class).release()
        }
    }
    functions.examples_ProfileManagerInterface_createProfile = {(swift_class_pointer, username) in
        let swift_class = Unmanaged<AnyObject>.fromOpaque(swift_class_pointer!).takeUnretainedValue() as! ProfileManagerInterface
        defer {
            std_string_release_handle(username)
        }
        swift_class.createProfile(username: String(data: Data(bytes: std_string_data_get(username),
                                                count: Int(std_string_size_get(username))), encoding: .utf8)!)
    }
    let proxy = examples_ProfileManagerInterface_create_proxy(functions)
    return owning ? RefHolder(ref: proxy, release: examples_ProfileManagerInterface_release_handle) : RefHolder(proxy)
}
public protocol ProfileManagerInterface : AnyObject {
    func createProfile(username: String) -> Void
}
internal class _ProfileManagerInterface: ProfileManagerInterface {
    let c_instance : _baseRef
    init(cProfileManagerInterface: _baseRef) {
        guard cProfileManagerInterface != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cProfileManagerInterface
    }
    deinit {
        examples_ProfileManagerInterface_release_handle(c_instance)
    }
    public func createProfile(username: String) -> Void {
        return moveFromCType(examples_ProfileManagerInterface_createProfile(c_instance, username))
    }
}
extension _ProfileManagerInterface: NativeBase {
    var c_handle: _baseRef { return c_instance }
}