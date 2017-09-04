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

package com.here.ivi.api.generator.common.java.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaInterface;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaInterfaceTemplateTest {

  private static final String TEMPLATE_NAME = "java/Interface";

  private static final String TEST_COPYRIGHT_HEADER =
      TemplateEngine.render("java/CopyrightHeader", null) + "\n";

  @Test
  public void generate_minimumInterface() {
    // Arrange
    JavaInterface javaInterface = new JavaInterface("ExampleInterface");
    javaInterface.comment = "Example interface comment";
    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Example interface comment\n"
            + " */\n"
            + "interface ExampleInterface {\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Arrange
    assertEquals(expected, generated);
  }

  @Test
  public void generate_interfaceWithOneMethod() {
    // Arrange
    JavaMethod interfaceMethod = new JavaMethod("someMethod", new JavaCustomType("ExampleType"));
    interfaceMethod.parameters.add(new JavaParameter(new JavaCustomType("InParamType"), "param"));
    interfaceMethod.comment = "Method comment";
    JavaInterface javaInterface = new JavaInterface("ExampleInterface");
    javaInterface.javaPackage =
        new JavaPackage(Arrays.asList("com", "here", "example", "interfaces"));
    javaInterface.comment = "Example interface comment";
    javaInterface.methods.add(interfaceMethod);

    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "/**\n"
            + " * Example interface comment\n"
            + " */\n"
            + "interface ExampleInterface {\n"
            + "    /**\n"
            + "     * Method comment\n"
            + "     */\n"
            + "    ExampleType someMethod(final InParamType param);\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  public void generate_interfaceWithTwoMethods() {
    // Arrange
    JavaMethod interfaceMethod = new JavaMethod("someMethod", new JavaCustomType("ExampleType"));
    interfaceMethod.parameters.add(new JavaParameter(new JavaCustomType("InParamType"), "param"));
    JavaMethod interfaceMethodTwo = new JavaMethod("otherMethod", new JavaPrimitiveType(Type.VOID));
    JavaInterface javaInterface = new JavaInterface("ExampleInterface");
    javaInterface.javaPackage =
        new JavaPackage(Arrays.asList("com", "here", "example", "interfaces"));
    javaInterface.comment = "Example interface comment";
    javaInterface.methods.add(interfaceMethod);
    javaInterface.methods.add(interfaceMethodTwo);

    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "/**\n"
            + " * Example interface comment\n"
            + " */\n"
            + "interface ExampleInterface {\n"
            + "    ExampleType someMethod(final InParamType param);\n"
            + "    void otherMethod();\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    assertEquals(expected, generated);
  }

  @Test
  //TODO(APIGEN-122): A Java interface can 'extend' an interface but not a class!!!
  // An interface can "implement" many interfaces as well.
  public void generate_interfaceExtendingInterface() {
    // Arrange
    JavaInterface javaInterface = new JavaInterface("ExampleInterface");
    javaInterface.javaPackage =
        new JavaPackage(Arrays.asList("com", "here", "example", "interfaces"));
    javaInterface.extendedInterface = new JavaInterface("AnotherInterface");

    String expected =
        TEST_COPYRIGHT_HEADER
            + "package com.here.example.interfaces;\n"
            + "\n"
            + "interface ExampleInterface extends AnotherInterface {\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaInterface);

    // Assert
    assertEquals(expected, generated);
  }
}
