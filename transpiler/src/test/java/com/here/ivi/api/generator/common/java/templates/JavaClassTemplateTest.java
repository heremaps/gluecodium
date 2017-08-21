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

import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaEnum;
import com.here.ivi.api.model.javamodel.JavaEnumItem;
import com.here.ivi.api.model.javamodel.JavaField;
import com.here.ivi.api.model.javamodel.JavaInheritance;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaMethod.MethodQualifier;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaValue;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaClassTemplateTest {
  private static final String COPYRIGHT_NOTICE = JavaCopyrightHeaderTemplate.generate() + "\n";

  @Test
  public void generate_minimumClass() {
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
    CharSequence generated =
        com.here.ivi.api.generator.common.java.templates.JavaClassTemplate.generate(javaClass);

    // Assert
    assertEquals(COPYRIGHT_NOTICE + expected, generated.toString());
  }

  @Test
  public void generate_classWithMethod() {
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
            + "  /**\n"
            + "   * Method comment\n"
            + "   */\n"
            + "  private native ExampleType someMethod(final InParamType param);\n"
            + "}";

    // Act
    CharSequence generated =
        com.here.ivi.api.generator.common.java.templates.JavaClassTemplate.generate(javaClass);

    // Assert
    assertEquals(COPYRIGHT_NOTICE + expected, generated.toString());
  }

  @Test
  public void generate_classWithEnum() {
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
            + "  /**\n"
            + "   * Enum comment\n"
            + "   */\n"
            + "  enum ExampleEnum {\n"
            + "      ITEM = 1\n"
            + "  };\n"
            + "}";

    // Act
    CharSequence generated =
        com.here.ivi.api.generator.common.java.templates.JavaClassTemplate.generate(javaClass);

    // Assert
    assertEquals(COPYRIGHT_NOTICE + expected, generated.toString());
  }

  @Test
  public void generate_classWithEnumAndMethods() {
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
            + "  /**\n"
            + "   * Enum comment\n"
            + "   */\n"
            + "  enum ExampleEnum {\n"
            + "      ITEM = 1\n"
            + "  };\n"
            + "  /**\n"
            + "   * Method comment\n"
            + "   */\n"
            + "  native void someMethod();\n"
            + "}";

    // Act
    CharSequence generated =
        com.here.ivi.api.generator.common.java.templates.JavaClassTemplate.generate(javaClass);

    // Assert
    assertEquals(COPYRIGHT_NOTICE + expected, generated.toString());
  }

  @Test
  public void generate_classWithInheritance() {
    // Arrange
    JavaClass javaClass = new JavaClass("ChildClass");
    javaClass.comment = "Child class comment";
    javaClass.inheritance = new JavaInheritance(new JavaCustomType("ParentClass"));
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Child class comment\n"
            + " */\n"
            + "class ChildClass extends ParentClass {\n"
            + "}";

    // Act
    CharSequence generated =
        com.here.ivi.api.generator.common.java.templates.JavaClassTemplate.generate(javaClass);

    // Arrange
    assertEquals(COPYRIGHT_NOTICE + expected, generated.toString());
  }

  @Test
  public void generate_classWithInnerClass() {
    // Arrange
    JavaField intField =
        new JavaField(
            new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intField", new JavaValue("1"));
    JavaClass innerClass = new JavaClass("InnerClass");
    innerClass.comment = "Inner class comment";
    innerClass.fields.add(intField);
    innerClass.visibility = JavaVisibility.PUBLIC;
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
            + "  /**\n"
            + "   * Inner class comment\n"
            + "   */\n"
            + "  public class InnerClass {\n"
            + "    int intField = 1;\n"
            + "  }\n"
            + "}";

    // Act
    CharSequence generated = JavaClassTemplate.generate(javaClass);

    // Arrange
    assertEquals(COPYRIGHT_NOTICE + expected, generated.toString());
  }

  @Test
  public void generate_staticClass() {
    // Arrange
    JavaField intField =
        new JavaField(
            new JavaPrimitiveType(JavaPrimitiveType.Type.INT), "intField", new JavaValue("1"));
    JavaClass innerClass = new JavaClass("StaticInnerClass");
    innerClass.comment = "Inner class comment";
    innerClass.fields.add(intField);
    innerClass.visibility = JavaVisibility.PUBLIC;
    innerClass.qualifiers.add(JavaClass.ClassQualifier.STATIC);
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
            + "  /**\n"
            + "   * Inner class comment\n"
            + "   */\n"
            + "  public static class StaticInnerClass {\n"
            + "    int intField = 1;\n"
            + "  }\n"
            + "}";

    // Act
    CharSequence generated = JavaClassTemplate.generate(javaClass);

    // Assert
    assertEquals(COPYRIGHT_NOTICE + expected, generated.toString());
  }

  @Test
  public void generate_finalClass() {
    // Arrange
    JavaClass javaClass = new JavaClass("ExampleClass");
    javaClass.comment = "Example class comment";
    javaClass.qualifiers.add(JavaClass.ClassQualifier.FINAL);
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "final class ExampleClass {\n"
            + "}";

    // Act
    CharSequence generated = JavaClassTemplate.generate(javaClass);

    // Assert
    assertEquals(COPYRIGHT_NOTICE + expected, generated.toString());
  }
}
