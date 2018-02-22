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
        return examples_Maps_mapMethod(input)
    }
}

extension Maps: NativeBase {
    var c_handle: _baseRef { return c_instance }
}
