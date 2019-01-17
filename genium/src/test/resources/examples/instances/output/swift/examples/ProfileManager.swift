//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: ProfileManager?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_ProfileManager_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_ProfileManager_release_handle)
        : RefHolder(handle_copy)
}
public class ProfileManager {
    let c_instance : _baseRef
    init(cProfileManager: _baseRef) {
        guard cProfileManager != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cProfileManager
    }
    deinit {
        examples_ProfileManager_release_handle(c_instance)
    }
    public func createProfile(username: String) -> Void {
            let c_username = moveToCType(username)
        return moveFromCType(examples_ProfileManager_createProfile(self.c_instance, c_username.ref))
    }
    public func changeProfile(username: String) -> String {
            let c_username = moveToCType(username)
        return moveFromCType(examples_ProfileManager_changeProfile(self.c_instance, c_username.ref))
    }
    public func deleteProfile(username: String) -> Void {
            let c_username = moveToCType(username)
        return moveFromCType(examples_ProfileManager_deleteProfile(self.c_instance, c_username.ref))
    }
}
extension ProfileManager: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ProfileManagercopyFromCType(_ handle: _baseRef) -> ProfileManager {
    return ProfileManager(cProfileManager: handle)
}
internal func ProfileManagermoveFromCType(_ handle: _baseRef) -> ProfileManager {
    return ProfileManagercopyFromCType(handle)
}
internal func ProfileManagercopyFromCType(_ handle: _baseRef) -> ProfileManager? {
    guard handle != 0 else {
        return nil
    }
    return ProfileManagermoveFromCType(handle) as ProfileManager
}
internal func ProfileManagermoveFromCType(_ handle: _baseRef) -> ProfileManager? {
    return ProfileManagercopyFromCType(handle)
}
internal func copyToCType(_ swiftClass: ProfileManager) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ProfileManager) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: ProfileManager?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: ProfileManager?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}