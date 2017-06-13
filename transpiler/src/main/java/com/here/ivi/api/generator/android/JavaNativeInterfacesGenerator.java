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
import com.here.ivi.api.generator.common.java.JavaClassMapper;
import com.here.ivi.api.generator.common.jni.JavaNativeInterfacesNameRules;
import com.here.ivi.api.generator.common.jni.templates.JavaNativeInterfacesHeaderTemplate;
import com.here.ivi.api.generator.common.jni.templates.JavaNativeInterfacesImplementationTemplate;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.LinkedList;
import java.util.List;
import navigation.BaseApiSpec.InterfacePropertyAccessor;

final class JavaNativeInterfacesGenerator {

  JavaNativeInterfacesGenerator() {}

  public List<GeneratedFile> generateFiles(final Interface<InterfacePropertyAccessor> api) {
    List<GeneratedFile> files = new LinkedList<>();

    JavaClass javaClass = JavaClassMapper.map(api);

    // JNI Header
    files.add(
        new GeneratedFile(
            JavaNativeInterfacesHeaderTemplate.generate(javaClass).toString(),
            JavaNativeInterfacesNameRules.getHeaderFileName(javaClass)));

    // JNI Implementation
    files.add(
        new GeneratedFile(
            JavaNativeInterfacesImplementationTemplate.generate(javaClass).toString(),
            JavaNativeInterfacesNameRules.getImplementationFileName(javaClass)));

    return files;
  }
}
