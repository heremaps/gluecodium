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

package com.here.ivi.api.generator.common.jni.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.android.JavaNativeInterfacesGenerator;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.common.jni.JniModel;
import com.here.ivi.api.generator.common.jni.JniStruct;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class StructConversionHeaderTest {
  private static final String OUTER_CLASS_NAME = "Outer";
  private static final String OUTER_CLASS_NAME2 = "OuterSec";
  private static final String INNER_CLASS_NAME = "Inner";
  private static final List<String> PACKAGES = Arrays.asList("a", "b", "c");

  private static List<Include> createIncludes() {
    return Arrays.asList(
        Include.createInternalInclude("internal"), Include.createSystemInclude("system"));
  }

  private static JniStruct createJniStruct(JniModel jniModel) {
    return new JniStruct(
        jniModel,
        new JavaClass(INNER_CLASS_NAME),
        new CppStruct(INNER_CLASS_NAME),
        Collections.emptyList());
  }

  private static String createJniToCppSignature(JniStruct jniStruct) {
    return TemplateEngine.render("jni/JniToCppStructConversionSignature", jniStruct);
  }

  private static String createCppToJniSignature(JniStruct jniStruct) {
    return TemplateEngine.render("jni/CppToJniStructConversionSignature", jniStruct);
  }

  private static JniModel createModel(String outerClassName) {
    JniModel jniModel =
        new JniModel(outerClassName, PACKAGES, new JavaClass(outerClassName), PACKAGES);
    jniModel.structs.add(createJniStruct(jniModel));

    return jniModel;
  }

  @Test
  public void generateWithZeroModelsZeroIncludes() {

    //arrange

    Map<String, List<?>> mustacheData = new HashMap<>();
    mustacheData.put(JavaNativeInterfacesGenerator.INCLUDES_NAME, new LinkedList<>());
    mustacheData.put(JavaNativeInterfacesGenerator.MODELS_NAME, Collections.emptyList());

    //act
    String result = TemplateEngine.render("jni/StructConversionHeader", mustacheData);

    //assert
    String expected =
        "#pragma once\n"
            + "\n"
            + "#include <jni.h>\n"
            + "\n"
            + "namespace here {\n"
            + "namespace internal {\n"
            + "\n"
            + "}\n"
            + "}\n";

    assertEquals(expected, result);
  }

  @Test
  public void generateWithOneModelAndIncludes() {

    //arrange
    List<Include> includes = createIncludes();
    JniModel model = createModel(OUTER_CLASS_NAME);

    Map<String, List<?>> mustacheData = new HashMap<>();
    mustacheData.put(JavaNativeInterfacesGenerator.INCLUDES_NAME, includes);
    mustacheData.put(JavaNativeInterfacesGenerator.MODELS_NAME, Collections.singletonList(model));

    //act
    String result = TemplateEngine.render("jni/StructConversionHeader", mustacheData);

    //assert
    String expected =
        "#pragma once\n"
            + "\n"
            + "#include <jni.h>\n"
            + "#include <"
            + includes.get(0).fileName
            + ">\n"
            + "#include <"
            + includes.get(1).fileName
            + ">\n"
            + "\n"
            + "namespace here {\n"
            + "namespace internal {\n"
            + "\n    "
            + createJniToCppSignature(createJniStruct(model))
            + ";\n\n    "
            + createCppToJniSignature(createJniStruct(model))
            + ";\n\n"
            + "}\n"
            + "}\n";

    assertEquals(expected, result);
  }

  @Test
  public void generateWithTwoModelAndIncludes() {

    //arrange
    List<Include> includes = createIncludes();
    JniModel model = createModel(OUTER_CLASS_NAME);
    JniModel model2 = createModel(OUTER_CLASS_NAME2);

    Map<String, List<?>> mustacheData = new HashMap<>();
    mustacheData.put(JavaNativeInterfacesGenerator.INCLUDES_NAME, includes);
    mustacheData.put(JavaNativeInterfacesGenerator.MODELS_NAME, Arrays.asList(model, model2));

    //act
    String result = TemplateEngine.render("jni/StructConversionHeader", mustacheData);

    //assert
    String expected =
        "#pragma once\n"
            + "\n"
            + "#include <jni.h>\n"
            + "#include <"
            + includes.get(0).fileName
            + ">\n"
            + "#include <"
            + includes.get(1).fileName
            + ">\n"
            + "\n"
            + "namespace here {\n"
            + "namespace internal {\n"
            + "\n    "
            + createJniToCppSignature(createJniStruct(model))
            + ";\n\n    "
            + createCppToJniSignature(createJniStruct(model))
            + ";\n\n    "
            + createJniToCppSignature(createJniStruct(model2))
            + ";\n\n    "
            + createCppToJniSignature(createJniStruct(model2))
            + ";\n\n"
            + "}\n"
            + "}\n";

    assertEquals(expected, result);
  }
}
