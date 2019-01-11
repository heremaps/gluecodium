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
        return moveFromCType(examples_ProfileManager_createProfile(c_instance, username))
    }
    public func changeProfile(username: String) -> String {
        return moveFromCType(examples_ProfileManager_changeProfile(c_instance, username))
    }
    public func deleteProfile(username: String) -> Void {
        return moveFromCType(examples_ProfileManager_deleteProfile(c_instance, username))
    }
}
extension ProfileManager: NativeBase {
    var c_handle: _baseRef { return c_instance }
}