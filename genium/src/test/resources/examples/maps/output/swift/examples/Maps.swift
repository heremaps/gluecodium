//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
@_cdecl("_CBridgeInitexamples_Maps")
internal func _CBridgeInitexamples_Maps(handle: _baseRef) -> UnsafeMutableRawPointer {
    let reference = Maps(cMaps: handle)
    return Unmanaged<AnyObject>.passRetained(reference).toOpaque()
}
internal func getRef(_ ref: Maps?, owning: Bool = true) -> RefHolder {
    guard let c_handle = ref?.c_instance else {
        return RefHolder(0)
    }
    let handle_copy = examples_Maps_copy_handle(c_handle)
    return owning
        ? RefHolder(ref: handle_copy, release: examples_Maps_release_handle)
        : RefHolder(handle_copy)
}
public class Maps {
    public typealias NameMap = [UInt64: String]
    let c_instance : _baseRef
    init(cMaps: _baseRef) {
        guard cMaps != 0 else {
            fatalError("Nullptr value is not supported for initializers")
        }
        c_instance = cMaps
    }
    deinit {
        examples_Maps_release_handle(c_instance)
    }
    public static func mapMethod(input: Maps.NameMap) -> Maps.NameMap {
        let c_input = moveToCType(input)
        return moveFromCType(examples_Maps_mapMethod(c_input.ref))
    }
    public static func inlineMapMethod(input: [UInt64: String]) -> [UInt64: String] {
        let c_input = moveToCType(input)
        return moveFromCType(examples_Maps_inlineMapMethod(c_input.ref))
    }
}
extension Maps: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func MapscopyFromCType(_ handle: _baseRef) -> Maps {
    if let swift_pointer = examples_Maps_get_typed(examples_Maps_copy_handle(handle)),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Maps {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func MapsmoveFromCType(_ handle: _baseRef) -> Maps {
    if let swift_pointer = examples_Maps_get_typed(handle),
        let typed = Unmanaged<AnyObject>.fromOpaque(swift_pointer).takeRetainedValue() as? Maps {
        return typed
    }
    fatalError("Failed to initialize Swift object")
}
internal func MapscopyFromCType(_ handle: _baseRef) -> Maps? {
    guard handle != 0 else {
        return nil
    }
    return MapsmoveFromCType(handle) as Maps
}
internal func MapsmoveFromCType(_ handle: _baseRef) -> Maps? {
    guard handle != 0 else {
        return nil
    }
    return MapsmoveFromCType(handle) as Maps
}
internal func copyToCType(_ swiftClass: Maps) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Maps) -> RefHolder {
    return getRef(swiftClass, owning: true)
}
internal func copyToCType(_ swiftClass: Maps?) -> RefHolder {
    return getRef(swiftClass, owning: false)
}
internal func moveToCType(_ swiftClass: Maps?) -> RefHolder {
    return getRef(swiftClass, owning: true)
}