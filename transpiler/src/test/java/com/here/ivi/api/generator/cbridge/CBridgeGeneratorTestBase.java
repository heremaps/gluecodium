/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.generator.cbridge;

import static java.util.Arrays.asList;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.generator.swift.SwiftNameRules;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaDeploymentModel;
import com.here.ivi.api.test.ArrayEList;
import java.util.List;
import org.franca.core.franca.*;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;

/** Common setup for the test cases */
@SuppressWarnings("PMD.TooManyFields")
@PrepareForTest({CppNameRules.class, CBridgeNameRules.class, SwiftNameRules.class})
abstract class CBridgeGeneratorTestBase {

  protected static final List<String> PACKAGES = asList("cbridge", "test");
  protected static final String INTERFACE_NAME = "TestInterface";
  protected static final String TYPE_COLLECTION_NAME = "TestTypeCollection";
  protected static final String FUNCTION_NAME = "functionName";
  protected static final String PRIVATE_HEADER_NAME = "CBRIDGE_PRIVATE_HEADER of TestInterface";
  protected static final String PRIVATE_HEADER_INCLUDE =
      "#include \"" + PRIVATE_HEADER_NAME + "\"\n";
  protected static final String PUBLIC_HEADER_NAME = "CBRIDGE_PUBLIC_HEADER of TestInterface";
  protected static final String CBRIDGE_HEADER_INCLUDE =
      "#include \"" + PUBLIC_HEADER_NAME + "\"\n";
  protected static final String BASEAPI_HEADER_INCLUDE =
      "#include \"BASE_API_HEADER of TestInterface\"\n";
  protected static final String STD_INT_INCLUDE = "#include <stdint.h>\n";
  protected static final String STD_STRING_INCLUDE = "#include <string>\n";
  protected static final String STD_VECTOR_INCLUDE = "#include <vector>\n";
  protected static final String BYTE_ARRAY_INCLUDE = "#include \"cbridge/ByteArrayHandle.h\"\n";
  protected static final String STRING_INCLUDE = "#include \"cbridge/StringHandle.h\"\n";

  @Mock protected FrancaDeploymentModel deploymentModel;

  @Mock protected FModel francaModel;
  @Mock protected FInterface francaInterface;
  @Mock protected FTypeCollection francaTypeCollction;

  @Mock protected FMethod francaMethod;
  @Mock protected FArgument francaArgument1;
  @Mock protected FTypeRef francaTypeRef1;
  @Mock protected FArgument francaArgument2;
  @Mock protected FTypeRef francaTypeRef2;

  @Mock protected IncludeResolver resolver;
  protected final ArrayEList<FType> interfaceTypes = new ArrayEList<>();
  protected final ArrayEList<FMethod> methods = new ArrayEList<>();
  protected final ArrayEList<FArgument> inputArguments = new ArrayEList<>();
  protected final ArrayEList<FArgument> outputArguments = new ArrayEList<>();

  protected CBridgeGenerator generator;

  @SuppressWarnings("PMD")
  CBridgeGeneratorTestBase() throws Exception {
    PowerMockito.mockStatic(CBridgeNameRules.class);
    initMocks(this);

    when(deploymentModel.isStatic(any())).thenReturn(true);

    when(francaTypeCollction.getName()).thenReturn(TYPE_COLLECTION_NAME);
    when(francaTypeCollction.eContainer()).thenReturn(francaModel);

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
    when(resolver.resolveInclude(any(), any()))
        .then(
            invocation -> {
              IncludeResolver.HeaderType type =
                  (IncludeResolver.HeaderType) (invocation.getArguments()[1]);
              FModelElement modelElement = (FModelElement) (invocation.getArguments()[0]);
              return Include.createInternalInclude(
                  type.toString()
                      + " of "
                      + DefinedBy.findDefiningTypeCollection(modelElement).getName());
            });

    PowerMockito.spy(CBridgeNameRules.class);
    PowerMockito.spy(CppNameRules.class);
    PowerMockito.spy(SwiftNameRules.class);
    PowerMockito.doReturn(PRIVATE_HEADER_NAME)
        .when(CBridgeNameRules.class, "getPrivateHeaderFileNameWithPath", any());
    PowerMockito.doReturn(PUBLIC_HEADER_NAME)
        .when(CBridgeNameRules.class, "getHeaderFileNameWithPath", any());
    PowerMockito.doReturn("")
        .when(CBridgeNameRules.class, "getImplementationFileNameWithPath", any());

    generator = new CBridgeGenerator(deploymentModel, resolver);
  }
}
