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
    public typealias SyncResults = [Arrays.SyncResult]
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
            lastUpdatedTimeStamp = moveFromCType(examples_Arrays_SyncResult_lastUpdatedTimeStamp_get(cHandle))
            numberOfChanges = moveFromCType(examples_Arrays_SyncResult_numberOfChanges_get(cHandle))
        }
    }
    public static func explicitArrayMethod(input: Arrays.SyncResults) -> Arrays.SyncResults {
        let c_input = moveToCType(input)
        return moveFromCType(examples_Arrays_explicitArrayMethod(c_input.ref))
    }
    public static func implicitArrayMethod(input: [Arrays.SyncResult]) -> [Arrays.SyncResult] {
        let c_input = moveToCType(input)
        return moveFromCType(examples_Arrays_implicitArrayMethod(c_input.ref))
    }
}
extension Arrays: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func ArrayscopyFromCType(_ handle: _baseRef) -> Arrays {
    return Arrays(cArrays: examples_Arrays_copy_handle(handle))
}
internal func ArraysmoveFromCType(_ handle: _baseRef) -> Arrays {
    return Arrays(cArrays: handle)
}
internal func ArrayscopyFromCType(_ handle: _baseRef) -> Arrays? {
    guard handle != 0 else {
        return nil
    }
    return ArraysmoveFromCType(handle) as Arrays
}
internal func ArraysmoveFromCType(_ handle: _baseRef) -> Arrays? {
    guard handle != 0 else {
        return nil
    }
    return ArraysmoveFromCType(handle) as Arrays
}
internal func copyToCType(_ swiftClass: Arrays) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Arrays) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Arrays?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Arrays?) -> RefHolder {
    return getRef(swiftClass, owning: true)
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
internal func copyToCType(_ swiftType: Arrays.SyncResult) -> RefHolder {
    let c_lastUpdatedTimeStamp = moveToCType(swiftType.lastUpdatedTimeStamp)
    let c_numberOfChanges = moveToCType(swiftType.numberOfChanges)
    return RefHolder(examples_Arrays_SyncResult_create_handle(c_lastUpdatedTimeStamp.ref, c_numberOfChanges.ref))
}
internal func moveToCType(_ swiftType: Arrays.SyncResult) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Arrays_SyncResult_release_handle)
}
internal func copyFromCType(_ handle: _baseRef) -> Arrays.SyncResult? {
    guard handle != 0 else {
        return nil
    }
    let unwrappedHandle = examples_Arrays_SyncResult_unwrap_optional_handle(handle)
    return Arrays.SyncResult(cHandle: unwrappedHandle) as Arrays.SyncResult
}
internal func moveFromCType(_ handle: _baseRef) -> Arrays.SyncResult? {
    defer {
        examples_Arrays_SyncResult_release_optional_handle(handle)
    }
    return copyFromCType(handle)
}
internal func copyToCType(_ swiftType: Arrays.SyncResult?) -> RefHolder {
    guard let swiftType = swiftType else {
        return RefHolder(0)
    }
    let c_lastUpdatedTimeStamp = moveToCType(swiftType.lastUpdatedTimeStamp)
    let c_numberOfChanges = moveToCType(swiftType.numberOfChanges)
    return RefHolder(examples_Arrays_SyncResult_create_optional_handle(c_lastUpdatedTimeStamp.ref, c_numberOfChanges.ref))
}
internal func moveToCType(_ swiftType: Arrays.SyncResult?) -> RefHolder {
    return RefHolder(ref: copyToCType(swiftType).ref, release: examples_Arrays_SyncResult_release_optional_handle)
}
