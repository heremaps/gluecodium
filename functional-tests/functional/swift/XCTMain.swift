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

import Foundation
import XCTest

// On OSX the tests are discovered automatically by the Objective C runtime.
// On Linux these need to be added manually by passing them to XCTMain.
// XCTMain does not exist on Mac.
// Additional test is added to Mac to verify that manually created list of test
// for Linux is the same as automatically discovered on Mac

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

    class TestlistSyncronizationTest: XCTestCase {
        func testSameListAmongPlatforms() {
            let defaultSuite = XCTestSuite.default

            // Check the difference between automatically discovered and statically added tests
            var staticTestCases: [String: Set<String>] = [:]
            allTests.forEach { staticTestCases[$0] = Set($1) }

            var dynamicTestCases: [String: Set<String>] = [:]
            defaultSuite.tests.forEach { bundle in
                guard let bundleSuite = bundle as? XCTestSuite else {
                    XCTFail("Unexpected test structure of discovered tests")
                    return
                }
                bundleSuite.tests.forEach { testCase in
                    guard let testSuite = testCase as? XCTestSuite else {
                        XCTFail("Unexpected test structure of discovered tests")
                        return
                    }
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

            dynamicTestCases.forEach { testCase, tests in
                if let staticTests = staticTestCases[testCase] {
                    if staticTests != tests {
                        XCTFail(String(
                          format: "Test mismatch in %@, discovered: %@, declared: %@",
                          testCase, tests, staticTests))
                    }
                } else {
                    if testCase != String(describing: TestlistSyncronizationTest.self) {
                        XCTFail(String(format: "Missing TestCase from XCTMain: %@", testCase))
                    }
                }
            }
        }
    }

    func XCTMain(_: [TestCaseEntry]) -> Never {
        let defaultSuite = XCTestSuite.default
        defaultSuite.run()
        exit(Int32(defaultSuite.testRun!.failureCount))
    }

#endif
