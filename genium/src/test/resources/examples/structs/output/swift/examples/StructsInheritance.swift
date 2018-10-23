//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: StructsInheritance?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class StructsInheritance {
    let c_instance : _baseRef

    public init?(cStructsInheritance: _baseRef) {
        guard cStructsInheritance != 0 else {
            return nil
        }
        c_instance = cStructsInheritance
    }

    deinit {
        examples_StructsInheritance_release(c_instance)
    }
    public struct SyncResultInherited {
        public var lastUpdatedTimeStamp: UInt64
        public var numberOfChanges: UInt32
        public var id: Int32

        public init(lastUpdatedTimeStamp: UInt64, numberOfChanges: UInt32, id: Int32) {
            self.lastUpdatedTimeStamp = lastUpdatedTimeStamp
            self.numberOfChanges = numberOfChanges
            self.id = id
        }

        public func convertToSyncResult() -> Structs.SyncResult {
            return Structs.SyncResult(lastUpdatedTimeStamp: lastUpdatedTimeStamp, numberOfChanges: numberOfChanges)
        }

        internal init?(cSyncResultInherited: _baseRef) {
            lastUpdatedTimeStamp = examples_StructsInheritance_SyncResultInherited_lastUpdatedTimeStamp_get(cSyncResultInherited)
            numberOfChanges = examples_StructsInheritance_SyncResultInherited_numberOfChanges_get(cSyncResultInherited)
            id = examples_StructsInheritance_SyncResultInherited_id_get(cSyncResultInherited)
        }

        internal func convertToCType() -> _baseRef {
            let lastUpdatedTimeStamp_handle = lastUpdatedTimeStamp
            let numberOfChanges_handle = numberOfChanges
            let id_handle = id
            return examples_StructsInheritance_SyncResultInherited_create(lastUpdatedTimeStamp_handle, numberOfChanges_handle, id_handle)
        }
    }

    public func methodWithInheritedType(input: StructsInheritance.SyncResultInherited) -> StructsInheritance.SyncResultInherited? {
        let input_handle = input.convertToCType()
        defer {
            examples_StructsInheritance_SyncResultInherited_release(input_handle)
        }
        let cResult = examples_StructsInheritance_methodWithInheritedType(c_instance, input_handle)
        defer {
            examples_StructsInheritance_SyncResultInherited_release(cResult)
        }
        return StructsInheritance.SyncResultInherited(cSyncResultInherited: cResult)
    }

}

extension StructsInheritance: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
