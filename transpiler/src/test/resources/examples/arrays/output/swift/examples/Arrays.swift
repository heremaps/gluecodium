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
public class Arrays {
    public struct SyncResult {
        public var lastUpdatedTimeStamp: UInt64
        public var numberOfChanges: UInt32
        public init(lastUpdatedTimeStamp: UInt64, numberOfChanges: UInt32) {
            self.lastUpdatedTimeStamp = lastUpdatedTimeStamp
            self.numberOfChanges = numberOfChanges
        }
        internal init?(cSyncResult: examples_Arrays_SyncResultRef) {
            lastUpdatedTimeStamp = examples_Arrays_SyncResult_lastUpdatedTimeStamp_get(cSyncResult)
            numberOfChanges = examples_Arrays_SyncResult_numberOfChanges_get(cSyncResult)
        }
        internal func convertToCType() -> examples_Arrays_SyncResultRef {
            let result = examples_Arrays_SyncResult_create()
            fillFunction(result)
            return result
        }
        internal func fillFunction(_ cSyncResult: examples_Arrays_SyncResultRef) -> Void {
            examples_Arrays_SyncResult_lastUpdatedTimeStamp_set(cSyncResult, lastUpdatedTimeStamp)
            examples_Arrays_SyncResult_numberOfChanges_set(cSyncResult, numberOfChanges)
        }
    }
    public static func explicitArrayMethod<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.SyncResult> where Tinput.Element == Arrays.SyncResult {
        let inputArray = input.flatMap{ $0 as? Arrays.SyncResult }
        let inputHandle = inputArray.c_conversion()
        defer {
            inputHandle.cleanup()
        }
        let handle =  examples_Arrays_explicitArrayMethod(inputHandle.c_type)
        return SyncResultList(handle)
    }
    public static func implicitArrayMethod<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.SyncResult> where Tinput.Element == Arrays.SyncResult {
        let inputArray = input.flatMap{ $0 as? Arrays.SyncResult }
        let inputHandle = inputArray.c_conversion()
        defer {
            inputHandle.cleanup()
        }
        let handle =  examples_Arrays_implicitArrayMethod(inputHandle.c_type)
        return SyncResultList(handle)
    }
}
