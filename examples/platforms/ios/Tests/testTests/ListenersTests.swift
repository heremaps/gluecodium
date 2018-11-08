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

import XCTest
import hello

class ListenersTests: XCTestCase {
    let fromPosition = Calculator.Position(x: 3, y: 7, z: 2)
    let toPosition = Calculator.Position(x: 7, y: 7, z: 5)
    let calculator = CalculatorFactory.createCalculator()!

    class EmptyListener: CalculatorListener {
        public func onCalculationResult(calculationResult: Double) { }
        public func onCalculationInBackgroundResult(calculationResult: Double) { }
    }

    class DeinitListener: EmptyListener {
        let deinitCallback: () -> Void
        init(callOnDeinit: @escaping () -> Void) {
            self.deinitCallback = callOnDeinit
        }

        deinit {
            deinitCallback()
        }
    }

    class MessageListener: StringListener {
        public func onMessage(message: String) {
            print(message)
        }

        public func onStructMessage(message: StringStruct) {
            print(message.stringField)
        }
    }

    func testBackgroundListener() {
        class TestListener: EmptyListener {
            var onCalculationInBackgroundResultCalled = false
            var calculationInBackgroundResult: Double = 0

            public override func onCalculationInBackgroundResult(calculationResult: Double) {
                self.calculationInBackgroundResult = calculationResult
                onCalculationInBackgroundResultCalled = true
            }
        }

        let listener = TestListener()

        calculator.registerListener(listener: listener)
        calculator.calculateInBackground(fromPosition: fromPosition, toPosition: toPosition)

        XCTAssertTrue(listener.onCalculationInBackgroundResultCalled)
        XCTAssertEqual(5, listener.calculationInBackgroundResult)
    }

    func testBackgroundListenerRegisteredTwice() {
        class TestListener: EmptyListener {
            var numberCallbackWasCalled = 0

            public override func onCalculationInBackgroundResult(calculationResult: Double) {
                numberCallbackWasCalled += 1
            }
        }

        let listener = TestListener()

        calculator.registerListener(listener: listener)
        calculator.registerListener(listener: listener)
        calculator.calculateInBackground(fromPosition: fromPosition, toPosition: toPosition)

        XCTAssertEqual(1, listener.numberCallbackWasCalled)
    }

    func testSynchronousListener() {
        class TestListener: EmptyListener {
            var onCalculationResultCalled = false
            var calculationResult: Double = 0

            public override func onCalculationResult(calculationResult: Double) {
                self.calculationResult = calculationResult
                onCalculationResultCalled = true
            }
        }

        let listener = TestListener()

        calculator.calculate(fromPosition: fromPosition, toPosition: toPosition, listener: listener)

        XCTAssertTrue(listener.onCalculationResultCalled)
        XCTAssertEqual(5, listener.calculationResult)
    }

    func testSynchronousListenerCleanup() {
        var deinitCalled = false
        do {
            let listener = DeinitListener(callOnDeinit: { deinitCalled = true })
            calculator.calculate(fromPosition: fromPosition, toPosition: toPosition, listener: listener)
        }
        XCTAssertTrue(deinitCalled)
    }

    func testProxyKeepsSwiftObjectAlive() {
        var deinitCalled = false
        do {
            let listener = DeinitListener(callOnDeinit: { deinitCalled = true })
            calculator.registerListener(listener: listener)
        }
        XCTAssertFalse(deinitCalled, "Proxy must keep Swift object alive")
    }

    func testRegisterUnregisterCleanup() {
        var deinitCalled = false

        do {
            let listener = DeinitListener(callOnDeinit: { deinitCalled = true })
            calculator.registerListener(listener: listener)
            calculator.unregisterListener(listener: listener)
        }
        XCTAssertTrue(deinitCalled)
    }

    func testRegisterTwiceUnregisterCleanup() {
        var deinitCalled = 0

        do {
            let listener = DeinitListener(callOnDeinit: { deinitCalled += 1 })
            calculator.registerListener(listener: listener)
            calculator.registerListener(listener: listener)
            calculator.unregisterListener(listener: listener)
        }
        XCTAssertEqual(1, deinitCalled)
    }

