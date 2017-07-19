import XCTest
@testable import helloTests
@testable import testTests

XCTMain([
    testCase(HelloWorldTests.allTests),
    testCase(StaticIntMethodsTests.allTests),
    testCase(StaticStringMethodsTests.allTests),
])
