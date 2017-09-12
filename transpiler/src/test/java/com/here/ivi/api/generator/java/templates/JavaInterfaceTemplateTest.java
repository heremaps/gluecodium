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

package com.here.ivi.api.generator.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
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
      new JavaPackage(Arrays.asList("com", "here", "example", "interfaces"));
  private final JavaCustomType javaCustomType = new JavaCustomType("ExampleType");
  private final JavaMethod interfaceMethod = new JavaMethod("someMethod", javaCustomType);
  private final JavaConstant javaConstant =
      new JavaConstant(javaCustomType, "Permanent", new JavaValue("valuable"));
  private final JavaImport javaImport = new JavaImport("ExampleType", JavaPackage.DEFAULT);
  private final JavaEnum javaEnum = new JavaEnum("Innumerable");
  private final JavaClass javaClass = new JavaClass("Classy");
  private final JavaInterface anotherJavaInterface = new JavaInterface("AnotherInterface");

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
            + "package com.here.android;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "/**\n"
            + " * Example interface comment\n"
            + " */\n"
            + "interface ExampleInterface {\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    ExampleType someMethod(final InParamType param);\n"
            + "}";
    assertEquals(expected, generated);
  }

  @Test
  public void generate_interfaceWithTwoMethods() {
    // Arrange
    JavaMethod interfaceMethodTwo = new JavaMethod("otherMethod", new JavaPrimitiveType(Type.VOID));
    javaInterface.methods.add(interfaceMethod);
    javaInterface.methods.add(interfaceMethodTwo);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    ExampleType someMethod(final InParamType param);\n"
            + "    void otherMethod();\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "import com.here.android.AnotherInterface;\n\n"
            + "interface ExampleInterface extends AnotherInterface {\n"
            + "}";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithTwoParentInterfaces() {
    // Arrange
    javaInterface.parentInterfaces.add(anotherJavaInterface);
    javaInterface.parentInterfaces.add(new JavaInterface("Face"));

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "import com.here.android.AnotherInterface;\n"
            + "import com.here.android.Face;\n\n"
            + "interface ExampleInterface extends AnotherInterface, Face {\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "protected interface ExampleInterface {\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    static final ExampleType Permanent = valuable;\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    static final ExampleType Permanent = valuable;\n"
            + "    static final ExampleType Something = something;\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "import com.here.android.ExampleType;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    static final ExampleType Permanent = valuable;\n"
            + "}";
    assertEquals(expected, generated);
  }

  @Test
  public void generateInterfaceWithTwoImports() {
    // Arrange
    javaConstant.value.imports.add(javaImport);
    javaConstant.value.imports.add(new JavaImport("Unimportant", javaPackage));
    javaInterface.constants.add(javaConstant);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "import com.here.android.ExampleType;\n"
            + "import com.here.example.interfaces.Unimportant;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    static final ExampleType Permanent = valuable;\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    enum Innumerable {\n"
            + "    }\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    enum Innumerable {\n"
            + "    }\n"
            + "    enum Numerous {\n"
            + "    }\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    class Classy {\n"
            + "    }\n"
            + "}";
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
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "interface ExampleInterface {\n"
            + "    class Classy {\n"
            + "    }\n"
            + "    class Classic {\n"
            + "    }\n"
            + "}";
    assertEquals(expected, generated);
  }
}
