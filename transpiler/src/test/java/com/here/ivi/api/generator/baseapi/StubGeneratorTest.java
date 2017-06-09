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

package com.here.ivi.api.generator.cppStub;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.StringContains.containsString;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.generator.baseapi.CppStubGeneratorSuite;
import com.here.ivi.api.generator.baseapi.CppStubNameRules;
import com.here.ivi.api.generator.baseapi.StubGenerator;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.baseapi.CppStubSpecAccessorFactory;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.ModelHelper;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import org.junit.Test;

public class StubGeneratorTest {

  private final String NO_OUT_PARAMS_METHOD_SIGNATURE =
      "void methodNoOutParams( const std::string& input )";
  private final String ONE_OUT_PARAM_METHOD_SIGNATURE =
      "std::string methodOneOutParam( const std::string& input )";
  private final String TWO_OUT_PARAMS_METHOD_SIGNATURE =
      "MethodTwoOutParamsResult methodTwoOutParams( const std::string& input )";
  private final String RESULT_STRUCT_DECLARATION = "struct MethodTwoOutParamsResult";

  @Test
  public void generateStubForMethodsWithoutErrorCode() throws URISyntaxException, IOException {
    FrancaModel<?, ?> model = readInModel("cppstub/fidl/test/MethodsWithoutError.fidl");
    Interface<?> iface = extractInterfaceFromModel(model);
    StubGenerator stubGenerator = createStubGeneratorForTest(model);

    String actualContent = stubGenerator.generate(iface).content.toString();

    assertThat(actualContent, containsString(NO_OUT_PARAMS_METHOD_SIGNATURE));
    assertThat(actualContent, containsString(ONE_OUT_PARAM_METHOD_SIGNATURE));
    assertThat(actualContent, containsString(RESULT_STRUCT_DECLARATION));
    assertThat(actualContent, containsString(TWO_OUT_PARAMS_METHOD_SIGNATURE));
  }

  private FrancaModel<?, ?> readInModel(String fileName) throws URISyntaxException {
    URL testFidl = ClassLoader.getSystemClassLoader().getResource(fileName);
    Collection<File> testFiles = Arrays.asList(new File(testFidl.toURI()));

    CppStubSpecAccessorFactory specAccessorFactory = new CppStubSpecAccessorFactory();
    FrancaModelLoader<?, ?> francaModelLoader = new FrancaModelLoader<>(specAccessorFactory);
    ModelHelper.getFdeplInjector().injectMembers(francaModelLoader);

    return francaModelLoader.load(specAccessorFactory.getSpecPath(), testFiles);
  }

  private Interface<?> extractInterfaceFromModel(FrancaModel<?, ?> model) {
    List<? extends Interface<?>> interfaces = model.getInterfaces();
    assertEquals(1, interfaces.size());
    return interfaces.get(0);
  }

  private StubGenerator createStubGeneratorForTest(FrancaModel<?, ?> model) throws IOException {
    CppStubGeneratorSuite suite = mock(CppStubGeneratorSuite.class);
    Transpiler transpiler = mock(Transpiler.class);
    when(suite.getTool()).thenReturn(transpiler);
    when(transpiler.resolveRelativeToRootPath(anyString())).thenReturn("output.test");

    CppStubNameRules nameRules = new CppStubNameRules(model);
    CppIncludeResolver includeResolver = new CppIncludeResolver(model);

    return new StubGenerator(suite, nameRules, includeResolver);
  }
}
