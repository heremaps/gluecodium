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

import "package:test/test.dart";
import "package:hello/hello.dart";
import "../test_suite.dart";

final _testSuite = TestSuite("Classes");

void main() {
  _testSuite.test("Set same type instances", () {
    final input1 = SimpleInstantiableOne("one");
    final input2 = SimpleInstantiableOne("two");
    final nested = NestedInstantiableOne();

    nested.setSameTypeInstances(input1, input2);
    final result1 = nested.getInstanceOne();
    final result2 = nested.getInstanceTwo();

    expect(result1.getStringValue(), equals("one"));
    expect(result2.getStringValue(), equals("two"));

    input1.release();
    input2.release();
    nested.release();
    result1.release();
    result2.release();
  });
  _testSuite.test("Set same type instances, identical instances", () {
    final input = SimpleInstantiableOne("one");
    final nested = NestedInstantiableOne();

    nested.setSameTypeInstances(input, input);
    final result1 = nested.getInstanceOne();
    final result2 = nested.getInstanceTwo();

    expect(result1.getStringValue(), equals("one"));
    expect(result2.getStringValue(), equals("one"));

    input.release();
    nested.release();
    result1.release();
    result2.release();
  });
  _testSuite.test("Set multiple type instances", () {
    final simpleOne1 = SimpleInstantiableOne("one");
    final simpleOne2 = SimpleInstantiableOne("other");
    final simpleTwo = SimpleInstantiableTwo("two");
    final nestedOne = NestedInstantiableOne();
    final nestedTwo = NestedInstantiableTwo(simpleOne1, simpleTwo, nestedOne);

    nestedOne.setSameTypeInstances(simpleOne1, simpleOne2);
    final result1 = nestedTwo.getInstantiableOne();
    final result2 = nestedTwo.getInstantiableTwo();
    final result3 = nestedTwo.getNestedInstantiable();
    final result4 = result3.getInstanceOne();
    final result5 = nestedTwo.getNestedInstantiable();
    final result6 = result5.getInstanceTwo();

    expect(result1.getStringValue(), equals("one"));
    expect(result2.getStringValue(), equals("two"));
    expect(result4.getStringValue(), equals("one"));
    expect(result6.getStringValue(), equals("other"));

    simpleOne1.release();
    simpleOne2.release();
    simpleTwo.release();
    nestedOne.release();
    nestedTwo.release();
    result1.release();
    result2.release();
    result3.release();
    result4.release();
    result5.release();
    result6.release();
  });
  _testSuite.test("Set self instance", () {
    final nestedTwo = InstancesFactory.createNestedInstantiableTwo();
    final simpleOne = SimpleInstantiableOne("one");
    final simpleTwo = SimpleInstantiableTwo("two");
    final nestedOne = NestedInstantiableOne();
    nestedTwo.setMultipleTypeInstances(simpleOne, simpleTwo, nestedOne);

    nestedTwo.setSelfInstantiable(nestedTwo);
    final result1 = nestedTwo.getSelfInstantiable();
    final result2 = result1.getInstantiableOne();

    expect(result2.getStringValue(), equals("one"));

    final nestedTwoOther = InstancesFactory.createNestedInstantiableTwo();
    nestedTwo.setSelfInstantiable(nestedTwoOther); // Needed to break reference loop.
    nestedTwoOther.release();
    nestedTwo.release();

    simpleOne.release();
    simpleTwo.release();
    nestedOne.release();
    result1.release();
    result2.release();
  });
  _testSuite.test("Get instance from struct", () {
    final result = InstanceInStruct.createInStruct();

    expect(result.mySelf.getStringValue(), equals("foo"));

    result.mySelf.release();
  });
}
