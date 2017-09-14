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
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniStruct;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaClassSignaturePrefixTest {
  private static JavaClass innerClass = new JavaClass("MyInnerClass");
  private static CppStruct innerStruct = new CppStruct("MyInnerStruct");

  private static JniContainer createTypeCollectionModel() {
    List<String> packageNames = Arrays.asList("from", "a");
    return JniContainer.createTypeCollectionContainer(packageNames, packageNames);
  }

  private static JniContainer createInterfaceModel() {
    final String className = "MyClass";
    List<String> packageNames = Arrays.asList("from", "a", "fancypackage");
    return JniContainer.createInterfaceContainer(packageNames, packageNames, className, className);
  }

  private static JniStruct createJniStruct(JniContainer jniContainer) {
    return new JniStruct(jniContainer, innerClass, innerStruct, Collections.emptyList());
  }

  @Test
  public void generateFromInterface() {
    JniStruct jniStruct = createJniStruct(createInterfaceModel());

    String generated = TemplateEngine.render("jni/JavaClassSignaturePrefix", jniStruct);

    assertEquals("from/a/fancypackage/MyClass$", generated);
  }

  @Test
  public void generateFromTypeCollection() {
    JniStruct jniStruct = createJniStruct(createTypeCollectionModel());

    String generated = TemplateEngine.render("jni/JavaClassSignaturePrefix", jniStruct);

    assertEquals("from/a/", generated);
  }
}
