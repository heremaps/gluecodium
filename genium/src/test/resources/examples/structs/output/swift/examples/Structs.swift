//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Structs?, owning: Bool = false) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}
public class Structs {
    let c_instance : _baseRef

    public init?(cStructs: _baseRef) {
        guard cStructs != 0 else {
            return nil
        }
        c_instance = cStructs
    }

    deinit {
        examples_Structs_release(c_instance)
    }
    public struct SyncResult {
        public var lastUpdatedTimeStamp: UInt64
        public var numberOfChanges: UInt32

        public init(lastUpdatedTimeStamp: UInt64, numberOfChanges: UInt32) {
            self.lastUpdatedTimeStamp = lastUpdatedTimeStamp
            self.numberOfChanges = numberOfChanges
        }

        internal init(cSyncResult: _baseRef) {
            lastUpdatedTimeStamp = examples_Structs_SyncResult_lastUpdatedTimeStamp_get(cSyncResult)
            numberOfChanges = examples_Structs_SyncResult_numberOfChanges_get(cSyncResult)
        }

        internal func convertToCType() -> _baseRef {
            let lastUpdatedTimeStamp_handle = lastUpdatedTimeStamp
            let numberOfChanges_handle = numberOfChanges
            return examples_Structs_SyncResult_create(lastUpdatedTimeStamp_handle, numberOfChanges_handle)
        }
    }

    public struct IdentifiableSyncResult {
        public var id: Int32
        public var syncResult: Structs.SyncResult
        public init(id: Int32, syncResult: Structs.SyncResult) {
            self.id = id
            self.syncResult = syncResult
        }
        internal init(cIdentifiableSyncResult: _baseRef) {
            id = examples_Structs_IdentifiableSyncResult_id_get(cIdentifiableSyncResult)
            do {
                let syncResult_handle = examples_Structs_IdentifiableSyncResult_syncResult_get(cIdentifiableSyncResult)
                defer {
                    examples_Structs_SyncResult_release(syncResult_handle)
                }
                syncResult = Structs.SyncResult(cSyncResult: syncResult_handle)
            }
        }
        internal func convertToCType() -> _baseRef {
            let id_handle = id
            let syncResult_handle = syncResult.convertToCType()
            defer {
                examples_Structs_SyncResult_release(syncResult_handle)
            }
            return examples_Structs_IdentifiableSyncResult_create(id_handle, syncResult_handle)
        }
    }

    public struct ImmutableSyncResult {
        public let lastUpdatedTimeStamp: UInt64
        public let numberOfChanges: UInt32
        public init(lastUpdatedTimeStamp: UInt64, numberOfChanges: UInt32) {
            self.lastUpdatedTimeStamp = lastUpdatedTimeStamp
            self.numberOfChanges = numberOfChanges
        }
        internal init(cImmutableSyncResult: _baseRef) {
            lastUpdatedTimeStamp = examples_Structs_ImmutableSyncResult_lastUpdatedTimeStamp_get(cImmutableSyncResult)
            numberOfChanges = examples_Structs_ImmutableSyncResult_numberOfChanges_get(cImmutableSyncResult)
        }
        internal func convertToCType() -> _baseRef {
            let lastUpdatedTimeStamp_handle = lastUpdatedTimeStamp
            let numberOfChanges_handle = numberOfChanges
            return examples_Structs_ImmutableSyncResult_create(lastUpdatedTimeStamp_handle, numberOfChanges_handle)
        }
    }

    public static func methodWithNonNestedType(input: Structs.SyncResult) -> Structs.SyncResult {
        let input_handle = input.convertToCType()
        defer {
            examples_Structs_SyncResult_release(input_handle)
        }
        let cResult = examples_Structs_methodWithNonNestedType(input_handle)
        defer {
            examples_Structs_SyncResult_release(cResult)
        }
        return Structs.SyncResult(cSyncResult: cResult)
    }

    public static func methodWithNestedType(input: Structs.IdentifiableSyncResult) -> Structs.IdentifiableSyncResult {
        let input_handle = input.convertToCType()
        defer {
            examples_Structs_IdentifiableSyncResult_release(input_handle)
        }
        let cResult = examples_Structs_methodWithNestedType(input_handle)
        defer {
            examples_Structs_IdentifiableSyncResult_release(cResult)
        }
        return Structs.IdentifiableSyncResult(cIdentifiableSyncResult: cResult)
    }

}

extension Structs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
