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

// This example is to showcase technical capabilities. In a more practical example
// the view controller would implement the listener protocol directly, like it is done in
// SynchronousListenersViewController.
class SwiftListener: CalculatorListener {
    var result: Double?

    func onCalculationResult(calculationResult: Double) {
        // do nothing
    }

    func onCalculationInBackgroundResult(calculationResult: Double) {
        result = calculationResult
    }
}

class AsynchronousListenersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var listenersTable: UITableView!
    @IBOutlet var addSwiftListenerButton: UIButton!
    @IBOutlet var addCppListenerButton: UIButton!
    @IBOutlet var cppResults: UITextView!

    @IBOutlet var x1label: UITextField!
    @IBOutlet var y1label: UITextField!
    @IBOutlet var z1label: UITextField!

    @IBOutlet var x2label: UITextField!
    @IBOutlet var y2label: UITextField!
    @IBOutlet var z2label: UITextField!

    let calculator = hello.CalculatorFactory.createCalculator()!
    var listeners = [CalculatorListener]()

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return listeners.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListenersTableViewCell",
                                                     for: indexPath)as? ListenersTableViewCell
        else {
            fatalError("Wrong cell type")
        }

        let listener = listeners[indexPath.row]
        if let swiftListener = listener as? SwiftListener {
            cell.typeLabel.text = "Swift"
            if let result = swiftListener.result {
                cell.resultLabel.text = String(format: "Result = %f", result)
            } else {
                cell.resultLabel.text = ""
            }
            cell.resultLabel.isEnabled = true
        } else {
            cell.typeLabel.text = "C++"
            cell.resultLabel.text = "Result will be logged below"
            cell.resultLabel.isEnabled = false
        }

        return cell
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let listener = self.listeners[indexPath.row]
            self.calculator.unregisterListener(listener: listener)
            self.listeners.remove(at: indexPath.row)
            self.listenersTable.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    func addListener(_ listener: CalculatorListener) {
        listeners.append(listener)
        calculator.registerListener(listener: listener)
        listenersTable.insertRows(at: [IndexPath(row: listeners.count - 1, section: 0)], with: .automatic)
    }

    @IBAction func addSwiftListener(_: Any) {
        addListener(SwiftListener())
    }

    @IBAction func addCppListener(_: Any) {
        addListener(hello.HelloWorldCalculatorListenerFactory.createCalculatorListener()!)
    }

    private func getPositions() -> (from: Calculator.Position, destination: Calculator.Position)? {
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
        let from = Calculator.Position(x: x1float, y: y1float, z: z1float)
        let destination = Calculator.Position(x: x2float, y: y2float, z: z2float)

        return (from: from, destination: destination)
    }

    @IBAction func calculateTriggered(_: Any) {
        guard let positions = getPositions() else {
            return
        }
        hello.HelloWorldStaticLogger.clearLog()
        calculator.calculateInBackground(fromPosition: positions.from, toPosition: positions.destination)
        listenersTable.reloadData()
        cppResults.text = hello.HelloWorldStaticLogger.getLog()
    }
}
