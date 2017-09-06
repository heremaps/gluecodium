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
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaClass.Qualifier;
import com.here.ivi.api.model.javamodel.JavaConstant;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaEnum;
import com.here.ivi.api.model.javamodel.JavaEnumItem;
import com.here.ivi.api.model.javamodel.JavaField;
import com.here.ivi.api.model.javamodel.JavaImport;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaMethod.MethodQualifier;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaValue;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaClassTemplateTest {

  private static final String TEMPLATE_NAME = "java/ClassHeader";

  private static final String TEST_COPYRIGHT_HEADER =
      TemplateEngine.render("java/CopyrightHeader", null) + "\n";

  @Test
  public void generate_minimal() {
    // Arrange
    JavaClass javaClass = new JavaClass("ExampleClass");
    javaClass.comment = "Example class comment";
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "class ExampleClass {\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withMethod() {
    // Arrange
    JavaCustomType exampleType = new JavaCustomType("ExampleType");
    JavaParameter parameter = new JavaParameter(new JavaCustomType("InParamType"), "param");
    JavaMethod classMethod = new JavaMethod("someMethod", exampleType);
    classMethod.qualifiers.add(MethodQualifier.NATIVE);
    classMethod.visibility = JavaVisibility.PRIVATE;
    classMethod.parameters.add(parameter);
    classMethod.comment = "Method comment";
    JavaClass javaClass = new JavaClass("ExampleClass");
    javaClass.javaPackage = new JavaPackage(Arrays.asList("com", "here", "generator", "example"));
    javaClass.comment = "Example class comment";
    javaClass.methods.add(classMethod);
    javaClass.visibility = JavaVisibility.PUBLIC;

    String expected =
        "package com.here.generator.example;\n"
            + "\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "public class ExampleClass {\n"
            + "    /**\n"
            + "     * Method comment\n"
            + "     */\n"
            + "    private native ExampleType someMethod(final InParamType param);\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withEnum() {
    // Arrange
    JavaEnumItem enumItem = new JavaEnumItem("ITEM", new JavaValue("1"));
    JavaEnum classEnum = new JavaEnum("ExampleEnum");
    classEnum.items.add(enumItem);
    classEnum.comment = "Enum comment";
    JavaClass javaClass = new JavaClass("ExampleClass");
    javaClass.javaPackage = new JavaPackage(Arrays.asList("com", "here", "enums"));
    javaClass.comment = "Example class comment";
    javaClass.enums.add(classEnum);
    String expected =
        "package com.here.enums;\n"
            + "\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "class ExampleClass {\n"
            + "    /**\n"
            + "     * Enum comment\n"
            + "     */\n"
            + "    enum ExampleEnum {\n"
            + "        ITEM = 1,\n"
            + "    };\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withEnumAndMethods() {
    // Arrange
    JavaMethod classMethod =
        new JavaMethod("someMethod", new JavaPrimitiveType(JavaPrimitiveType.Type.VOID));
    classMethod.qualifiers.add(JavaMethod.MethodQualifier.NATIVE);
    classMethod.comment = "Method comment";
    JavaEnumItem enumItem = new JavaEnumItem("ITEM", new JavaValue("1"));
    JavaEnum classEnum = new JavaEnum("ExampleEnum");
    classEnum.items.add(enumItem);
    classEnum.comment = "Enum comment";
    JavaClass javaClass = new JavaClass("ExampleClass");
    javaClass.comment = "Example class comment";
    javaClass.methods.add(classMethod);
    javaClass.enums.add(classEnum);

    String expected =
        "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "class ExampleClass {\n"
            + "    /**\n"
            + "     * Enum comment\n"
            + "     */\n"
            + "    enum ExampleEnum {\n"
            + "        ITEM = 1,\n"
            + "    };\n"
            + "    /**\n"
            + "     * Method comment\n"
            + "     */\n"
            + "    native void someMethod();\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withInheritance() {
    // Arrange
    JavaClass javaClass = new JavaClass("ChildClass");
    javaClass.comment = "Child class comment";
    javaClass.extendedClass = new JavaClass("ParentClass");
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Child class comment\n"
            + " */\n"
            + "class ChildClass extends ParentClass {\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Arrange
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withInnerClass() {
    // Arrange
    JavaField intField =
        new JavaField(
            new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intField", new JavaValue("1"));
    JavaClass innerClass = new JavaClass("InnerClass");
    innerClass.comment = "Inner class comment";
    innerClass.fields.add(intField);
    innerClass.visibility = JavaVisibility.PROTECTED;
    JavaClass javaClass = new JavaClass("ExampleClass");
    javaClass.comment = "Example class comment";
    javaClass.visibility = JavaVisibility.PUBLIC;
    javaClass.innerClasses.add(innerClass);
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "public class ExampleClass {\n"
            + "    /**\n"
            + "     * Inner class comment\n"
            + "     */\n"
            + "    protected class InnerClass {\n"
            + "        int intField = 1;\n"
            + "    }\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Arrange
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_staticInnerClass() {
    // Arrange
    JavaField intField =
        new JavaField(
            new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intField", new JavaValue("1"));
    JavaClass innerClass = new JavaClass("StaticInnerClass");
    innerClass.comment = "Inner class comment";
    innerClass.fields.add(intField);
    innerClass.visibility = JavaVisibility.PUBLIC;
    innerClass.qualifiers.add(Qualifier.STATIC);
    JavaClass javaClass = new JavaClass("ExampleClass");
    javaClass.comment = "Example class comment";
    javaClass.visibility = JavaVisibility.PACKAGE;
    javaClass.innerClasses.add(innerClass);
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "class ExampleClass {\n"
            + "    /**\n"
            + "     * Inner class comment\n"
            + "     */\n"
            + "    public static class StaticInnerClass {\n"
            + "        int intField = 1;\n"
            + "    }\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_finalClassWithConstant() {
    // Arrange
    JavaClass javaClass = new JavaClass("ExampleClass");
    javaClass.comment = "Example class comment";
    javaClass.qualifiers.add(Qualifier.FINAL);
    javaClass.constants.add(
        new JavaConstant(new JavaPrimitiveType(Type.FLOAT), "myConst", new JavaValue("42")));
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "final class ExampleClass {\n"
            + "    static final float myConst = 42;\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withImports() {
    // Arrange
    JavaField fieldWithImports = new JavaField(new JavaCustomType("Foo"), "someField");
    fieldWithImports.type.imports.add(
        new JavaImport("Foo", new JavaPackage(Arrays.asList("com", "example"))));
    JavaClass javaClass = new JavaClass("ClassWithImports");
    javaClass.qualifiers.add(Qualifier.FINAL);
    javaClass.fields.add(fieldWithImports);
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "import com.example.Foo;\n"
            + "\n"
            + "final class ClassWithImports {\n"
            + "    Foo someField = new Foo();\n"
            + "}";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }
}
