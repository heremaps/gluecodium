//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Structs?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_Structs_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_Structs_release_handle)
        : RefHolder(handle_copy)
}
public class Structs {
    let c_instance : _baseRef
    init(cStructs: _baseRef) {
        guard cStructs != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cStructs
    }
    deinit {
        examples_Structs_release_handle(c_instance)
    }
    public struct SyncResult {
        public var lastUpdatedTimeStamp: UInt64
        public var numberOfChanges: UInt32
        public init(lastUpdatedTimeStamp: UInt64, numberOfChanges: UInt32) {
            self.lastUpdatedTimeStamp = lastUpdatedTimeStamp
            self.numberOfChanges = numberOfChanges
        }
        internal init(cHandle: _baseRef) {
            lastUpdatedTimeStamp = moveFromCType(examples_Structs_SyncResult_lastUpdatedTimeStamp_get(cHandle))
            numberOfChanges = moveFromCType(examples_Structs_SyncResult_numberOfChanges_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let lastUpdatedTimeStamp_handle = lastUpdatedTimeStamp
            let numberOfChanges_handle = numberOfChanges
            return examples_Structs_SyncResult_create_handle(lastUpdatedTimeStamp_handle, numberOfChanges_handle)
        }
    }
    public struct IdentifiableSyncResult {
        public var id: Int32
        public var syncResult: Structs.SyncResult
        public init(id: Int32, syncResult: Structs.SyncResult) {
            self.id = id
            self.syncResult = syncResult
        }
        internal init(cHandle: _baseRef) {
            id = moveFromCType(examples_Structs_IdentifiableSyncResult_id_get(cHandle))
            syncResult = moveFromCType(examples_Structs_IdentifiableSyncResult_syncResult_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let id_handle = id
            let syncResult_handle = syncResult.convertToCType()
            defer {
                examples_Structs_SyncResult_release_handle(syncResult_handle)
            }
            return examples_Structs_IdentifiableSyncResult_create_handle(id_handle, syncResult_handle)
        }
    }
    public struct ImmutableSyncResult {
        public let lastUpdatedTimeStamp: UInt64
        public let numberOfChanges: UInt32
        public init(lastUpdatedTimeStamp: UInt64, numberOfChanges: UInt32) {
            self.lastUpdatedTimeStamp = lastUpdatedTimeStamp
            self.numberOfChanges = numberOfChanges
        }
        internal init(cHandle: _baseRef) {
            lastUpdatedTimeStamp = moveFromCType(examples_Structs_ImmutableSyncResult_lastUpdatedTimeStamp_get(cHandle))
            numberOfChanges = moveFromCType(examples_Structs_ImmutableSyncResult_numberOfChanges_get(cHandle))
        }
        internal func convertToCType() -> _baseRef {
            let lastUpdatedTimeStamp_handle = lastUpdatedTimeStamp
            let numberOfChanges_handle = numberOfChanges
            return examples_Structs_ImmutableSyncResult_create_handle(lastUpdatedTimeStamp_handle, numberOfChanges_handle)
        }
    }
    public static func methodWithNonNestedType(input: Structs.SyncResult) -> Structs.SyncResult {
        let input_handle = input.convertToCType()
        defer {
            examples_Structs_SyncResult_release_handle(input_handle)
        }
        return moveFromCType(examples_Structs_methodWithNonNestedType(input_handle))
    }
    public static func methodWithNestedType(input: Structs.IdentifiableSyncResult) -> Structs.IdentifiableSyncResult {
        let input_handle = input.convertToCType()
        defer {
            examples_Structs_IdentifiableSyncResult_release_handle(input_handle)
        }
        return moveFromCType(examples_Structs_methodWithNestedType(input_handle))
    }
}
extension Structs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func StructscopyFromCType(_ handle: _baseRef) -> Structs {
    return Structs(cStructs: handle)
}
internal func StructsmoveFromCType(_ handle: _baseRef) -> Structs {
    return StructscopyFromCType(handle)
}
internal func StructscopyFromCType(_ handle: _baseRef) -> Structs? {
    guard handle != 0 else {
        return nil
    }
    return StructsmoveFromCType(handle) as Structs
}
internal func StructsmoveFromCType(_ handle: _baseRef) -> Structs? {
    return StructscopyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.SyncResult {
    return Structs.SyncResult(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.SyncResult {
    defer {
        examples_Structs_SyncResult_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.IdentifiableSyncResult {
    return Structs.IdentifiableSyncResult(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.IdentifiableSyncResult {
    defer {
        examples_Structs_IdentifiableSyncResult_release_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.ImmutableSyncResult {
    return Structs.ImmutableSyncResult(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.ImmutableSyncResult {
    defer {
        examples_Structs_ImmutableSyncResult_release_handle(handle)
    }
    return copyFromCType(handle)
}