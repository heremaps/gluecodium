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

import static com.here.ivi.api.generator.android.AndroidGeneratorSuite.CONVERSION_UTILS_HEADER;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.java.JavaClassMapper;
import com.here.ivi.api.generator.common.jni.JniNameRules;
import com.here.ivi.api.generator.common.jni.templates.JniHeaderTemplate;
import com.here.ivi.api.generator.common.jni.templates.JniImplementationTemplate;
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.common.Includes.InternalPublicInclude;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaPackage;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import navigation.BaseApiSpec.InterfacePropertyAccessor;

final class JavaNativeInterfacesGenerator {
  private final List<String> javaPackageList;

  JavaNativeInterfacesGenerator(List<String> javaPackageList) {
    this.javaPackageList = javaPackageList;
  }

  private List<Includes.InternalPublicInclude> getIncludes(
      final Interface<InterfacePropertyAccessor> api, final JavaClass javaClass) {
    Includes.InternalPublicInclude jniHeaderInclude =
        new InternalPublicInclude(JniNameRules.getHeaderFileName(javaClass));
    Includes.InternalPublicInclude baseApiHeaderInclude =
        new InternalPublicInclude(CppNameRules.getHeaderPath(api));
    Includes.InternalPublicInclude conversionUtilsHeaderInclude =
        new InternalPublicInclude(CONVERSION_UTILS_HEADER);

    return Arrays.asList(jniHeaderInclude, baseApiHeaderInclude, conversionUtilsHeaderInclude);
  }

  public List<GeneratedFile> generateFiles(final Interface<InterfacePropertyAccessor> api) {
    List<GeneratedFile> files = new LinkedList<>();

    JavaPackage javaPackage =
        javaPackageList == null || javaPackageList.isEmpty()
            ? JavaPackage.DEFAULT
            : new JavaPackage(javaPackageList);
    JavaClass javaClass = JavaClassMapper.map(api, javaPackage);

    // JNI Header
    files.add(
        new GeneratedFile(
            JniHeaderTemplate.generate(javaClass), JniNameRules.getHeaderFileName(javaClass)));

    // JNI Implementation
    files.add(
        new GeneratedFile(
            JniImplementationTemplate.generate(javaClass, getIncludes(api, javaClass)),
            JniNameRules.getImplementationFileName(javaClass)));

    return files;
  }
}
