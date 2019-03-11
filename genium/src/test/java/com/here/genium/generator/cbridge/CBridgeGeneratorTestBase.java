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

import static java.util.Arrays.asList;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import com.here.genium.generator.cpp.CppNameRules;
import com.here.genium.generator.swift.SwiftNameRules;
import com.here.genium.model.cbridge.CBridgeIncludeResolver;
import com.here.genium.model.common.Include;
import com.here.genium.model.cpp.CppIncludeResolver;
import com.here.genium.model.franca.DefinedBy;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.test.ArrayEList;
import java.util.List;
import org.franca.core.franca.*;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;

/** Common setup for the test cases */
@PrepareForTest({CppNameRules.class, CBridgeNameRules.class, SwiftNameRules.class})
abstract class CBridgeGeneratorTestBase {

  protected static final List<String> PACKAGES = asList("cbridge", "test");
  protected static final String INTERFACE_NAME = "TestInterface";
  protected static final String TYPE_COLLECTION_NAME = "TestTypeCollection";
  protected static final String FUNCTION_NAME = "functionName";
  protected static final String PUBLIC_HEADER_NAME = "CBRIDGE_PUBLIC_HEADER of TestInterface";
  protected static final String STD_INT_INCLUDE = "#include <stdint.h>\n";
  protected static final String STD_STRING_INCLUDE = "#include <string>\n";
  protected static final String STD_NEW_INCLUDE = "#include <new>\n";
  protected static final String STD_VECTOR_INCLUDE = "#include <vector>\n";
  protected static final String BYTE_ARRAY_INCLUDE =
      "#include \"cbridge/include/ByteArrayHandle.h\"\n";
  protected static final String STRING_INCLUDE = "#include \"cbridge/include/StringHandle.h\"\n";

  @Mock protected FrancaDeploymentModel deploymentModel;

  @Mock protected FModel francaModel;
  @Mock protected FInterface francaInterface;
  @Mock protected FTypeCollection francaTypeCollection;

  @Mock protected FMethod francaMethod;
  @Mock protected FArgument francaArgument1;
  @Mock protected FTypeRef francaTypeRef1;
  @Mock protected FArgument francaArgument2;
  @Mock protected FTypeRef francaTypeRef2;

  @Mock protected CppIncludeResolver cppIncludeResolver;
  @Mock protected CBridgeIncludeResolver includeResolver;

  protected final ArrayEList<FType> interfaceTypes = new ArrayEList<>();
  protected final ArrayEList<FMethod> methods = new ArrayEList<>();
  protected final ArrayEList<FArgument> inputArguments = new ArrayEList<>();
  protected final ArrayEList<FArgument> outputArguments = new ArrayEList<>();

  protected CBridgeGenerator generator;

  CBridgeGeneratorTestBase() throws Exception {
    PowerMockito.mockStatic(CBridgeNameRules.class);
    initMocks(this);

    when(deploymentModel.isStatic(any())).thenReturn(true);

    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);

    when(francaInterface.getName()).thenReturn(INTERFACE_NAME);
    when(francaInterface.getMethods()).thenReturn(methods);
    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaInterface.getTypes()).thenReturn(interfaceTypes);
    when(francaMethod.getName()).thenReturn(FUNCTION_NAME);
    when(francaMethod.getInArgs()).thenReturn(inputArguments);
    when(francaMethod.getOutArgs()).thenReturn(outputArguments);
    when(francaMethod.eContainer()).thenReturn(francaInterface);
    methods.add(francaMethod);

    when(francaModel.getName()).thenReturn(String.join(".", PACKAGES));
    when(cppIncludeResolver.resolveInclude(any()))
        .then(
            invocation -> {
              FModelElement modelElement = (FModelElement) (invocation.getArguments()[0]);
              return Include.createInternalInclude(
                  "C++ include of " + DefinedBy.findDefiningTypeCollection(modelElement).getName());
            });
    when(includeResolver.resolveInclude(any()))
        .then(
            invocation -> {
              FModelElement modelElement = (FModelElement) (invocation.getArguments()[0]);
              return Include.createInternalInclude(
                  "CBridge include of "
                      + DefinedBy.findDefiningTypeCollection(modelElement).getName());
            });

    PowerMockito.spy(CBridgeNameRules.class);
    PowerMockito.spy(CppNameRules.class);
    PowerMockito.spy(SwiftNameRules.class);
    PowerMockito.doReturn(PUBLIC_HEADER_NAME)
        .when(CBridgeNameRules.class, "getHeaderFileNameWithPath", any());
    PowerMockito.doReturn("")
        .when(CBridgeNameRules.class, "getImplementationFileNameWithPath", any());

    generator = new CBridgeGenerator(deploymentModel, cppIncludeResolver, includeResolver, null);
  }
}
