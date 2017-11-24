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

    func testBackgroundListener() {
        class TestListener: EmptyListener {
            var onCalculationInBackgroundResultCalled = false
            var calculationInBackgroundResult: Double = 0

            public override func onCalculationInBackgroundResult(calculationResult: Double) {
                self.calculationInBackgroundResult = calculationResult
                onCalculationInBackgroundResultCalled = true
            }
        }

        var listener = TestListener()

        calculator.registerListener(listener: listener)
        calculator.calculateInBackground(fromPosition: fromPosition, toPosition: toPosition)

        XCTAssertTrue(listener.onCalculationInBackgroundResultCalled)
        XCTAssertEqual(5, listener.calculationInBackgroundResult)
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

        var listener = TestListener()

        calculator.calculate(fromPosition: fromPosition, toPosition: toPosition, listener: listener)

        XCTAssertTrue(listener.onCalculationResultCalled)
        XCTAssertEqual(5, listener.calculationResult)
    }

    func testSynchronousListenerCleanup() {
        var deinitCalled = false
        do {
            var listener = DeinitListener(callOnDeinit: { deinitCalled = true })
            calculator.calculate(fromPosition: fromPosition, toPosition: toPosition, listener: listener)
        }
        XCTAssertTrue(deinitCalled)
    }

    func testProxyKeepsSwiftObjectAlive() {
        var deinitCalled = false
        do {
            var listener = DeinitListener(callOnDeinit: { deinitCalled = true })
            calculator.registerListener(listener: listener)
        }
        XCTAssertFalse(deinitCalled, "Proxy must keep Swift object alive")
    }

    func testRegisterUnregisterCleanup() {
        var deinitCalled = false

        do {
            var listener = DeinitListener(callOnDeinit: { deinitCalled = true })
            calculator.registerListener(listener: listener)
            calculator.unregisterListener(listener: listener)
        }
        XCTAssertTrue(deinitCalled)
    }

    static var allTests = [
        ("testBackgroundListener", testBackgroundListener),
        ("testSynchronousListener", testSynchronousListener),
        ("testSynchronousListenerCleanup", testSynchronousListenerCleanup),
        ("testProxyKeepsSwiftObjectAlive", testProxyKeepsSwiftObjectAlive),
        ("testRegisterUnregisterCleanup", testRegisterUnregisterCleanup)
    ]
}
