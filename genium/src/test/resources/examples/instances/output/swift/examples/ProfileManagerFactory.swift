//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: ProfileManagerFactory?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class ProfileManagerFactory {
    let c_instance : _baseRef

    public init?(cProfileManagerFactory: _baseRef) {
        guard cProfileManagerFactory != 0 else {
            return nil
        }
        c_instance = cProfileManagerFactory
    }

    deinit {
        examples_ProfileManagerFactory_release(c_instance)
    }
    public static func createProfileManager() -> ProfileManager? {
        let cResult = examples_ProfileManagerFactory_createProfileManager()
        return ProfileManager(cProfileManager: cResult)
    }

    public static func createProfileManagerInterface() -> ProfileManagerInterface? {
        let cResult = examples_ProfileManagerFactory_createProfileManagerInterface()

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
