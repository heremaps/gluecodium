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

package com.here.genium.generator.swift;

import static com.here.genium.test.LoadModelHelper.readInFrancaModel;
import static org.junit.Assert.*;
import static org.mockito.MockitoAnnotations.initMocks;

import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.swift.SwiftClass;
import com.here.genium.model.swift.SwiftContainerType;
import com.here.genium.model.swift.SwiftFile;
import com.here.genium.model.swift.SwiftMethod;
import com.here.genium.model.swift.SwiftParameter;
import com.here.genium.test.LoadModelHelper;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class SwiftGeneratorIntegrationTest {
  private static final List<String> TEST_FIDL_FILE =
      Arrays.asList(
          "swift/fidl/test/SwiftGeneratorTest.fidl", "swift/fidl/test/SwiftGeneratorTest.fdepl");

  private final List<FTypeCollection> typeCollections = new LinkedList<>();
  private SwiftGenerator generator;

  @Before
  public void setUp() {
    initMocks(this);

    FrancaDeploymentModel deploymentModel = readInFrancaModel(TEST_FIDL_FILE, typeCollections);
    generator = new SwiftGenerator(deploymentModel);
  }

  @Test
  public void modelForIfaceWithStruct() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 7));

    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNotNull("The property should not be empty", clazz.structs);
    assertEquals("Structs should be part of class", 2, clazz.structs.size());
    assertEquals("Structs should not be part of file", 0, file.structs.size());
    SwiftContainerType struct = clazz.structs.get(0);
    assertEquals("name should be parsed correctly to Swift", "TestInterface7.Struct0", struct.name);
    assertEquals("comments should be parsed correctly", "This is a test struct", struct.comment);
    assertEquals("all fields should be recognized", 2, struct.fields.size());
    assertEquals("the name of the fields are correct", "elem1", struct.fields.get(0).name);
    assertEquals(
        "the type of the fields are correct", "Int64", struct.fields.get(0).type.toString());
    assertEquals(
        "CBridge prefix is set correctly",
        "swift_fidl_test_TestInterface7_Struct0",
        struct.cPrefix);
  }

  @Test
  public void modelForProtocolIfaceWithStruct() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 8));

    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNotNull("The property should not be empty", clazz.structs);
    assertEquals("Structs should not be part of class", 0, clazz.structs.size());
    assertEquals("Structs should be part of file", 2, file.structs.size());
    SwiftContainerType struct = file.structs.get(0);
    assertEquals("name should be parsed correctly to Swift", "Struct0", struct.name);
    assertEquals("comments should be parsed correctly", "This is a test struct", struct.comment);
    assertEquals("all fields should be recognized", 2, struct.fields.size());
    assertEquals("the name of the fields are correct", "elem1", struct.fields.get(0).name);
    assertEquals(
        "the type of the fields are correct", "Int64", struct.fields.get(0).type.toString());
    assertEquals(
        "CBridge prefix is set correctly",
        "swift_fidl_test_TestInterface8_Struct0",
        struct.cPrefix);
  }

  @Test
  public void modelForIfaceWithStaticMethod() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 6));
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
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 5));
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
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 4));
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
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 3));
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
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 2));
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
  public void modelForProtocolIfaceWithOneSimpleMethod() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 8));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNotNull(clazz.comment);
    assertNotNull(clazz.implementsProtocols);
    assertTrue(clazz.implementsProtocols.isEmpty());
    assertNotNull(clazz.properties);
    assertTrue(clazz.properties.isEmpty());
    assertEquals(
        "The base namespace should be set to its c_bridge class",
        "swift_fidl_test",
        clazz.nameSpace);
    assertEquals("TestInterface8", clazz.name);
    assertNotNull(clazz.methods);
    assertEquals(1, clazz.methods.size());
    final SwiftMethod method = clazz.methods.get(0);
    assertEquals("method0", method.name);
    assertTrue(method.parameters.isEmpty());
  }

  @Test
  public void modelForIfaceWithOneSimpleMethod() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 1));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNull(clazz.parentClass);
    assertNotNull(clazz.comment);
    assertTrue(clazz.comment.isEmpty());
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
  public void modelForProtocolIfaceWithoutElements() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 8));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNotNull(clazz.methods);
    assertNotNull(clazz.comment);
    assertNotNull(clazz.implementsProtocols);
    assertTrue(clazz.implementsProtocols.isEmpty());
    assertNotNull(clazz.properties);
    assertTrue(clazz.properties.isEmpty());
    assertEquals(
        "The base namespace should be set to its c_bridge class",
        "swift_fidl_test",
        clazz.nameSpace);
    assertEquals("TestInterface8", clazz.name);
  }

  @Test
  public void modelForIfaceWithoutElements() {
    final SwiftFile file =
        this.generator.buildSwiftModel(
            LoadModelHelper.extractNthInterfaceFromModel(typeCollections, 0));
    assertEquals("There should be one class defined in file", 1, file.classes.size());
    SwiftClass clazz = file.classes.get(0);
    assertNull(clazz.parentClass);
    assertNotNull(clazz.methods);
    assertTrue(clazz.methods.isEmpty());
    assertNotNull(clazz.comment);
    assertTrue(clazz.comment.isEmpty());
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
            LoadModelHelper.extractNthTypeCollectionFromModel(typeCollections, 0));
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
