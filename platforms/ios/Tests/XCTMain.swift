import Foundation
import XCTest

// On OSX the tests are discovered automatically by the Objective C runtime.
// On Linux these need to be added manually by passing them to XCTMain.
// XCTMain does not exist on Mac.
// These helpers are used to compare manual added test list with automatically
// discovered tests when run on Mac.
#if !os(Linux)

    typealias TestCaseEntry = (String, allTests: [String])

    func testCase<T: XCTestCase>(_ allTests: [(String, (T) -> () throws -> Void)]) -> TestCaseEntry {
        let tests: [String] = allTests.map { $0.0 }
        let name = String(describing: T.self)
        return (name, tests)
    }

    func testCase<T: XCTestCase>(_ allTests: [(String, (T) -> () -> Void)]) -> TestCaseEntry {
        let tests: [String] = allTests.map { $0.0 }
        let name = String(describing: T.self)
        return (name, tests)
    }

    // Compare list of manually added tests with automatically discovered one.
    // Then run the default test suite.
    // TODO: accept command line parameters to run individual tests with .perform
    func XCTMain(_ testCases: [TestCaseEntry]) -> Never {

        // Run all tests, but don't check the test results yet so potential errors in XCTMain can still be found
        let defaultSuite = XCTestSuite.default
        defaultSuite.run()

        // Check the difference between automatically discovered and statically added tests
        var staticTestCases: [String: Set<String>] = [:]
        testCases.forEach { staticTestCases[$0] = Set($1) }

        var dynamicTestCases: [String: Set<String>] = [:]
        defaultSuite.tests.forEach { bundle in
            let bundleSuite = bundle as! XCTestSuite
            bundleSuite.tests.forEach { testCase in
                let testSuite = testCase as! XCTestSuite
                var tests: [String] = []
                testSuite.tests.forEach { test in
                    var name = test.name
                    if let index = name.index(of: " ") {
                        name.removeSubrange(..<index)
                        name.removeFirst()
                        name.removeLast()
                    }
                    tests.append(name)
                }
                dynamicTestCases[testCase.name] = Set(tests)
            }
        }

        var sameTests = true
        dynamicTestCases.forEach { testCase, tests in
            if let staticTests = staticTestCases[testCase] {
                if staticTests != tests {
                    print("Test mismatch in", testCase)
                    print("discovered:", tests)
                    print("declared:  ", staticTests)
                    sameTests = false
                }
            } else {
                print("Missing TestCase from XCTMain:", testCase)
                sameTests = false
            }
        }

        if !sameTests {
            print("Failure: Missing tests from XCTMain")
            exit(-4)
        }

        exit(Int32(defaultSuite.testRun!.failureCount))
    }

#endif
