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

package com.here.ivi.api.generator.swift;

import static com.here.ivi.api.generator.utils.LoadModelHelper.readInFrancaModel;
import static junit.framework.TestCase.assertFalse;
import static junit.framework.TestCase.assertNotNull;
import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import com.here.ivi.api.generator.utils.LoadModelHelper;
import com.here.ivi.api.loader.baseapi.BaseApiSpecAccessorFactory;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.swift.SwiftClass;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftParameter;
import java.net.URISyntaxException;
import navigation.BaseApiSpec;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
public class SwiftGeneratorIntegrationTest {
  @Mock private SwiftNameRules nameRules;

  private static final String TEST_FIDL_FILE = "swift/fidl/test/SwiftGeneratorTest.fdepl";

  private static final String CLASS_NAME = "MockedClassName";
  private static final String METHOD_NAME = "MockedMethodName";
  private static final String PARAM_NAME = "MockedParameterName";
  private FrancaModel<
          BaseApiSpec.InterfacePropertyAccessor, BaseApiSpec.TypeCollectionPropertyAccessor>
      francaModel;
  private SwiftGenerator generator;

  @Before
  public void setUp() {
    initMocks(this);
    try {
      francaModel = readInFrancaModel(TEST_FIDL_FILE, new BaseApiSpecAccessorFactory());
    } catch (URISyntaxException e) {
      assertFalse("Franca model should be readable", true);
    }
    generator = new SwiftGenerator(nameRules);
    when(nameRules.getClassName(any())).thenReturn(CLASS_NAME);
    when(nameRules.getMethodName(any())).thenReturn(METHOD_NAME);
    when(nameRules.getParameterName(any())).thenReturn(PARAM_NAME);
  }

  @Test
  public void modelForIfaceWithStaticMethod() {
    final SwiftClass clazz =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 6));
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertTrue(method.isStatic);
  }

  @Test
  public void modelForIfaceWithTwoMethodsWithInAndOutParams() {
    final SwiftClass clazz =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 5));
    assertNotNull(clazz.methods);
    assertEquals(2, clazz.methods.size());
    for (final SwiftMethod method : clazz.methods) {
      assertNotNull(method.parameters);
      assertEquals(2, method.parameters.size());
      for (final SwiftParameter param : method.parameters) {
        assertNotNull(param);
        assertEquals(PARAM_NAME, param.name);
      }
      assertNotNull(method.returnType);
      assertEquals("String", method.returnType.name);
    }
  }

  @Test
  public void modelForIfaceWithOneMethodWithOutParam() {
    final SwiftClass clazz =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 4));
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertNotNull(method.returnType);
    assertEquals("String", method.returnType.name);
  }

  @Test
  public void modelForIfaceWithOneMethodWithMultipleInParams() {
    final SwiftClass clazz =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 3));
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertNotNull(method.parameters);
    assertEquals(3, method.parameters.size());
    for (final SwiftParameter param : method.parameters) {
      assertNotNull(param);
      assertEquals(PARAM_NAME, param.name);
    }
  }

  @Test
  public void modelForIfaceWithOneMethodWithOneInParam() {
    final SwiftClass clazz =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 2));
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertEquals(METHOD_NAME, method.name);
    assertTrue(method.comment.isEmpty());
    assertFalse(method.isStatic);
    assertNotNull(method.parameters);
    assertEquals(1, method.parameters.size());
    final SwiftParameter param = method.parameters.get(0);
    assertNotNull(param);
    assertEquals(PARAM_NAME, param.name);
  }

  @Test
  public void modelForIfaceWithOneSimpleMethod() {
    final SwiftClass clazz =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 1));
    assertNull(clazz.parentClass);
    assertNotNull(clazz.comment);
    assertTrue(clazz.comment.isEmpty());
    assertNotNull(clazz.implementsProtocols);
    assertTrue(clazz.implementsProtocols.isEmpty());
    assertNotNull(clazz.properties);
    assertTrue(clazz.properties.isEmpty());
    assertNotNull(clazz.imports);
    assertEquals("By default it should include Foundatation only", 1, clazz.imports.size());
    assertEquals(
        "The base namespace should be set to its c_bridge class",
        "swift_fidl_test",
        clazz.nameSpace);
    assertEquals(CLASS_NAME, clazz.name);
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertEquals(METHOD_NAME, method.name);
    assertTrue(method.parameters.isEmpty());
    assertTrue(method.comment.isEmpty());
    assertFalse(method.isStatic);
  }

  @Test
  public void modelForIfaceWithoutElements() {
    final SwiftClass clazz =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 0));
    assertNull(clazz.parentClass);
    assertNotNull(clazz.methods);
    assertTrue(clazz.methods.isEmpty());
    assertNotNull(clazz.comment);
    assertTrue(clazz.comment.isEmpty());
    assertNotNull(clazz.implementsProtocols);
    assertTrue(clazz.implementsProtocols.isEmpty());
    assertNotNull(clazz.properties);
    assertTrue(clazz.properties.isEmpty());
    assertNotNull(clazz.imports);
    assertEquals("By default it should include Foundatation only", 1, clazz.imports.size());
    assertEquals(
        "The base namespace should be set to its c_bridge class",
        "swift_fidl_test",
        clazz.nameSpace);
    assertEquals(CLASS_NAME, clazz.name);
  }
}
