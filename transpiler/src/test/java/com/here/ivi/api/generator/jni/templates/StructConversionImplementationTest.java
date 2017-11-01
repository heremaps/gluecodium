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

package com.here.ivi.api.generator.jni.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.jni.JniGenerator;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniStruct;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class StructConversionImplementationTest {
  private static final String OUTER_CLASS_NAME = "Outer";
  private static final String OUTER_CLASS_NAME2 = "OuterSec";
  private static final String INNER_CLASS_NAME = "Inner";
  private static final List<String> PACKAGES = Arrays.asList("a", "b", "c");

  private static List<Include> createIncludes() {
    return Arrays.asList(
        Include.createInternalInclude("internal"), Include.createSystemInclude("system"));
  }

  private static JniStruct createJniStruct() {
    return new JniStruct(
        new JavaClass(INNER_CLASS_NAME), new CppStruct(INNER_CLASS_NAME), Collections.emptyList());
  }

  private static String createJniToCppSignature(JniStruct jniStruct) {
    return TemplateEngine.render("jni/JniToCppStructConversionSignature", jniStruct);
  }

  private static String createJniToCppBody(JniStruct jniStruct) {
    return TemplateEngine.render("jni/JniToCppStructConversionBody", jniStruct);
  }

  private static String createCppToJniSignature(JniStruct jniStruct) {
    return TemplateEngine.render("jni/CppToJniStructConversionSignature", jniStruct);
  }

  private static String createCppToJniBody(JniStruct jniStruct) {
    return TemplateEngine.render("jni/CppToJniStructConversionBody", jniStruct);
  }

  private static JniContainer createJniContainer(String outerClassName) {
    JniContainer jniContainer =
        JniContainer.createInterfaceContainer(PACKAGES, PACKAGES, outerClassName, outerClassName);
    jniContainer.add(createJniStruct());

    return jniContainer;
  }

  @Test
  public void generateWithZeroModelsZeroIncludes() {

    //arrange

    Map<String, List<?>> mustacheData = new HashMap<>();
    mustacheData.put(JniGenerator.INCLUDES_NAME, new LinkedList<>());
    mustacheData.put(JniGenerator.MODELS_NAME, Collections.emptyList());

    //act
    String result = TemplateEngine.render("jni/StructConversionImplementation", mustacheData);

    //assert
    String expected =
        "#include \"android/jni/ArrayConversionUtils.h\"\n\n"
            + "namespace here {\n"
            + "namespace internal {\n"
            + "\n\n"
            + "}\n"
            + "}";

    assertEquals(expected, result);
  }

  @Test
  public void generateWithOneModelAndIncludes() {

    //arrange
    List<Include> includes = createIncludes();

    JniContainer jniContainer = createJniContainer(OUTER_CLASS_NAME);
    JniStruct struct = jniContainer.structs.get(0);

    Map<String, List<?>> mustacheData = new HashMap<>();
    mustacheData.put(JniGenerator.INCLUDES_NAME, includes);
    mustacheData.put(JniGenerator.MODELS_NAME, Collections.singletonList(jniContainer));

    //act
    String result = TemplateEngine.render("jni/StructConversionImplementation", mustacheData);

    //assert
    String expected =
        "#include <"
            + includes.get(0).fileName
            + ">\n"
            + "#include <"
            + includes.get(1).fileName
            + ">\n"
            + "#include \"android/jni/ArrayConversionUtils.h\"\n"
            + "\n"
            + "namespace here {\n"
            + "namespace internal {\n"
            + "\n"
            + createJniToCppSignature(struct)
            + createJniToCppBody(struct)
            + "\n"
            + createCppToJniSignature(struct)
            + createCppToJniBody(struct)
            + "\n\n"
            + "}\n"
            + "}";

    assertEquals(expected, result);
  }

  @Test
  public void generateWithTwoModelAndIncludes() {

    //arrange
    List<Include> includes = createIncludes();

    JniContainer container = createJniContainer(OUTER_CLASS_NAME);
    JniStruct struct = container.structs.get(0);

    JniContainer container2 = createJniContainer(OUTER_CLASS_NAME2);
    JniStruct struct2 = container2.structs.get(0);

    Map<String, List<?>> mustacheData = new HashMap<>();
    mustacheData.put(JniGenerator.INCLUDES_NAME, includes);
    mustacheData.put(JniGenerator.MODELS_NAME, Arrays.asList(container, container2));

    //act
    String result = TemplateEngine.render("jni/StructConversionImplementation", mustacheData);

    //assert
    String expected =
        "#include <"
            + includes.get(0).fileName
            + ">\n"
            + "#include <"
            + includes.get(1).fileName
            + ">\n"
            + "#include \"android/jni/ArrayConversionUtils.h\"\n"
            + "\n"
            + "namespace here {\n"
            + "namespace internal {\n"
            + "\n"
            + createJniToCppSignature(struct)
            + createJniToCppBody(struct)
            + "\n"
            + createCppToJniSignature(struct)
            + createCppToJniBody(struct)
            + "\n"
            + createJniToCppSignature(struct2)
            + createJniToCppBody(struct2)
            + "\n"
            + createCppToJniSignature(struct2)
            + createCppToJniBody(struct2)
            + "\n\n"
            + "}\n"
            + "}";

    assertEquals(expected, result);
  }
}
