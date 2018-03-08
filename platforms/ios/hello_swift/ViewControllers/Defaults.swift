// -------------------------------------------------------------------------------------------------
// Copyright (c) 2016-2018 HERE Europe B.V.
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

import UIKit
import hello

class StructsWithDefaultsViewController: UIViewController {
    @IBOutlet weak var expected: UIWebView!
    @IBOutlet weak var nativeDefault: UIWebView!
    @IBOutlet weak var baseLayerDefault: UIWebView!
    @IBOutlet weak var retireveDefault: UIButton!

    private let expectedValue = HelloWorldDefaults.StructWithDefaults(
        intField: 42,
        floatField: 3.14,
        boolField: true,
        stringField: "some string",
        enumField: .barValue)

    @IBAction func buttonPressed(_ sender: Any) {
        nativeDefault.loadHTMLString(
            HTML.renderStruct(HelloWorldDefaults.StructWithDefaults()), baseURL: nil)
        baseLayerDefault.loadHTMLString(
            HTML.renderStruct(HelloWorldDefaults.getStructWithDefaults()!), baseURL: nil)
    }
    override func viewDidLoad() {
        expected.loadHTMLString(
            HTML.renderStruct(expectedValue),
            baseURL: nil)
    }
}
