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
import static org.junit.Assert.fail;
import static org.mockito.MockitoAnnotations.initMocks;

import com.here.ivi.api.generator.utils.LoadModelHelper;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.swift.SwiftClass;
import com.here.ivi.api.model.swift.SwiftContainerType;
import com.here.ivi.api.model.swift.SwiftFile;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftParameter;
import java.net.URISyntaxException;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class SwiftGeneratorIntegrationTest {
  private static final String TEST_FIDL_FILE = "swift/fidl/test/SwiftGeneratorTest.fdepl";

  private FrancaModel francaModel;
  private SwiftGenerator generator;

  @Before
  public void setUp() {
    initMocks(this);
    try {
      francaModel = readInFrancaModel(TEST_FIDL_FILE);
    } catch (URISyntaxException e) {
      fail("Franca model should be readable");
    }
    generator = new SwiftGenerator();
  }

  @Test
  public void modelForIfaceWithStruct() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 7));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNotNull("The property should not be empty", clazz.structs);
    assertEquals("It should parse both structs", 2, clazz.structs.size());
    SwiftContainerType struct = clazz.structs.get(0);
    assertEquals("name should be parsed correctly to Swift", "Struct0", struct.name);
    assertEquals("comments should be parsed correctly", "This is a test struct", struct.comment);
    assertEquals("all fields should be recognized", 2, struct.fields.size());
    assertEquals("the name of the fields are correct", "elem1", struct.fields.get(0).name);
    assertEquals(
        "the type of the fields are correct", "Int64", struct.fields.get(0).type.toString());
    assertEquals(
        "CBridge prefix is set correctly",
        "swift_fidl_test_TestInterface7_Struct0",
        struct.cPrefix);
    assertEquals(
        "the CBridge type of the struct is correct",
        "swift_fidl_test_TestInterface7_Struct0Ref",
        struct.cType);
  }

  @Test
  public void modelForIfaceWithStaticMethod() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 6));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertTrue(method.isStatic);
  }

  @Test
  public void modelForIfaceWithTwoMethodsWithInAndOutParams() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 5));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNotNull(clazz.methods);
    assertEquals(2, clazz.methods.size());
    for (final SwiftMethod method : clazz.methods) {
      assertNotNull(method.parameters);
      assertEquals(2, method.parameters.size());
      assertNotNull(method.parameters.get(0));
      assertEquals("param1", method.parameters.get(0).name);
      assertNotNull(method.parameters.get(1));
      assertEquals("param2", method.parameters.get(1).name);
      assertNotNull(method.returnType);
      assertEquals("String", method.returnType.name);
    }
  }

  @Test
  public void modelForIfaceWithOneMethodWithOutParam() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 4));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertNotNull(method.returnType);
    assertEquals("String", method.returnType.name);
  }

  @Test
  public void modelForIfaceWithOneMethodWithMultipleInParams() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 3));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertNotNull(method.parameters);
    assertEquals(3, method.parameters.size());
    assertNotNull(method.parameters.get(0));
    assertEquals("param1", method.parameters.get(0).name);
    assertNotNull(method.parameters.get(1));
    assertEquals("param2", method.parameters.get(1).name);
    assertNotNull(method.parameters.get(2));
    assertEquals("param3", method.parameters.get(2).name);
  }

  @Test
  public void modelForIfaceWithOneMethodWithOneInParam() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 2));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertEquals("method0", method.name);
    assertTrue(method.comment.isEmpty());
    assertFalse(method.isStatic);
    assertNotNull(method.parameters);
    assertEquals(1, method.parameters.size());
    final SwiftParameter param = method.parameters.get(0);
    assertNotNull(param);
    assertEquals("param1", param.name);
  }

  @Test
  public void modelForIfaceWithOneSimpleMethod() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 1));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNull(clazz.parentClass);
    assertNotNull(clazz.comment);
    assertTrue(clazz.comment.isEmpty());
    assertNotNull(clazz.implementsProtocols);
    assertEquals(clazz.implementsProtocols.size(), 1);
    assertNotNull(clazz.properties);
    assertTrue(clazz.properties.isEmpty());
    assertEquals(
        "The base namespace should be set to its c_bridge class",
        "swift_fidl_test",
        clazz.nameSpace);
    assertEquals("TestInterface1", clazz.name);
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertEquals("method0", method.name);
    assertTrue(method.parameters.isEmpty());
  }

  @Test
  public void modelForIfaceWithoutElements() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(this.francaModel, 0));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNull(clazz.parentClass);
    assertNotNull(clazz.methods);
    assertTrue(clazz.methods.isEmpty());
    assertNotNull(clazz.comment);
    assertTrue(clazz.comment.isEmpty());
    assertNotNull(clazz.implementsProtocols);
    assertEquals(clazz.implementsProtocols.size(), 1);
    assertNotNull(clazz.properties);
    assertTrue(clazz.properties.isEmpty());
    assertEquals(
        "The base namespace should be set to its c_bridge class",
        "swift_fidl_test",
        clazz.nameSpace);
    assertEquals("TestInterface0", clazz.name);
  }

  @Test
  public void modelForTypeCollectionWithTwoStructs() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthTypeCollectionFromModel(this.francaModel, 0));
    assertEquals("There should be no class defined in file", 0, file.classes.size());
    assertEquals("There should be two structs defined in file", 2, file.structs.size());
    SwiftContainerType struct = file.structs.get(0);
    assertEquals("Struct0", struct.name);
    assertEquals("First struct should have 2 fields", 2, struct.fields.size());
    struct = file.structs.get(1);
    assertEquals("Struct1", struct.name);
    assertEquals("Second struct should have 1 field", 1, struct.fields.size());
  }
}
