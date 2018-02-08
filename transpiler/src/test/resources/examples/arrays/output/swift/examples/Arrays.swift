//
// Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation



internal func getRef(_ ref: Arrays) -> RefHolder {
    return RefHolder(ref.c_instance)
}
public class Arrays {
    let c_instance : _baseRef

    public init?(cArrays: _baseRef) {
        guard cArrays != 0 else {
            return nil
        }
        c_instance = cArrays
    }

    deinit {
        examples_Arrays_release(c_instance)
    }
    public struct SyncResult {
        public var lastUpdatedTimeStamp: UInt64
        public var numberOfChanges: UInt32

        public init(lastUpdatedTimeStamp: UInt64, numberOfChanges: UInt32) {
            self.lastUpdatedTimeStamp = lastUpdatedTimeStamp
            self.numberOfChanges = numberOfChanges
        }

        internal init?(cSyncResult: _baseRef) {
            lastUpdatedTimeStamp = examples_Arrays_SyncResult_lastUpdatedTimeStamp_get(cSyncResult)
            numberOfChanges = examples_Arrays_SyncResult_numberOfChanges_get(cSyncResult)
        }

        internal func convertToCType() -> _baseRef {
            let result = examples_Arrays_SyncResult_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cSyncResult: _baseRef) -> Void {
            examples_Arrays_SyncResult_lastUpdatedTimeStamp_set(cSyncResult, lastUpdatedTimeStamp)
            examples_Arrays_SyncResult_numberOfChanges_set(cSyncResult, numberOfChanges)
        }
    }

    public static func explicitArrayMethod<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.SyncResult> where Tinput.Element == Arrays.SyncResult {

        let inputHandle = input.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle = examples_Arrays_explicitArrayMethod(inputHandle.c_type)
        return SyncResultList(handle)
    }

    public static func implicitArrayMethod<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.SyncResult> where Tinput.Element == Arrays.SyncResult {

        let inputHandle = input.c_conversion()
        defer {
            inputHandle.cleanup()
        }

        let handle = examples_Arrays_implicitArrayMethod(inputHandle.c_type)
        return SyncResultList(handle)
    }

}
