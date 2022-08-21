// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2021 HERE Europe B.V.
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

import "package:test/test.dart";
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Type Aliases");

void main() {
  _testSuite.test("Type alias to struct", () {
    final result = StaticTypedefExampleStructTypedef("nonsense");

    expect(result is StaticTypedefExampleStruct, isTrue);
    expect(result.exampleString, "nonsense");
  });
  _testSuite.test("Type alias used by a function", () {
    final result = StaticTypedef.returnIntTypedef(2);

    expect(result is int, isTrue);
    expect(result, 3);
  });
  _testSuite.test("Type alias points to a type alias", () {
    final result = StaticTypedef.returnNestedIntTypedef(4);

    expect(result is int, isTrue);
    expect(result, 5);
  });
  _testSuite.test("Type alias from type collection", () {
    final result = StaticTypedef.returnTypedefPointFromTypeCollection(
        TypeCollectionPointTypedef(1.0, 3.0)
    );

    expect(result is TypeCollectionPoint, isTrue);
    expect(result.x, 1.0);
    expect(result.y, 3.0);
  });
}
