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
import com.here.ivi.api.generator.common.java.JavaNameRules;
import com.here.ivi.api.generator.common.java.templates.JavaClassTemplate;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaPackage;
import java.util.LinkedList;
import java.util.List;
import navigation.BaseApiSpec.InterfacePropertyAccessor;

final class JavaGenerator {
  private final List<String> javaPackageList;

  JavaGenerator(List<String> javaPackageList) {
    this.javaPackageList = javaPackageList;
  }

  public List<GeneratedFile> generateFiles(final Interface<InterfacePropertyAccessor> api) {
    List<GeneratedFile> files = new LinkedList<>();

    JavaPackage javaPackage =
        javaPackageList == null || javaPackageList.isEmpty()
            ? JavaPackage.DEFAULT
            : new JavaPackage(javaPackageList);
    JavaClass javaClass = JavaClassMapper.map(api, javaPackage);

    CharSequence fileContent = JavaClassTemplate.generate(javaClass);
    String fileName = JavaNameRules.getFileName(javaClass);

    files.add(new GeneratedFile(fileContent, fileName));

    return files;
  }
}
