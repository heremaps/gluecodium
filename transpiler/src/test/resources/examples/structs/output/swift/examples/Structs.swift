//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation




public class Structs {

    public struct SyncResult {
        public var lastUpdatedTimeStamp: UInt64
        public var numberOfChanges: UInt32

        public init(lastUpdatedTimeStamp: UInt64, numberOfChanges: UInt32) {
            self.lastUpdatedTimeStamp = lastUpdatedTimeStamp
            self.numberOfChanges = numberOfChanges
        }

        internal init?(cSyncResult: examples_Structs_SyncResultRef) {
            lastUpdatedTimeStamp = examples_Structs_SyncResult_lastUpdatedTimeStamp_get(cSyncResult)
            numberOfChanges = examples_Structs_SyncResult_numberOfChanges_get(cSyncResult)
        }

        internal func convertToCType() -> examples_Structs_SyncResultRef {
            let result = examples_Structs_SyncResult_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cSyncResult: examples_Structs_SyncResultRef) -> Void {
            examples_Structs_SyncResult_lastUpdatedTimeStamp_set(cSyncResult, lastUpdatedTimeStamp)
            examples_Structs_SyncResult_numberOfChanges_set(cSyncResult, numberOfChanges)
        }
    }

    public struct IdentifiableSyncResult {
        public var id: Int32
        public var syncResult: SyncResult

        public init(id: Int32, syncResult: SyncResult) {
            self.id = id
            self.syncResult = syncResult
        }

        internal init?(cIdentifiableSyncResult: examples_Structs_IdentifiableSyncResultRef) {
            id = examples_Structs_IdentifiableSyncResult_id_get(cIdentifiableSyncResult)
            do {
                guard
                    let syncResultUnwrapped = SyncResult(cSyncResult: examples_Structs_IdentifiableSyncResult_syncResult_get(cIdentifiableSyncResult))
                else {
                    return nil
                }
                syncResult = syncResultUnwrapped
            }
        }

        internal func convertToCType() -> examples_Structs_IdentifiableSyncResultRef {
            let result = examples_Structs_IdentifiableSyncResult_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cIdentifiableSyncResult: examples_Structs_IdentifiableSyncResultRef) -> Void {
            examples_Structs_IdentifiableSyncResult_id_set(cIdentifiableSyncResult, id)
            let syncResultHandle = examples_Structs_IdentifiableSyncResult_syncResult_get(cIdentifiableSyncResult)
            syncResult.fillFunction(syncResultHandle)
        }
    }

    public static func methodWithNonNestedType(input: SyncResult) -> SyncResult? {
        let inputHandle = input.convertToCType()
        defer {
            examples_Structs_SyncResult_release(inputHandle)
        }
        let cResult = examples_Structs_methodWithNonNestedType(inputHandle)


        defer {
            examples_Structs_SyncResult_release(cResult)
        }

        return SyncResult(cSyncResult: cResult)
    }

    public static func methodWithNestedType(input: IdentifiableSyncResult) -> IdentifiableSyncResult? {
        let inputHandle = input.convertToCType()
        defer {
            examples_Structs_IdentifiableSyncResult_release(inputHandle)
        }
        let cResult = examples_Structs_methodWithNestedType(inputHandle)


        defer {
            examples_Structs_IdentifiableSyncResult_release(cResult)
        }

        return IdentifiableSyncResult(cIdentifiableSyncResult: cResult)
    }

}
