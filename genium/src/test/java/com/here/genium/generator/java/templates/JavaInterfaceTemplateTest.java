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

package com.here.genium.generator.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.genium.generator.common.TemplateEngine;
import com.here.genium.model.java.*;
import java.util.Arrays;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
@SuppressWarnings({"MethodName"})
public final class JavaInterfaceTemplateTest {

  private static final String TEMPLATE_NAME = "java/Interface";

  private static final String TEST_COPYRIGHT_HEADER =
      TemplateEngine.render("java/CopyrightHeader", null) + "\n";

  private final JavaInterface javaInterface = new JavaInterface("ExampleInterface");
  private final JavaPackage javaPackage =
      new JavaPackage(Arrays.asList("com", "test", "interfaces"));
  private final JavaCustomType javaCustomType = new JavaCustomType("ExampleType");
  private final JavaMethod interfaceMethod =
      JavaMethod.builder("someMethod").returnType(javaCustomType).build();
  private final JavaConstant javaConstant =
      new JavaConstant(javaCustomType, "Permanent", new JavaValue("valuable"));
  private final JavaImport javaImport = new JavaImport("ExampleType", JavaPackage.DEFAULT);
  private final JavaEnum javaEnum = new JavaEnum("Innumerable");
  private final JavaClass javaClass = new JavaClass("Classy");
  private final JavaType anotherJavaInterface =
      new JavaCustomType("AnotherInterface", JavaPackage.DEFAULT);

  @Before
  public void setUp() {
    javaInterface.javaPackage = javaPackage;
    interfaceMethod.parameters.add(new JavaParameter(new JavaCustomType("InParamType"), "param"));
  }

  @Test
  public void generateEmptyInterface() {
    //Arrange
    javaInterface.javaPackage = JavaPackage.DEFAULT;

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.example;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithComment() {
    // Arrange
    javaInterface.comment = "Example interface comment";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "/**\n"
            + " * Example interface comment\n"
            + " */\n"
            + "interface ExampleInterface {\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generate_interfaceWithOneMethod() {
    // Arrange
    javaInterface.methods.add(interfaceMethod);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    ExampleType someMethod(final InParamType param);\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generate_interfaceWithTwoMethods() {
    // Arrange
    JavaMethod interfaceMethodTwo = JavaMethod.builder("otherMethod").build();
    javaInterface.methods.add(interfaceMethod);
    javaInterface.methods.add(interfaceMethodTwo);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    ExampleType someMethod(final InParamType param);\n"
            + "    void otherMethod();\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generate_interfaceExtendingInterface() {
    // Arrange
    javaInterface.parentInterfaces.add(anotherJavaInterface);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "import com.example.AnotherInterface;\n\n"
            + "interface ExampleInterface extends AnotherInterface {\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithTwoParentInterfaces() {
    // Arrange
    javaInterface.parentInterfaces.add(anotherJavaInterface);
    javaInterface.parentInterfaces.add(new JavaCustomType("Face", JavaPackage.DEFAULT));

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "import com.example.AnotherInterface;\n"
            + "import com.example.Face;\n\n"
            + "interface ExampleInterface extends AnotherInterface, Face {\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithVisibility() {
    // Arrange
    javaInterface.visibility = JavaVisibility.PROTECTED;

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "protected interface ExampleInterface {\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithOneConstant() {
    // Arrange
    javaInterface.constants.add(javaConstant);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    static final ExampleType Permanent = valuable;\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithTwoConstants() {
    // Arrange
    javaInterface.constants.add(javaConstant);
    javaInterface.constants.add(
        new JavaConstant(javaCustomType, "Something", new JavaValue("something")));

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    static final ExampleType Permanent = valuable;\n"
            + "    static final ExampleType Something = something;\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithOneImport() {
    // Arrange
    javaConstant.value.imports.add(javaImport);
    javaInterface.constants.add(javaConstant);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "import com.example.ExampleType;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    static final ExampleType Permanent = valuable;\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithTwoImports() {
    // Arrange
    javaConstant.value.imports.add(javaImport);
    javaConstant.value.imports.add(new JavaImport("Unimportant", JavaPackage.DEFAULT));
    javaInterface.constants.add(javaConstant);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "import com.example.ExampleType;\n"
            + "import com.example.Unimportant;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    static final ExampleType Permanent = valuable;\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithSamePackageImport() {
    javaConstant.value.imports.add(new JavaImport("Unimportant", javaPackage));
    javaInterface.constants.add(javaConstant);

    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    static final ExampleType Permanent = valuable;\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithOneEnum() {
    // Arrange
    javaInterface.enums.add(javaEnum);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    enum Innumerable {\n"
            + "\n"
            + "\n"
            + "        public final int value;\n"
            + "\n"
            + "        Innumerable(final int value) {\n"
            + "            this.value = value;\n"
            + "        }\n"
            + "    }\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithTwoEnums() {
    // Arrange
    javaInterface.enums.add(javaEnum);
    javaInterface.enums.add(new JavaEnum("Numerous"));

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    enum Innumerable {\n"
            + "\n"
            + "\n"
            + "        public final int value;\n"
            + "\n"
            + "        Innumerable(final int value) {\n"
            + "            this.value = value;\n"
            + "        }\n"
            + "    }\n"
            + "    enum Numerous {\n"
            + "\n"
            + "\n"
            + "        public final int value;\n"
            + "\n"
            + "        Numerous(final int value) {\n"
            + "            this.value = value;\n"
            + "        }\n"
            + "    }\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithOneInnerClass() {
    // Arrange
    javaInterface.innerClasses.add(javaClass);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    class Classy {\n"
            + "    }\n"
            + "}\n";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithTwoInnerClasses() {
    // Arrange
    javaInterface.innerClasses.add(javaClass);
    javaInterface.innerClasses.add(new JavaClass("Classic"));

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.test.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    class Classy {\n"
            + "    }\n"
            + "    class Classic {\n"
            + "    }\n"
            + "}\n";
    assertEquals(expected, generated);
  }
}
