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
        ("testStringListenerDoesNotCrash", testStringListenerDoesNotCrash)
    ]
}
