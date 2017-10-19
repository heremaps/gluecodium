import XCTest
import hello

class AttributesTests: XCTestCase {
    var attributes: HelloWorldAttributes?

    override func setUp() {
        super.setUp()
        attributes = HelloWorldFactory.createAttributes()!
    }

    func testBuiltInTypeAttribute() {
      attributes!.builtInTypeAttribute = 42

      XCTAssertEqual(42, attributes!.builtInTypeAttribute)
    }

    func testReadonlyAttribute() {
      XCTAssertEqual(3.14, attributes!.readonlyAttribute, accuracy: 1e-6)
    }

    func testStructAttribute() {
      let expectedStruct = ExampleStruct(value: 2.71)

      attributes!.structAttribute = expectedStruct
      let actualStruct = attributes!.structAttribute

      XCTAssertEqual(expectedStruct.value, actualStruct.value, accuracy: 1e-6)
    }

    static var allTests = [
        ("testBuiltInTypeAttribute", testBuiltInTypeAttribute),
        ("testReadonlyAttribute", testReadonlyAttribute),
        ("testStructAttribute", testStructAttribute)
    ]
}
