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

internal func getRef(_ ref: StructsInheritance) -> RefHolder<examples_StructsInheritanceRef> {
    return RefHolder<examples_StructsInheritanceRef>(ref.c_instance)
}

public class StructsInheritance {
    let c_instance : examples_StructsInheritanceRef

    public required init?(cStructsInheritance: examples_StructsInheritanceRef) {
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

        internal init?(cSyncResultInherited: examples_StructsInheritance_SyncResultInheritedRef) {
            lastUpdatedTimeStamp = examples_StructsInheritance_SyncResultInherited_lastUpdatedTimeStamp_get(cSyncResultInherited)
            numberOfChanges = examples_StructsInheritance_SyncResultInherited_numberOfChanges_get(cSyncResultInherited)
            id = examples_StructsInheritance_SyncResultInherited_id_get(cSyncResultInherited)
        }

        internal func convertToCType() -> examples_StructsInheritance_SyncResultInheritedRef {
            let result = examples_StructsInheritance_SyncResultInherited_create()
            fillFunction(result)
            return result
        }

        internal func fillFunction(_ cSyncResultInherited: examples_StructsInheritance_SyncResultInheritedRef) -> Void {
            examples_StructsInheritance_SyncResultInherited_lastUpdatedTimeStamp_set(cSyncResultInherited, lastUpdatedTimeStamp)
            examples_StructsInheritance_SyncResultInherited_numberOfChanges_set(cSyncResultInherited, numberOfChanges)
            examples_StructsInheritance_SyncResultInherited_id_set(cSyncResultInherited, id)
        }
    }

    public func methodWithInheritedType(input: StructsInheritance.SyncResultInherited) -> StructsInheritance.SyncResultInherited? {
        let inputHandle = input.convertToCType()
        defer {
            examples_StructsInheritance_SyncResultInherited_release(inputHandle)
        }
        let cResult = examples_StructsInheritance_methodWithInheritedType(c_instance, inputHandle)
        defer {
            examples_StructsInheritance_SyncResultInherited_release(cResult)
        }
        return StructsInheritance.SyncResultInherited(cSyncResultInherited: cResult)
    }
}