import XCTest
import hello

XCTMain([
    testCase(EnumsTests.allTests),
    testCase(HelloWorldInstancesTests.allTests),
    testCase(HelloWorldTests.allTests),
    testCase(ListenersReturnValuesTests.allTests),
    testCase(ListenersTests.allTests),
    testCase(StructWithInstanceTests.allTests),
    testCase(MethodOverloadsTests.allTests),
    testCase(PlainDataStructuresFromTypeCollectionTests.allTests),
    testCase(PlainDataStructuresTests.allTests),
    testCase(StaticBooleanMethodsTests.allTests),
    testCase(StaticByteArrayMethodsTests.allTests),
    testCase(StaticFloatDoubleMethodsTests.allTests),
    testCase(StaticIntMethodsTests.allTests),
    testCase(StaticStringMethodsTests.allTests),
    testCase(TypeDefTests.allTests),
    testCase(ArraysTests.allTests),
    testCase(AttributesTests.allTests),
    testCase(AttributesInterfaceTests.allTests),
    testCase(InterfacesTests.allTests),
    testCase(ErrorsTests.allTests)
])
