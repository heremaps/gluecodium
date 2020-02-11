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

final _testSuite = TestSuite("Interfaces");

void main() {
  _testSuite.test("Set same type interfaces", () {
    final input1 = InterfacesFactory.createSimpleInterfaceOne();
    input1.setStringValue("one");
    final input2 = InterfacesFactory.createSimpleInterfaceOne();
    input2.setStringValue("two");
    final nested = InterfacesFactory.createNestedInterfaceOne();

    nested.setSameTypeInterfaces(input1, input2);
    final result1 = nested.getInterfaceOne();
    final result2 = nested.getInterfaceTwo();

    expect(result1.getStringValue(), equals("one"));
    expect(result2.getStringValue(), equals("two"));

    input1.release();
    input2.release();
    nested.release();
    result1.release();
    result2.release();
  });
  _testSuite.test("Set same type interfaces, identical interfaces", () {
    final input = InterfacesFactory.createSimpleInterfaceOne();
    input.setStringValue("one");
    final nested = InterfacesFactory.createNestedInterfaceOne();

    nested.setSameTypeInterfaces(input, input);
    final result1 = nested.getInterfaceOne();
    final result2 = nested.getInterfaceTwo();

    expect(result1.getStringValue(), equals("one"));
    expect(result2.getStringValue(), equals("one"));

    input.release();
    nested.release();
    result1.release();
    result2.release();
  });
  _testSuite.test("Set multiple type interfaces", () {
    final simpleOne1 = InterfacesFactory.createSimpleInterfaceOne();
    final simpleOne2 = InterfacesFactory.createSimpleInterfaceOne();
    final simpleTwo = InterfacesFactory.createSimpleInterfaceTwo();
    final nestedOne = InterfacesFactory.createNestedInterfaceOne();
    final nestedTwo = InterfacesFactory.createNestedInterfaceTwo();
    simpleOne1.setStringValue("one");
    simpleTwo.setStringValue("two");
    simpleOne2.setStringValue("other");

    nestedOne.setSameTypeInterfaces(simpleOne1, simpleOne2);
    nestedTwo.setMultipleTypeInterfaces(simpleOne1, simpleTwo, nestedOne);
    final result1 = nestedTwo.getInterfaceOne();
    final result2 = nestedTwo.getInterfaceTwo();
    final result3 = nestedTwo.getNestedInterface();
    final result4 = result3.getInterfaceOne();
    final result5 = nestedTwo.getNestedInterface();
    final result6 = result5.getInterfaceTwo();

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
  _testSuite.test("Set self interface", () {
    final nestedTwo = InterfacesFactory.createNestedInterfaceTwo();
    final simpleOne = InterfacesFactory.createSimpleInterfaceOne();
    final simpleTwo = InterfacesFactory.createSimpleInterfaceTwo();
    final nestedOne = InterfacesFactory.createNestedInterfaceOne();
    simpleOne.setStringValue("one");
    nestedTwo.setMultipleTypeInterfaces(simpleOne, simpleTwo, nestedOne);

    nestedTwo.setSelfInterface(nestedTwo);
    final result1 = nestedTwo.getSelfInterface();
    final result2 = result1.getInterfaceOne();

    expect(result2.getStringValue(), equals("one"));

    final nestedTwoOther = InterfacesFactory.createNestedInterfaceTwo();
    nestedTwo.setSelfInterface(nestedTwoOther); // Needed to break reference loop.
    nestedTwoOther.release();
    nestedTwo.release();

    simpleOne.release();
    simpleTwo.release();
    nestedOne.release();
    result1.release();
    result2.release();
  });
}
