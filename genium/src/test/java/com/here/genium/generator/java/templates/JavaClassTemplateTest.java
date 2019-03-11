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
import com.here.genium.model.java.JavaMethod.MethodQualifier;
import com.here.genium.model.java.JavaTopLevelElement.Qualifier;
import java.util.Arrays;
import java.util.Collections;
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
        "package com.example;\n"
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
    JavaMethod classMethod = JavaMethod.builder("someMethod").returnType(exampleType).build();
    classMethod.qualifiers.add(MethodQualifier.NATIVE);
    classMethod.visibility = JavaVisibility.PRIVATE;
    classMethod.parameters.add(parameter);
    classMethod.comment = "Method comment";
    javaClass.javaPackage = new JavaPackage(Arrays.asList("com", "test", "generator"));
    javaClass.comment = "Example class comment";
    javaClass.methods.add(classMethod);
    javaClass.visibility = JavaVisibility.PUBLIC;

    String expected =
        "package com.test.generator;\n"
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
    javaClass.javaPackage = new JavaPackage(Arrays.asList("com", "example", "enums"));
    javaClass.comment = "Example class comment";
    javaClass.enums.add(classEnum);
    String expected =
        "package com.example.enums;\n"
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
    JavaMethod classMethod = JavaMethod.builder("someMethod").build();
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
        "package com.example;\n"
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
    JavaType extendedClass =
        new JavaCustomType("ParentClass", new JavaPackage(Collections.singletonList("foo")));
    JavaClass resultClass = JavaClass.builder("ExampleClass").extendedClass(extendedClass).build();
    resultClass.comment = "Child class comment";
    String expected =
        "package com.example;\n"
            + "\n"
            + "import foo.ParentClass;\n\n"
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
    JavaField intField =
        JavaField.builder("intField", JavaPrimitiveType.INT).initial(new JavaValue("1")).build();
    JavaClass innerClass = new JavaClass("InnerClass");
    innerClass.comment = "Inner class comment";
    innerClass.fields.add(intField);
    innerClass.visibility = JavaVisibility.PROTECTED;
    javaClass.comment = "Example class comment";
    javaClass.visibility = JavaVisibility.PUBLIC;
    javaClass.innerClasses.add(innerClass);
    String expected =
        "package com.example;\n"
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
            + "        public InnerClass() {}\n"
            + "\n"
            + "        public InnerClass(int intField) {\n"
            + "            this.intField = intField;\n"
            + "        }\n"
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
    JavaField intField =
        JavaField.builder("intField", JavaPrimitiveType.INT).initial(new JavaValue("1")).build();
    JavaClass innerClass = new JavaClass("StaticInnerClass");
    innerClass.comment = "Inner class comment";
    innerClass.fields.add(intField);
    innerClass.visibility = JavaVisibility.PUBLIC;
    innerClass.qualifiers.add(Qualifier.STATIC);
    javaClass.comment = "Example class comment";
    javaClass.visibility = JavaVisibility.PACKAGE;
    javaClass.innerClasses.add(innerClass);
    String expected =
        "package com.example;\n"
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
            + "        public StaticInnerClass() {}\n"
            + "\n"
            + "        public StaticInnerClass(int intField) {\n"
            + "            this.intField = intField;\n"
            + "        }\n"
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
        "package com.example;\n"
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
        JavaField.builder("someField", javaCustomType)
            .initial(new JavaValue(javaCustomType))
            .build();
    fieldWithImports.type.imports.add(
        new JavaImport("Foo", new JavaPackage(Arrays.asList("com", "test"))));
    javaClass.qualifiers.add(Qualifier.FINAL);
    javaClass.fields.add(fieldWithImports);
    String expected =
        "package com.example;\n"
            + "\n"
            + "import com.test.Foo;\n"
            + "\n"
            + "final class ExampleClass {\n"
            + "    Foo someField = new Foo();\n"
            + "    public ExampleClass() {}\n"
            + "\n"
            + "    public ExampleClass(Foo someField) {\n"
            + "        this.someField = someField;\n"
            + "    }\n"
            + "}\n";

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_implClass() {
    // Arrange
    JavaType extendedClass =
        new JavaCustomType("ParentClass", new JavaPackage(Collections.singletonList("foo")));
    JavaClass javaImplClass =
        JavaClass.builder("ExampleClass").extendedClass(extendedClass).isImplClass(true).build();

    String expected =
        "package com.example;\n\n"
            + "import foo.ParentClass;\n\n"
            + "class ExampleClass extends ParentClass {\n"
            + "    protected ExampleClass(final long nativeHandle) {\n"
            + "        super(nativeHandle);\n"
            + "    }\n"
            + "}\n";
    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaImplClass);

    // Assert
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_implClassExtendsNativeBase() {
    // Arrange
    JavaType nativeBase =
        new JavaCustomType("NativeBase", new JavaPackage(Collections.singletonList("bar")));
    JavaClass javaImplClass =
        JavaClass.builder("ExampleClass")
            .extendedClass(nativeBase)
            .isImplClass(true)
            .needsDisposer(true)
            .build();
    javaImplClass.javaPackage = new JavaPackage(Collections.singletonList("foo"));

    String expected =
        "package foo;\n\n"
            + "import bar.NativeBase;\n\n"
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
    String generated = TemplateEngine.render(TEMPLATE_NAME, javaImplClass);

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
    String expected = "package com.example;\n\n" + "class ExampleClass implements Face {\n" + "}\n";
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
        "package com.example;\n\n" + "class ExampleClass implements Face, Legs {\n" + "}\n";
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generateClassWithParentClassAndParentInterface() {
    // Arrange
    JavaType extendedClass =
        new JavaCustomType("Parent", new JavaPackage(Collections.singletonList("foo")));
    JavaClass resultClass = JavaClass.builder("ExampleClass").extendedClass(extendedClass).build();
    resultClass.parentInterfaces.add(javaInterface);

    // Act
    String generated = TemplateEngine.render(TEMPLATE_NAME, resultClass);

    // Assert
    String expected =
        "package com.example;\n\n"
            + "import foo.Parent;\n\n"
            + "class ExampleClass extends Parent implements Face {\n"
            + "}\n";
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }

  @Test
  public void generate_withThrowsMethod() {
    JavaPackage javaPackage = new JavaPackage(Arrays.asList("com", "test", "generator"));
    JavaCustomType exampleType = new JavaCustomType("ExampleType");
    JavaMethod classMethod =
        JavaMethod.builder("someMethod")
            .returnType(exampleType)
            .exception(new JavaCustomType("ExceptionalException", JavaPackage.DEFAULT))
            .build();
    javaClass.javaPackage = javaPackage;
    javaClass.methods.add(classMethod);

    String generated = TemplateEngine.render(TEMPLATE_NAME, javaClass);

    String expected =
        "package com.test.generator;\n\n"
            + "import com.example.ExceptionalException;\n\n"
            + "class ExampleClass {\n"
            + "    ExampleType someMethod() throws ExceptionalException;\n"
            + "}\n";
    assertEquals(TEST_COPYRIGHT_HEADER + expected, generated);
  }
}
