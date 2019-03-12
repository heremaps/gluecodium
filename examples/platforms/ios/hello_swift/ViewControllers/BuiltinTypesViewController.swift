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

import UIKit
import hello

class BuiltinTypesViewController: UIViewController {
    @IBOutlet var textLoanAmount: UITextField!
    @IBOutlet var textInterestRate: UITextField!
    @IBOutlet var textResult: UILabel!

    @IBAction func didPressButton(_ sender: Any) {
        textLoanAmount.resignFirstResponder()
        textInterestRate.resignFirstResponder()
        guard
            let loanText = textLoanAmount.text,
            let loanAmount = Float(loanText)
        else {
            textResult.text = "Provide proper loan ammount!"
            return
        }
        guard
            let interestText = textInterestRate.text,
            let interestRate = Int8(interestText)
        else {
            textResult.text = "Provide proper interest rate!"
            return
        }

        let result = HelloWorldBuiltinTypes.methodWithFloatAndInteger(
            inputFloat: loanAmount, inputInteger: interestRate)
        textResult.text = String(result)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
