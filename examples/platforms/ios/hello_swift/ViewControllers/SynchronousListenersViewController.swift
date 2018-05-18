// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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

class SynchronousListenersViewController: UIViewController, CalculatorListener {
    @IBOutlet var x1label: UITextField!
    @IBOutlet var y1label: UITextField!
    @IBOutlet var z1label: UITextField!
    @IBOutlet var x2label: UITextField!
    @IBOutlet var y2label: UITextField!
    @IBOutlet var z2label: UITextField!
    @IBOutlet var swiftResult: UITextField!
    @IBOutlet var cppResult: UITextField!

    let calculator = hello.CalculatorFactory.createCalculator()!
    let cppListener = hello.HelloWorldCalculatorListenerFactory.createCalculatorListener()!

    private func getPositions() -> (start: Calculator.Position, finish: Calculator.Position)? {
        guard
            let x1float = Float(x1label.text!),
            let y1float = Float(y1label.text!),
            let z1float = Float(z1label.text!),
            let x2float = Float(x2label.text!),
            let y2float = Float(y2label.text!),
            let z2float = Float(z2label.text!)
            else {
                return nil
        }
        let start = Calculator.Position(x: x1float, y: y1float, z: z1float)
        let finish = Calculator.Position(x: x2float, y: y2float, z: z2float)

        return (start: start, finish: finish)
    }

    func onCalculationResult(calculationResult: Double) {
        swiftResult.text = String(format: "Synchronous result = %f", calculationResult)
    }

    func onCalculationInBackgroundResult(calculationResult: Double) {
        // do nothing
    }

    private func calculate(listener: CalculatorListener) {
        guard let positions = getPositions() else {
            return
        }
        hello.HelloWorldStaticLogger.clearLog()
        calculator.calculate(fromPosition: positions.from, toPosition: positions.to, listener: listener)
        cppResult.text = hello.HelloWorldStaticLogger.getLog()
    }

    @IBAction func calculateWithCppListenerTriggered(_ sender: Any) {
        calculate(listener: cppListener)
    }

    @IBAction func calculateWithSwiftListenerTriggered(_ sender: Any) {
        calculate(listener: self)
    }
}
