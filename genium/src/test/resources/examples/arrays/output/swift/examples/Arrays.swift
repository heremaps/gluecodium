//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
internal func getRef(_ ref: Arrays?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_Arrays_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_Arrays_release_handle)
        : RefHolder(handle_copy)
}
public class Arrays {
    let c_instance : _baseRef
    init(cArrays: _baseRef) {
        guard cArrays != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cArrays
    }
    deinit {
        examples_Arrays_release_handle(c_instance)
    }
    public struct SyncResult {
        public var lastUpdatedTimeStamp: UInt64
        public var numberOfChanges: UInt32
        public init(lastUpdatedTimeStamp: UInt64, numberOfChanges: UInt32) {
            self.lastUpdatedTimeStamp = lastUpdatedTimeStamp
            self.numberOfChanges = numberOfChanges
        }
        internal init(cHandle: _baseRef) {
            lastUpdatedTimeStamp = examples_Arrays_SyncResult_lastUpdatedTimeStamp_get(cHandle)
            numberOfChanges = examples_Arrays_SyncResult_numberOfChanges_get(cHandle)
        }
        internal func convertToCType() -> _baseRef {
            let lastUpdatedTimeStamp_handle = lastUpdatedTimeStamp
            let numberOfChanges_handle = numberOfChanges
            return examples_Arrays_SyncResult_create_handle(lastUpdatedTimeStamp_handle, numberOfChanges_handle)
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
internal func copyFromCType(_ handle: _baseRef) -> Arrays.SyncResult {
    return Arrays.SyncResult(cHandle: handle)
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.SyncResult {
    defer {
        examples_Arrays_SyncResult_release_handle(handle)
    }
    return copyFromCType(handle)
}