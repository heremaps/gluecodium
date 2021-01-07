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

import XCTest
import functional

class StructsWithMethodsTests: XCTestCase {

    func testVectorDistanceToSelf() {
        let vector = Vector(x: 1, y: 2)

        let result = vector.distanceTo(other: vector)

        XCTAssertEqual(result, 0.0)
    }

    func testVectorDistanceToOther() {
        let vector = Vector(x: 1, y: 2)
        let otherVector = Vector(x: -3, y: -4)

        let result = vector.distanceTo(other: otherVector)

        XCTAssertEqual(result, 7.211, accuracy: 0.001)
    }

    func testVectorAddSelf() {
        let vector = Vector(x: 1, y: 2)

        let result = vector.add(other: vector)

        XCTAssertEqual(result, Vector(x: 2.0, y: 4.0))
    }

    func testVectorAddOther() {
        let vector = Vector(x: 1, y: 2)
        let otherVector = Vector(x: -3, y: -7)

        let result = vector.add(other: otherVector)

        XCTAssertEqual(result, Vector(x: -2.0, y: -5.0))
    }

    func testVectorValidatePasses() {
        let result = Vector.validate(x: 1, y: 2)

        XCTAssertTrue(result)
    }

    func testVectorValidateFails() {
        let result = Vector.validate(x: 1, y: Double.nan)

        XCTAssertFalse(result)
    }

    func testVectorCopyConstructorDoesNotThrow() {
        let vector = Vector(x: 1, y: 2)

        XCTAssertNoThrow(try Vector(other: vector))
    }

    func testVectorCopyConstructorThrows() {
        let vector = Vector(x: 1, y: Double.nan)

        XCTAssertThrowsError(try Vector(other: vector))
    }

    func testVector3DistanceToSelf() {
        let vector = StructsWithMethodsInterface.Vector3(x: 1, y: 2, z: 3)

        let result = vector.distanceTo(other: vector)

        XCTAssertEqual(result, 0.0)
    }

    func testVector3DistanceToOther() {
        let vector = StructsWithMethodsInterface.Vector3(x: 1, y: 2, z: 3)
        let otherVector = StructsWithMethodsInterface.Vector3(x: -4, y: -5, z: 6)

        let result = vector.distanceTo(other: otherVector)

        XCTAssertEqual(result, 9.110, accuracy: 0.001)
    }

    func testVector3AddSelf() {
        let vector = StructsWithMethodsInterface.Vector3(x: 1, y: 2, z: 3)

        let result = vector.add(other: vector)

        XCTAssertEqual(result, StructsWithMethodsInterface.Vector3(x: 2.0, y: 4.0, z: 6.0))
    }

    func testVector3AddOther() {
        let vector = StructsWithMethodsInterface.Vector3(x: 1, y: 2, z: 3)
        let otherVector = StructsWithMethodsInterface.Vector3(x: -4, y: -7, z: -10)

        let result = vector.add(other: otherVector)

        XCTAssertEqual(result, StructsWithMethodsInterface.Vector3(x: -3.0, y: -5.0, z: -7.0))
    }

    func testVector3ValidatePasses() {
        let result = StructsWithMethodsInterface.Vector3.validate(x: 1, y: 2, z: 3)

        XCTAssertTrue(result)
    }

    func testVector3ValidateFails() {
        let result = StructsWithMethodsInterface.Vector3.validate(x: 1, y: Double.nan, z: 3)

        XCTAssertFalse(result)
    }

    func testVector3CopyConstructorDoesNotThrow() {
        let vector = StructsWithMethodsInterface.Vector3(x: 1, y: 2, z: 3)

        XCTAssertNoThrow(try StructsWithMethodsInterface.Vector3(other: vector))
    }

    func testVector3CopyConstructorThrows() {
        let vector = StructsWithMethodsInterface.Vector3(x: 1, y: Double.nan, z: 3)

        XCTAssertThrowsError(try StructsWithMethodsInterface.Vector3(other: vector))
    }

    static var allTests = [
        ("testVectorDistanceToSelf", testVectorDistanceToSelf),
        ("testVectorDistanceToOther", testVectorDistanceToOther),
        ("testVectorAddSelf", testVectorAddSelf),
        ("testVectorAddOther", testVectorAddOther),
        ("testVectorValidatePasses", testVectorValidatePasses),
        ("testVectorValidateFails", testVectorValidateFails),
        ("testVectorCopyConstructorDoesNotThrow", testVectorCopyConstructorDoesNotThrow),
        ("testVectorCopyConstructorThrows", testVectorCopyConstructorThrows),
        ("testVector3DistanceToSelf", testVector3DistanceToSelf),
        ("testVector3DistanceToOther", testVector3DistanceToOther),
        ("testVector3AddSelf", testVector3AddSelf),
        ("testVector3AddOther", testVector3AddOther),
        ("testVector3ValidatePasses", testVector3ValidatePasses),
        ("testVector3ValidateFails", testVector3ValidateFails),
        ("testVector3CopyConstructorDoesNotThrow", testVector3CopyConstructorDoesNotThrow),
        ("testVector3CopyConstructorThrows", testVector3CopyConstructorThrows)
    ]
}
