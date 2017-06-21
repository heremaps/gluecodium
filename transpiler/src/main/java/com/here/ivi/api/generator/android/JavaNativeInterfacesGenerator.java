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

package com.here.ivi.api.generator.android;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.java.JavaClassMapper;
import com.here.ivi.api.generator.common.jni.JniNameRules;
import com.here.ivi.api.generator.common.jni.templates.JniHeaderTemplate;
import com.here.ivi.api.generator.common.jni.templates.JniImplementationTemplate;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.Includes.InternalPublicInclude;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import navigation.BaseApiSpec.InterfacePropertyAccessor;

final class JavaNativeInterfacesGenerator {

  private final CppNameRules cppNameRules;

  JavaNativeInterfacesGenerator(CppNameRules cppNameRules) {
    this.cppNameRules = cppNameRules;
  }

  private List<Includes.InternalPublicInclude> getIncludes(
      final Interface<InterfacePropertyAccessor> api,
      final JavaClass javaClass,
      final CppNameRules cppNameRules) {
    Includes.InternalPublicInclude jniHeaderInclude =
        new InternalPublicInclude(JniNameRules.getHeaderFileName(javaClass));
    Includes.InternalPublicInclude baseApiHeaderInclude =
        new InternalPublicInclude(cppNameRules.getHeaderPath(api));

    return Arrays.asList(jniHeaderInclude, baseApiHeaderInclude);
  }

  public List<GeneratedFile> generateFiles(final Interface<InterfacePropertyAccessor> api) {
    List<GeneratedFile> files = new LinkedList<>();

    JavaClass javaClass = JavaClassMapper.map(api);

    // JNI Header
    files.add(
        new GeneratedFile(
            JniHeaderTemplate.generate(javaClass), JniNameRules.getHeaderFileName(javaClass)));

    // JNI Implementation
    files.add(
        new GeneratedFile(
            JniImplementationTemplate.generate(
                javaClass, getIncludes(api, javaClass, cppNameRules)),
            JniNameRules.getImplementationFileName(javaClass)));

    return files;
  }
}
