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
import com.here.ivi.api.model.javamodel.JavaMethod.MethodQualifier;
import com.here.ivi.api.model.javamodel.JavaTopLevelElement.Qualifier;
import java.util.Arrays;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
@SuppressWarnings("MethodName")
public final class JavaClassTemplateTest {

  private static final String TEMPLATE_NAME = "java/ClassHeader";

  private static final String TEST_COPYRIGHT_HEADER =
      TemplateEngine.render("java/CopyrightHeader", null) + "\n";

  private final JavaClass javaClass = new JavaClass("ExampleClass");
  private final JavaCustomType javaInterface = new JavaCustomType("Face", JavaPackage.DEFAULT);

  @Test
  public void generate_minimal() {
    // Arrange
    JavaClass resultClass = new JavaClass("ExampleClass");
    resultClass.comment = "Example class comment";
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "class ExampleClass {\n"
            + "}\n";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, resultClass);

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
            + "}\n";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withEnum() {
    // Arrange
    JavaEnumItem enumItem = new JavaEnumItem("ITEM", new JavaValue("0"));
    JavaEnum classEnum = new JavaEnum("ExampleEnum");
    classEnum.items.add(enumItem);
    classEnum.comment = "Enum comment";
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
            + "        ITEM(0);\n"
            + "\n"
            + "        public final int value;\n"
            + "\n"
            + "        ExampleEnum(final int value) {\n"
            + "            this.value = value;\n"
            + "        }\n"
            + "    }\n"
            + "}\n";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withEnumAndMethods() {
    // Arrange
    JavaMethod classMethod = new JavaMethod("someMethod", JavaPrimitiveType.VOID);
    classMethod.qualifiers.add(JavaMethod.MethodQualifier.NATIVE);
    classMethod.comment = "Method comment";
    JavaEnumItem enumItem = new JavaEnumItem("ITEM", new JavaValue("0"));
    JavaEnum classEnum = new JavaEnum("ExampleEnum");
    classEnum.items.add(enumItem);
    classEnum.comment = "Enum comment";
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
            + "        ITEM(0);\n"
            + "\n"
            + "        public final int value;\n"
            + "\n"
            + "        ExampleEnum(final int value) {\n"
            + "            this.value = value;\n"
            + "        }\n"
            + "    }\n"
            + "    /**\n"
            + "     * Method comment\n"
            + "     */\n"
            + "    native void someMethod();\n"
            + "}\n";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withInheritance() {
    // Arrange
    JavaClass resultClass = new JavaClass("ExampleClass");
    resultClass.comment = "Child class comment";
    resultClass.extendedClass = new JavaCustomType("ParentClass", JavaPackage.DEFAULT);
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "import com.here.android.ParentClass;\n\n"
            + "/**\n"
            + " * Child class comment\n"
            + " */\n"
            + "class ExampleClass extends ParentClass {\n"
            + "}\n";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, resultClass);

    // Arrange
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withInnerClass() {
    // Arrange
    JavaField intField = new JavaField(JavaPrimitiveType.INT, "intField", new JavaValue("1"));
    JavaClass innerClass = new JavaClass("InnerClass");
    innerClass.comment = "Inner class comment";
    innerClass.fields.add(intField);
    innerClass.visibility = JavaVisibility.PROTECTED;
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
            + "}\n";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Arrange
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_staticInnerClass() {
    // Arrange
    JavaField intField = new JavaField(JavaPrimitiveType.INT, "intField", new JavaValue("1"));
    JavaClass innerClass = new JavaClass("StaticInnerClass");
    innerClass.comment = "Inner class comment";
    innerClass.fields.add(intField);
    innerClass.visibility = JavaVisibility.PUBLIC;
    innerClass.qualifiers.add(Qualifier.STATIC);
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
            + "}\n";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_finalClassWithConstant() {
    // Arrange
    javaClass.comment = "Example class comment";
    javaClass.qualifiers.add(Qualifier.FINAL);
    javaClass.constants.add(
        new JavaConstant(JavaPrimitiveType.FLOAT, "myConst", new JavaValue("42")));
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "final class ExampleClass {\n"
            + "    static final float myConst = 42;\n"
            + "}\n";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withImports() {
    // Arrange
    JavaCustomType javaCustomType = new JavaCustomType("Foo");
    JavaField fieldWithImports =
        new JavaField(javaCustomType, "someField", new JavaValue(javaCustomType));
    fieldWithImports.type.imports.add(
        new JavaImport("Foo", new JavaPackage(Arrays.asList("com", "example"))));
    javaClass.qualifiers.add(Qualifier.FINAL);
    javaClass.fields.add(fieldWithImports);
    String expected =
        "package com.here.android;\n"
            + "\n"
            + "import com.example.Foo;\n"
            + "\n"
            + "final class ExampleClass {\n"
            + "    Foo someField = new Foo();\n"
            + "}\n";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_extendsNativeBase() {
    // Arrange
    javaClass.comment = "Example class comment";
    javaClass.extendedClass = JavaClass.NATIVE_BASE;

    String expected =
        "package com.here.android;\n"
            + "\n"
            + "import com.here.android.NativeBase;\n\n"
            + "/**\n"
            + " * Example class comment\n"
            + " */\n"
            + "class ExampleClass extends NativeBase {\n"
            + "    protected ExampleClass(final long nativeHandle) {\n"
            + "        super(nativeHandle, new Disposer() {\n"
            + "            @Override\n"
            + "            public void disposeNative(long handle) {\n"
            + "                disposeNativeHandle(handle);\n"
            + "            }\n"
            + "        });\n"
            + "    }\n\n"
            + "    private static native void disposeNativeHandle(long nativeHandle);\n"
            + "}\n";
    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generateClassWithOneParentInterface() {
    // Arrange
    javaClass.parentInterfaces.add(javaInterface);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    String expected =
        "package com.here.android;\n\n" + "class ExampleClass implements Face {\n" + "}\n";
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generateClassWithTwoParentInterfaces() {
    // Arrange
    javaClass.parentInterfaces.add(javaInterface);
    javaClass.parentInterfaces.add(new JavaCustomType("Legs", JavaPackage.DEFAULT));

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    String expected =
        "package com.here.android;\n\n" + "class ExampleClass implements Face, Legs {\n" + "}\n";
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generateClassWithParentClassAndParentInterface() {
    // Arrange
    javaClass.extendedClass = new JavaCustomType("Parent", JavaPackage.DEFAULT);
    javaClass.parentInterfaces.add(javaInterface);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    String expected =
        "package com.here.android;\n\n"
            + "import com.here.android.Parent;\n\n"
            + "class ExampleClass extends Parent implements Face {\n"
            + "}\n";
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }
}