    func testRegisterTwiceUnregisterTwiceCleanup() {
        var deinitCalled = 0

        do {
            let listener = DeinitListener(callOnDeinit: { deinitCalled += 1 })
            calculator.registerListener(listener: listener)
            calculator.registerListener(listener: listener)
            calculator.unregisterListener(listener: listener)
            calculator.unregisterListener(listener: listener)
        }
        XCTAssertEqual(1, deinitCalled)
    }

    func testRegisterUnregisterTwiceCleanup() {
        var deinitCalled = 0

        do {
            let listener = DeinitListener(callOnDeinit: { deinitCalled += 1 })
            calculator.registerListener(listener: listener)
            calculator.unregisterListener(listener: listener)
            calculator.unregisterListener(listener: listener)
        }
        XCTAssertEqual(1, deinitCalled)
    }

    func testStringListenerDoesNotCrash() {
        DummyLogger.relayMessage(listener: MessageListener(), message: "Hi!")
    }

    func testComplexListener() {
        class SwiftComplexListener: ComplexListener {
            var length: Double = 0
            var trajectory: [NamedPoint3D] = []
            var trajectoryQuality = TrajectoryQuality.trajectoryPoor
            var image = Data()

            func onTrajectoryCompleted<Ttrajectory>(
                    distanceMetric: DistanceMetric?, trajectory: Ttrajectory,
                    quality: TrajectoryQuality, image: Data)
                    where Ttrajectory: Collection, Ttrajectory.Element == NamedPoint3D {

                self.length = distanceMetric?.getLength(input: trajectory) ?? 0
                self.trajectory = Array(trajectory)
                self.trajectoryQuality = quality
                self.image = image
            }
        }

        let listener = SwiftComplexListener()
        let notifier = ComplexListenerFactory.createComplexNotifier()!
        let trajectory = [
            NamedPoint3D(name: "zero point", pt: Point3D(x: 0, y: 0, z: 0)),
            NamedPoint3D(name: "intermediate point", pt: Point3D(x: 10, y: 10, z: 10)),
            NamedPoint3D(name: "final destination", pt: Point3D(x: 20, y: 20, z: 20))
        ]
        let image = Data([0x00, 0x01, 0x02])
        let trajectoryQuality = TrajectoryQuality.trajectoryAverage

        notifier.trajectoryCompleted(
            trajectory: trajectory, quality: trajectoryQuality, image: image, listener: listener)

        XCTAssertEqual(listener.length, 60.0, accuracy: 1e-6)
        XCTAssertEqual(listener.trajectory, trajectory)
        XCTAssertEqual(listener.trajectoryQuality, trajectoryQuality)
        XCTAssertEqual(listener.image, image)
    }

    static var allTests = [
        ("testBackgroundListener", testBackgroundListener),
        ("testBackgroundListenerRegisteredTwice", testBackgroundListenerRegisteredTwice),
        ("testSynchronousListener", testSynchronousListener),
        ("testSynchronousListenerCleanup", testSynchronousListenerCleanup),
        ("testProxyKeepsSwiftObjectAlive", testProxyKeepsSwiftObjectAlive),
        ("testRegisterUnregisterCleanup", testRegisterUnregisterCleanup),
        ("testRegisterTwiceUnregisterCleanup", testRegisterTwiceUnregisterCleanup),
        ("testRegisterTwiceUnregisterTwiceCleanup", testRegisterTwiceUnregisterTwiceCleanup),
        ("testRegisterUnregisterTwiceCleanup", testRegisterUnregisterTwiceCleanup),
        ("testStringListenerDoesNotCrash", testStringListenerDoesNotCrash),
        ("testComplexListener", testComplexListener)
    ]
}

extension NamedPoint3D: Equatable {
}

extension Point3D: Equatable {
}

public func == (lhs: Point3D, rhs: Point3D) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
}

public func == (lhs: NamedPoint3D, rhs: NamedPoint3D) -> Bool {
    return lhs.name == rhs.name && lhs.pt == rhs.pt
}
