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


internal func getRef(_ ref: ProfileManagerInterface) -> RefHolder<examples_ProfileManagerInterfaceRef> {
    guard let instanceReference = ref as? _ProfileManagerInterface else {
        fatalError("Not implemented yet")
    }
    return RefHolder<examples_ProfileManagerInterfaceRef>(instanceReference.c_instance)
}

public protocol ProfileManagerInterface : AnyObject {


        func createProfile(username: String) -> Void;

}

internal class _ProfileManagerInterface: ProfileManagerInterface {


    let c_instance : examples_ProfileManagerInterfaceRef

    required init?(cProfileManagerInterface: examples_ProfileManagerInterfaceRef) {
        c_instance = cProfileManagerInterface
    }

    deinit {
        examples_ProfileManagerInterface_release(c_instance)
    }
    public func createProfile(username: String) -> Void {
        return examples_ProfileManagerInterface_createProfile(c_instance, username)
    }

}
