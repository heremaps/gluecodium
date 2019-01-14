//
//
// Automatically generated. Do not modify. Your changes will be lost.
import Foundation
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
        let input_handle = convertMaps_NameMapToCType(input)
        defer {
            examples_Maps_NameMap_release_handle(input_handle)
        }
        return moveFromCType(examples_Maps_mapMethod(input_handle))
    }
}
extension Maps: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
internal func MapscopyFromCType(_ handle: _baseRef) -> Maps {
    return Maps(cMaps: handle)
}
internal func MapsmoveFromCType(_ handle: _baseRef) -> Maps {
    return MapscopyFromCType(handle)
}
internal func MapscopyFromCType(_ handle: _baseRef) -> Maps? {
    guard handle != 0 else {
        return nil
    }
    return MapsmoveFromCType(handle) as Maps
}
internal func MapsmoveFromCType(_ handle: _baseRef) -> Maps? {
    return MapscopyFromCType(handle)
}
func convertMaps_NameMapToCType(_ swiftDict: Maps.NameMap) -> _baseRef {
    let c_handle = examples_Maps_NameMap_create_handle()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            std_string_release_handle(c_value)
        }
        examples_Maps_NameMap_put(c_handle, c_key, c_value)
    }
    return c_handle
}