//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ProfileManagerFactory?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_ProfileManagerFactory_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_ProfileManagerFactory_release_handle)
        : RefHolder(handle_copy)
}
public class ProfileManagerFactory {
    let c_instance : _baseRef
    init(cProfileManagerFactory: _baseRef) {
        guard cProfileManagerFactory != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cProfileManagerFactory
    }
    deinit {
        examples_ProfileManagerFactory_release_handle(c_instance)
    }
    public static func createProfileManager() -> ProfileManager? {
        let cResult = examples_ProfileManagerFactory_createProfileManager()
        if cResult == 0 { return nil }
        return ProfileManager(cProfileManager: cResult)
    }
    public static func createProfileManagerInterface() -> ProfileManagerInterface? {
        let cResult = examples_ProfileManagerFactory_createProfileManagerInterface()
        if cResult == 0 { return nil }
        if let swift_pointer = examples_ProfileManagerInterface_get_swift_object_from_cache(cResult),
                let re_constructed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeUnretainedValue() as? ProfileManagerInterface {
            return re_constructed
        }
        return _ProfileManagerInterface(cProfileManagerInterface: cResult)
    }
}
extension ProfileManagerFactory: NativeBase {
    var c_handle: _baseRef { return c_instance }
}