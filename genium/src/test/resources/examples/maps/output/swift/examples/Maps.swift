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
        let result_handle = examples_Maps_mapMethod(input_handle)
        defer {
            examples_Maps_NameMap_release_handle(result_handle)
        }
        return convertMaps_NameMapFromCType(result_handle)
    }
}
extension Maps: NativeBase {
    var c_handle: _baseRef { return c_instance }
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
func convertMaps_NameMapFromCType(_ c_handle: _baseRef) -> Maps.NameMap {
    var swiftDict: Maps.NameMap = [:]
    let iterator_handle = examples_Maps_NameMap_iterator(c_handle)
    while examples_Maps_NameMap_iterator_is_valid(c_handle, iterator_handle) {
        let c_key = examples_Maps_NameMap_iterator_key(iterator_handle)
        let swift_key = c_key
        let c_value = examples_Maps_NameMap_iterator_value(iterator_handle)
        let swift_value: String = moveFromCType(c_value)
        swiftDict[swift_key] = swift_value
        examples_Maps_NameMap_iterator_increment(iterator_handle)
    }
    examples_Maps_NameMap_iterator_release_handle(iterator_handle)
    return swiftDict
}