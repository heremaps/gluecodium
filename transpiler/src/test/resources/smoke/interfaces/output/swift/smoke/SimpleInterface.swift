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


internal func getRef(_ ref: SimpleInterface) -> RefHolder<smoke_SimpleInterfaceRef> {
    guard let instanceReference = ref as? _SimpleInterface else {
        fatalError("Not implemented yet")
    }
    return RefHolder<smoke_SimpleInterfaceRef>(instanceReference.c_instance)
}


public protocol SimpleInterface : AnyObject {


        func setStringValue(stringValue: String) -> Void;
        func getStringValue() -> String?;

}

internal class _SimpleInterface: SimpleInterface {


    let c_instance : smoke_SimpleInterfaceRef

    required init?(cSimpleInterface: smoke_SimpleInterfaceRef) {
        c_instance = cSimpleInterface
    }

    deinit {
        smoke_SimpleInterface_release(c_instance)
    }
    public func setStringValue(stringValue: String) -> Void {
        return smoke_SimpleInterface_setStringValue(c_instance, stringValue)
    }

    public func getStringValue() -> String? {
        let result_string_handle = smoke_SimpleInterface_getStringValue(c_instance)

        defer {
            std_string_release(result_string_handle)
        }
        return String(data: Data(bytes: std_string_data_get(result_string_handle),
                                 count: Int(std_string_size_get(result_string_handle))), encoding: .utf8)
    }

}
