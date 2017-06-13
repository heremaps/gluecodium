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
import com.here.ivi.api.generator.common.java.templates.JavaCopyrightHeaderTemplate;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.javamodel.JavaClass;
import java.util.LinkedList;
import java.util.List;
import navigation.BaseApiSpec.InterfacePropertyAccessor;

final class JavaGenerator {
  private final AndroidGeneratorSuite generatorSuite;

  JavaGenerator(final AndroidGeneratorSuite generatorSuite) {
    this.generatorSuite = generatorSuite;
  }

  public List<GeneratedFile> generateFiles(final Interface<InterfacePropertyAccessor> api) {
    List<GeneratedFile> files = new LinkedList<>();

    JavaClass javaClass = JavaClassMapper.map(api);

    String fileContent = JavaCopyrightHeaderTemplate.generate().toString();

    String fileName = JavaNameRules.getFileName(javaClass);
    files.add(new GeneratedFile(fileContent, fileName));

    return files;
  }
}
