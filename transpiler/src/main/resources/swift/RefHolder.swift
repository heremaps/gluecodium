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

class RefHolder<Ref> {
    let ref: Ref
    let release: ((Ref) -> Void)?

    init(_ ref: Ref) {
        self.ref = ref
        release = nil
    }

    init(ref: Ref, release: @escaping (Ref) -> Void) {
        self.ref = ref
        self.release = release
    }

    deinit {
        if let fun = release {
            fun(ref)
        }
    }
}
