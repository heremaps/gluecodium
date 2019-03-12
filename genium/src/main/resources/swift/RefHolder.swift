// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
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

typealias _baseRef = Int64
