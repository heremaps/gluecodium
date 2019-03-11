//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: ProfileManager?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class ProfileManager {
    let c_instance : _baseRef

    public init?(cProfileManager: _baseRef) {
        guard cProfileManager != 0 else {
            return nil
        }
        c_instance = cProfileManager
    }

    deinit {
        examples_ProfileManager_release(c_instance)
    }
    public func createProfile(username: String) -> Void {
        return examples_ProfileManager_createProfile(c_instance, username)
    }

    public func changeProfile(username: String) -> String? {
        let result_string_handle = examples_ProfileManager_changeProfile(c_instance, username)
        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }

    public func deleteProfile(username: String) -> Void {
        return examples_ProfileManager_deleteProfile(c_instance, username)
    }

}

extension ProfileManager: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
