//
//  SynchronousListenersViewController.swift
//  hello_swift
//
//  Copyright © 2017 HERE. All rights reserved.
//

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

    private func getPositions() -> (from: Calculator.Position, to: Calculator.Position)? {
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
        let to = Calculator.Position(x: x2float, y: y2float, z: z2float)

        return (from: from, to: to)
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
