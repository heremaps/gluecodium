/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.cbridge;

import static org.mockito.Mockito.when;

import com.here.genium.model.cbridge.CInterface;
import com.here.genium.test.TemplateComparator;
import org.franca.core.franca.FBasicTypeId;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.powermock.modules.junit4.PowerMockRunnerDelegate;

@RunWith(PowerMockRunner.class)
@PowerMockRunnerDelegate(Parameterized.class)
@PrepareForTest(CBridgeNameRules.class)
public class CBridgeGeneratorTestPrimitiveTypes extends CBridgeGeneratorTestBase {
  private final FBasicTypeId francaType;
  private final String cType;
  private CInterface cModel;

  public CBridgeGeneratorTestPrimitiveTypes(FBasicTypeId francaType, String cType)
      throws Exception {
    super();
    this.francaType = francaType;
    this.cType = cType;
  }

  @Before
  public void setUp() {
    when(francaTypeRef1.getPredefined()).thenReturn(francaType);
    when(francaTypeRef2.getPredefined()).thenReturn(francaType);

    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    outputArguments.add(francaArgument2);

    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);

    cModel = generator.buildCBridgeModel(francaInterface);
  }

  @Parameterized.Parameters(name = "{1}")
  public static Object[][] data() {
    return new Object[][] {
      {FBasicTypeId.INT8, "int8_t"},
      {FBasicTypeId.UINT8, "uint8_t"},
      {FBasicTypeId.INT16, "int16_t"},
      {FBasicTypeId.UINT16, "uint16_t"},
      {FBasicTypeId.INT32, "int32_t"},
      {FBasicTypeId.UINT32, "uint32_t"},
      {FBasicTypeId.INT64, "int64_t"},
      {FBasicTypeId.UINT64, "uint64_t"},
      {FBasicTypeId.FLOAT, "float"},
      {FBasicTypeId.DOUBLE, "double"}
    };
  }

  @Test
  public void createFunctionTakingAndReturningBasicIntegralTypes() {
    TemplateComparator expectedHeader =
        TemplateComparator.expect(
                String.format("%1$s cbridge_test_TestInterface_functionName(%1$s input);\n", cType))
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(
                String.format(
                    "%1$s cbridge_test_TestInterface_functionName(%1$s input) {\n"
                        + "    return ::cbridge::test::TestInterface::function_name(input);\n"
                        + "}\n",
                    cType))
            .build();

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void functionTable() {
    TemplateComparator.expect(
            String.format(
                "typedef struct {\n"
                    + "    void* swift_pointer;\n"
                    + "    void(*release)(void* swift_pointer);\n"
                    + "    %1$s(*cbridge_test_TestInterface_functionName)(void* swift_pointer, %1$s input);\n"
                    + "} cbridge_test_TestInterface_FunctionTable;\n",
                cType))
        .build()
        .assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
  }
}
