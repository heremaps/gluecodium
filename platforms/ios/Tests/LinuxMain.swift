import XCTest
@testable import helloTests
@testable import testTests

XCTMain([
    testCase(StaticByteArrayMethodsTests.allTests),
    testCase(StaticFloatDoubleMethodsTests.allTests),
    testCase(HelloWorldTests.allTests),
    testCase(StaticBooleanMethodsTests.allTests),
    testCase(StaticIntMethodsTests.allTests),
    testCase(StaticStringMethodsTests.allTests),
])
