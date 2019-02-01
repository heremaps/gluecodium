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
            let c_lastUpdatedTimeStamp = moveToCType(lastUpdatedTimeStamp)
            let c_numberOfChanges = moveToCType(numberOfChanges)
            return examples_Structs_SyncResult_create_handle(c_lastUpdatedTimeStamp.ref, c_numberOfChanges.ref)
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
            let c_id = moveToCType(id)
            let c_syncResult = moveToCType(syncResult)
            return examples_Structs_IdentifiableSyncResult_create_handle(c_id.ref, c_syncResult.ref)
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
            let c_lastUpdatedTimeStamp = moveToCType(lastUpdatedTimeStamp)
            let c_numberOfChanges = moveToCType(numberOfChanges)
            return examples_Structs_ImmutableSyncResult_create_handle(c_lastUpdatedTimeStamp.ref, c_numberOfChanges.ref)
        }
    }
    public static func methodWithNonNestedType(input: Structs.SyncResult) -> Structs.SyncResult {
        let c_input = moveToCType(input)
        return moveFromCType(examples_Structs_methodWithNonNestedType(c_input.ref))
    }
    public static func methodWithNestedType(input: Structs.IdentifiableSyncResult) -> Structs.IdentifiableSyncResult {
        let c_input = moveToCType(input)
        return moveFromCType(examples_Structs_methodWithNestedType(c_input.ref))
    }
}
extension Structs: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func StructscopyFromCType(_ handle: _baseRef) -> Structs {
    return Structs(cStructs: examples_Structs_copy_handle(handle))
}
internal func StructsmoveFromCType(_ handle: _baseRef) -> Structs {
    return Structs(cStructs: handle)
}
internal func StructscopyFromCType(_ handle: _baseRef) -> Structs? {
    guard handle != 0 else {
        return nil
    }
    return StructsmoveFromCType(handle) as Structs
}
internal func StructsmoveFromCType(_ handle: _baseRef) -> Structs? {
    guard handle != 0 else {
        return nil
    }
    return StructsmoveFromCType(handle) as Structs
}
internal func copyToCType(_ swiftClass: Structs) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Structs) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Structs?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Structs?) -> RefHolder {
    return getRef(swiftClass, owning: true)
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
internal func copyToCType(_ swiftType: Structs.SyncResult) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.SyncResult) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Structs_SyncResult_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.SyncResult? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = examples_Structs_SyncResult_unwrap_optional_handle(handle)
    return Structs.SyncResult(cHandle: unwrappedHandle) as Structs.SyncResult
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.SyncResult? {
    defer {
        examples_Structs_SyncResult_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.SyncResult?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(examples_Structs_SyncResult_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.SyncResult?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Structs_SyncResult_release_optional_handle)
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
internal func copyToCType(_ swiftType: Structs.IdentifiableSyncResult) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.IdentifiableSyncResult) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Structs_IdentifiableSyncResult_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.IdentifiableSyncResult? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = examples_Structs_IdentifiableSyncResult_unwrap_optional_handle(handle)
    return Structs.IdentifiableSyncResult(cHandle: unwrappedHandle) as Structs.IdentifiableSyncResult
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.IdentifiableSyncResult? {
    defer {
        examples_Structs_IdentifiableSyncResult_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.IdentifiableSyncResult?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(examples_Structs_IdentifiableSyncResult_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.IdentifiableSyncResult?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Structs_IdentifiableSyncResult_release_optional_handle)
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
internal func copyToCType(_ swiftType: Structs.ImmutableSyncResult) -> RefHolder {
    return RefHolder(swiftType.convertToCType())
}
internal func moveToCType(_ swiftType: Structs.ImmutableSyncResult) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Structs_ImmutableSyncResult_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Structs.ImmutableSyncResult? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = examples_Structs_ImmutableSyncResult_unwrap_optional_handle(handle)
    return Structs.ImmutableSyncResult(cHandle: unwrappedHandle) as Structs.ImmutableSyncResult
}
internal func moveFromCType(_ handle: _baseRef) -> Structs.ImmutableSyncResult? {
    defer {
        examples_Structs_ImmutableSyncResult_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Structs.ImmutableSyncResult?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    return RefHolder(examples_Structs_ImmutableSyncResult_make_optional_handle(copyToCType(swiftType).ref))
}
internal func moveToCType(_ swiftType: Structs.ImmutableSyncResult?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Structs_ImmutableSyncResult_release_optional_handle)
}