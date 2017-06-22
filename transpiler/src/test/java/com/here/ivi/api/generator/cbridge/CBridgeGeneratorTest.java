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

import static com.here.ivi.api.generator.utils.LoadModelHelper.extractNthInterfaceFromModel;
import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.SpecAccessorFactory;
import com.here.ivi.api.loader.baseapi.BaseApiSpecAccessorFactory;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.ModelHelper;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import navigation.BaseApiSpec.InterfacePropertyAccessor;
import org.apache.commons.io.FileUtils;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class CBridgeGeneratorTest {
  private CBridgeGenerator generator;

  @Rule public TemporaryFolder tempFolder = new TemporaryFolder();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Interface<InterfacePropertyAccessor> anInterface;

  @Mock private FInterface fInterface;
  @Mock private EList<FMethod> methods;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    when(anInterface.getFrancaInterface()).thenReturn(fInterface);
    when(fInterface.getName()).thenReturn("TEST_NAME");
    when(fInterface.getMethods()).thenReturn(methods);
    when(anInterface.getPackage()).thenReturn(singletonList("Package"));
    generator = new CBridgeGenerator(new CBridgeNameRules());
  }

  @Test
  public void createIncludesToBaseapiAndHeaderInImplementationFile() {
    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertEquals(
        "Model should contain 2 imports, to header file and API header file",
        2,
        cModel.implementationIncludes.size());
    assertEqualImplementationIncludes(
        asList("TEST_NAME.h", "stub/Package/TEST_NAMEStub.h"), cModel);
  }

  @Test
  public void createIncludesToBaseapiAndHeaderForSimpleMethod() throws IOException {
    Interface<?> iface =
        createFrancaInterface(
            "package cbridge.test",
            "interface TestInterface {",
            "version {major 0 minor 1}",
            "  method TestMethod {",
            "    in {}",
            "    out {}",
            "  }",
            "}");

    CInterface cModel = generator.buildCBridgeModel(iface);

    assertEqualImplementationIncludes(
        asList("TestInterface.h", "stub/cbridge/test/TestInterfaceStub.h"), cModel);
    assertEqualHeaderIncludes(emptyList(), cModel);
  }

  @Test
  public void createIncludesForMethodTakingString() throws IOException {
    Interface<?> iface =
        createFrancaInterface(
            "package cbridge.test",
            "interface TestInterface {",
            "version {major 0 minor 1}",
            "  method TestMethod {",
            "    in {String inputParam}",
            "    out {}",
            "  }",
            "}");

    CInterface cModel = generator.buildCBridgeModel(iface);
    assertEquals("Should be one function created", 1, cModel.functions.size());
    assertEqualImplementationIncludes(
        asList("string", "TestInterface.h", "stub/cbridge/test/TestInterfaceStub.h"), cModel);
    assertEqualHeaderIncludes(emptyList(), cModel);
  }

  @Test
  public void createIncludesForMethodRequiringTwoWayStringTypeConversion() throws IOException {
    Interface<?> iface =
        createFrancaInterface(
            "package cbridge.test",
            "interface TestInterface {",
            "version {major 0 minor 1}",
            "  method TestMethod {",
            "    in {String inputParam}",
            "    out {String outputParam}",
            "  }",
            "}");

    CInterface cModel = generator.buildCBridgeModel(iface);
    assertEquals("Should be one function created", 1, cModel.functions.size());
    assertEqualImplementationIncludes(
        asList("string.h", "string", "TestInterface.h", "stub/cbridge/test/TestInterfaceStub.h"),
        cModel);
    assertEqualHeaderIncludes(emptyList(), cModel);
  }

  @Test
  public void createIncludesForMethodRequiringTwoWayInt16TypeConversion() throws IOException {
    Interface<?> iface =
        createFrancaInterface(
            "package cbridge.test",
            "interface TestInterface {",
            "version {major 0 minor 1}",
            "  method TestMethod {",
            "    in {Int16 inputParam}",
            "    out {Int16 outputParam}",
            "  }",
            "}");

    CInterface cModel = generator.buildCBridgeModel(iface);
    assertEquals("Should be one function created", 1, cModel.functions.size());
    assertEqualImplementationIncludes(
        asList("TestInterface.h", "stub/cbridge/test/TestInterfaceStub.h"), cModel);
    assertEqualHeaderIncludes(asList("stdint.h"), cModel);
  }

  private FrancaModel<?, ?> readInFrancaModel(
      String content, SpecAccessorFactory specAccessorFactory) throws IOException {
    File tempFile = tempFolder.newFile("test.fidl");
    FileUtils.writeStringToFile(tempFile, content, (Charset) null);
    FrancaModelLoader<?, ?> francaModelLoader = new FrancaModelLoader(specAccessorFactory);
    ModelHelper.getFdeplInjector().injectMembers(francaModelLoader);

    return francaModelLoader.load(specAccessorFactory.getSpecPath(), singletonList(tempFile));
  }

  Interface<?> createFrancaInterface(String... fidlLines) throws IOException {
    String sourceFidl = String.join("\n", fidlLines);
    Interface<?> iface =
        extractNthInterfaceFromModel(
            readInFrancaModel(sourceFidl, new BaseApiSpecAccessorFactory()), 0);
    return iface;
  }

  private void assertEqualHeaderIncludes(List<String> includes, CInterface cModel) {
    Set<String> expectedIncludes = new HashSet<>(includes);
    Set<String> actualImports = extractIncludes(cModel.headerIncludes);
    assertEquals(expectedIncludes, actualImports);
  }

  private void assertEqualImplementationIncludes(List<String> includes, CInterface cModel) {
    Set<String> expectedIncludes = new HashSet<>(includes);
    Set<String> actualImports = extractIncludes(cModel.implementationIncludes);
    assertEquals(expectedIncludes, actualImports);
  }

  private Set<String> extractIncludes(Set<Includes.Include> includes) {
    return includes.stream().map(include -> getIncludeName(include)).collect(Collectors.toSet());
  }

  private static String getIncludeName(Includes.Include include) {
    if (include instanceof Includes.SystemInclude) return ((Includes.SystemInclude) include).file;
    else if (include instanceof Includes.InternalPublicInclude)
      return ((Includes.InternalPublicInclude) include).file;
    else return "";
  }
}
