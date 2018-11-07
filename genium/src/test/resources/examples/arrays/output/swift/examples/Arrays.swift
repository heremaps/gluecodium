//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Arrays?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
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

        internal init(cSyncResult: _baseRef) {
            lastUpdatedTimeStamp = examples_Arrays_SyncResult_lastUpdatedTimeStamp_get(cSyncResult)
            numberOfChanges = examples_Arrays_SyncResult_numberOfChanges_get(cSyncResult)
        }

        internal func convertToCType() -> _baseRef {
            let lastUpdatedTimeStamp_handle = lastUpdatedTimeStamp
            let numberOfChanges_handle = numberOfChanges
            return examples_Arrays_SyncResult_create(lastUpdatedTimeStamp_handle, numberOfChanges_handle)
        }
    }

    public static func explicitArrayMethod<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.SyncResult> where Tinput.Element == Arrays.SyncResult {

        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }

        let result_handle = examples_Arrays_explicitArrayMethod(input_handle.c_type)
        return SyncResultList(result_handle)
    }

    public static func implicitArrayMethod<Tinput: Collection>(input: Tinput) -> CollectionOf<Arrays.SyncResult> where Tinput.Element == Arrays.SyncResult {

        let input_handle = input.c_conversion()
        defer {
            input_handle.cleanup()
        }

        let result_handle = examples_Arrays_implicitArrayMethod(input_handle.c_type)
        return SyncResultList(result_handle)
    }

}

extension Arrays: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
