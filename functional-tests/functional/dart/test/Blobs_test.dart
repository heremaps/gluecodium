// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020 HERE Europe B.V.
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

import "dart:typed_data";
import "package:test/test.dart";
import "package:functional/another.dart";
import "package:functional/test.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Blobs");

void main() {
  _testSuite.test("methodWithByteBuffer() empty list", () {
    final result = ArraysByteBuffer.methodWithByteBuffer(Uint8List(0));

    expect(result, isEmpty);
  });
  _testSuite.test("methodWithByteBuffer() reverses list", () {
    final result = ArraysByteBuffer.methodWithByteBuffer(Uint8List.fromList([0, 42, 255]));

    expect(result, [255, 42, 0]);
  });
  _testSuite.test("methodWithByteBufferInStruct() empty list", () {
    final result = ArraysByteBuffer.methodWithByteBufferInStruct(
        ArraysByteBufferStructWithByteBuffer(Uint8List(0))
    );

    expect(result.image, isEmpty);
  });
  _testSuite.test("methodWithBymethodWithByteBufferInStructteBuffer() reverses list", () {
    final result = ArraysByteBuffer.methodWithByteBufferInStruct(
        ArraysByteBufferStructWithByteBuffer(Uint8List.fromList([0, 42, 255]))
    );

    expect(result.image, Uint8List.fromList([255, 42, 0]));
  });
  _testSuite.test("methodThatExplodes() throws", () {
    Uint8List? result = null;
    TypeCollectionWithEnumsExplosiveException? exception = null;

    try {
      result = ArraysByteBuffer.methodThatExplodes(true);
    } on TypeCollectionWithEnumsExplosiveException catch(e) {
      exception = e;
    }

    expect(result, isNull);
    expect(exception?.error, TypeCollectionWithEnumsExplosiveErrorCode.exploded);
  });
  _testSuite.test("methodThatExplodes() does not throw", () {
    Uint8List? result = null;
    TypeCollectionWithEnumsExplosiveException? exception = null;

    try {
      result = ArraysByteBuffer.methodThatExplodes(false);
    } on TypeCollectionWithEnumsExplosiveException catch(e) {
      exception = e;
    }

    expect(exception, isNull);
    expect(result, Uint8List.fromList([0, 1, 2]));
  });
  _testSuite.test("Blob defaults empty", () {
    final result = BlobDefaults().emptyList;

    expect(result, isEmpty);
  });
  _testSuite.test("Blob defaults DEAF BEEF", () {
    final result = BlobDefaults().deadBeef;

    expect(result, [0xDE, 0xAD, 0xBE, 0xEF]);
  });
  _testSuite.test("Blob defaults DEAF BEEF from C++", () {
    final result = BlobDefaults.getCppDefaults().deadBeef;

    expect(result, [0xDE, 0xAD, 0xBE, 0xEF]);
  });
}
