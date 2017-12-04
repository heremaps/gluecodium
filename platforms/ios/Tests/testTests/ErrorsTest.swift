import XCTest
import hello

class ErrorsTests: XCTestCase {
    func testMethodWithErrorThrows() {
      XCTAssertThrowsError(try Errors.methodWithError(errorFlag: true)) { error in
        XCTAssertEqual(error as? Errors.InternalErrors, Errors.InternalErrors.crashed)
      }
    }

    func testMethodWithErrorFinishes() {
      XCTAssertNoThrow(try Errors.methodWithError(errorFlag: false))
    }

    func testMethodWithErrorAndStringThrows() {
      XCTAssertThrowsError(try Errors.methodWithErrorAndString(errorFlag: true)) { error in
        XCTAssertEqual(error as? AdditionalErrors.ExternalErrors, AdditionalErrors.ExternalErrors.failed)
      }
    }

    func testMethodWithErrorAndStringFinishes() {
      XCTAssertEqual(try Errors.methodWithErrorAndString(errorFlag: false), "SUCCEEDED")
    }

    func testMethodThatExplodesThrows() {
      XCTAssertThrowsError(try Errors.methodThatExplodes(errorFlag: true)) { error in
        XCTAssertEqual(error as? ExplosiveErrors, ExplosiveErrors.exploded)
      }
    }

    func testMethodThatExplodesFinishes() {
      XCTAssertEqual(try Errors.methodThatExplodes(errorFlag: false), Data(bytes: [0x00, 0x01, 0x02]))
    }

    func testMethodWithGoodAndBadThrows() {
      XCTAssertThrowsError(try Errors.methodWithGoodAndBad(errorFlag: true)) { error in
        XCTAssertEqual(error as? YetAnotherErrors, YetAnotherErrors.bad)
      }
    }

    func testMethodWithGoodAndBadFinishes() {
      XCTAssertEqual(try Errors.methodWithGoodAndBad(errorFlag: false), SomeEnum.anotherResult)
    }

    static var allTests = [
        ("testMethodWithErrorThrows", testMethodWithErrorThrows),
        ("testMethodWithErrorFinishes", testMethodWithErrorFinishes),
        ("testMethodWithErrorAndStringThrows", testMethodWithErrorAndStringThrows),
        ("testMethodWithErrorAndStringFinishes", testMethodWithErrorAndStringFinishes),
        ("testMethodThatExplodesThrows", testMethodThatExplodesThrows),
        ("testMethodThatExplodesFinishes", testMethodThatExplodesFinishes),
        ("testMethodWithGoodAndBadThrows", testMethodWithGoodAndBadThrows),
        ("testMethodWithGoodAndBadFinishes", testMethodWithGoodAndBadFinishes)
    ]
}
