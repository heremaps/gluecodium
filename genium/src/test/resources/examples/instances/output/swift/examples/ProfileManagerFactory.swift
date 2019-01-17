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
        return ProfileManagermoveFromCType(examples_ProfileManagerFactory_createProfileManager())
    }
    public static func createProfileManagerInterface() -> ProfileManagerInterface? {
        return ProfileManagerInterfacemoveFromCType(examples_ProfileManagerFactory_createProfileManagerInterface())
    }
}
extension ProfileManagerFactory: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ProfileManagerFactorycopyFromCType(_ handle: _baseRef) -> ProfileManagerFactory {
    return ProfileManagerFactory(cProfileManagerFactory: handle)
}
internal func ProfileManagerFactorymoveFromCType(_ handle: _baseRef) -> ProfileManagerFactory {
    return ProfileManagerFactorycopyFromCType(handle)
}
internal func ProfileManagerFactorycopyFromCType(_ handle: _baseRef) -> ProfileManagerFactory? {
    guard handle != 0 else {
        return nil
    }
    return ProfileManagerFactorymoveFromCType(handle) as ProfileManagerFactory
}
internal func ProfileManagerFactorymoveFromCType(_ handle: _baseRef) -> ProfileManagerFactory? {
    return ProfileManagerFactorycopyFromCType(handle)
}
internal func copyToCType(_ swiftClass: ProfileManagerFactory) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ProfileManagerFactory) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ProfileManagerFactory?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ProfileManagerFactory?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}