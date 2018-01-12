// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

class RefHolder {
    let ref: _baseRef
    let release: ((_baseRef) -> Void)?

    init(_ ref: _baseRef) {
        self.ref = ref
        release = nil
    }

    init(ref: _baseRef, release: @escaping (_baseRef) -> Void) {
        self.ref = ref
        self.release = release
    }

    deinit {
        if let fun = release {
            fun(ref)
        }
    }
}
