import XCTest
import hello

class AttributesInterfaceTests: XCTestCase {
    var attributes: AttributesInterface?

    override func setUp() {
        super.setUp()
        attributes = AttributesInterfaceFactory.createAttributesInterface()
    }

    func testBuiltInTypeAttribute() {
      attributes!.builtInTypeAttribute = 42

      XCTAssertEqual(42, attributes!.builtInTypeAttribute)
    }

    func testStructAttribute() {
      let expectedStruct = ExampleStruct(value: 2.71)

      attributes!.structAttribute = expectedStruct
      let actualStruct = attributes!.structAttribute

      XCTAssertEqual(expectedStruct.value, actualStruct.value, accuracy: 1e-6)
    }

    static var allTests = [
        ("testBuiltInTypeAttribute", testBuiltInTypeAttribute),
        ("testStructAttribute", testStructAttribute)
    ]
}
