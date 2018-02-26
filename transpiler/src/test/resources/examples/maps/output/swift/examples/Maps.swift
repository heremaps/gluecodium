//
//
// Automatically generated. Do not modify. Your changes will be lost.

import Foundation

internal func getRef(_ ref: Maps?) -> RefHolder {
    return RefHolder(ref?.c_instance ?? 0)
}

public class Maps {

    public typealias NameMap = [UInt64: String]

    let c_instance : _baseRef

    public init?(cMaps: _baseRef) {
        guard cMaps != 0 else {
            return nil
        }
        c_instance = cMaps
    }

    deinit {
        examples_Maps_release(c_instance)
    }

    public static func mapMethod(input: Maps.NameMap) -> Maps.NameMap {
        let inputHandle = convertMaps_NameMapToCType(input)
        defer {
            examples_Maps_NameMap_release(inputHandle)
        }
        let resultHandle = examples_Maps_mapMethod(inputHandle)
        defer {
            examples_Maps_NameMap_release(resultHandle)
        }
        return convertMaps_NameMapFromCType(resultHandle)
    }
}

extension Maps: NativeBase {
    var c_handle: _baseRef { return c_instance }
}

func convertMaps_NameMapToCType(_ swiftDict: Maps.NameMap) -> _baseRef {
    let cHandle = examples_Maps_NameMap_create()
    for (swift_key, swift_value) in swiftDict {
        let c_key = swift_key
        let c_value = swift_value.convertToCType()
        defer {
            std_string_release(c_value)
        }
        examples_Maps_NameMap_put(cHandle, c_key, c_value)
    }
    return cHandle
}

func convertMaps_NameMapFromCType(_ cHandle: _baseRef) -> Maps.NameMap {
    var swiftDict: Maps.NameMap = [:]
    let iteratorHandle = examples_Maps_NameMap_iterator(cHandle)
    while examples_Maps_NameMap_iterator_is_valid(cHandle, iteratorHandle) {
        let c_key = examples_Maps_NameMap_iterator_key(iteratorHandle)
        let swift_key = c_key
        let c_value = examples_Maps_NameMap_iterator_value(iteratorHandle)
        defer {
            std_string_release(c_value)
        }
        let swift_value = String(data: Data(bytes: std_string_data_get(c_value),
                                            count: Int(std_string_size_get(c_value))),
                                            encoding: .utf8)
        swiftDict[swift_key] = swift_value
        examples_Maps_NameMap_iterator_increment(iteratorHandle)
    }
    examples_Maps_NameMap_iterator_release(iteratorHandle)
    return swiftDict
}
