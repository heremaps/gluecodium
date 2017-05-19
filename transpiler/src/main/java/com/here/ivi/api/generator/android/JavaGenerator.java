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
import com.here.ivi.api.generator.common.java.JavaNameRules;
import com.here.ivi.api.generator.common.java.templates.JavaCopyrightHeaderTemplate;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaIncludeResolver;
import com.here.ivi.api.model.javamodel.JavaMethod;
import java.util.LinkedList;
import java.util.List;
import navigation.CppStubSpec;
import navigation.CppStubSpec.InterfacePropertyAccessor;
import org.franca.core.franca.FMethod;

public final class JavaGenerator {
  private final AndroidGeneratorSuite generatorSuite;
  private final JavaIncludeResolver includeResolver;

  JavaGenerator(
      final AndroidGeneratorSuite generatorSuite, final JavaIncludeResolver includeResolver) {
    this.generatorSuite = generatorSuite;
    this.includeResolver = includeResolver;
  }

  public List<GeneratedFile> generateFiles(final Interface<InterfacePropertyAccessor> api) {
    List<GeneratedFile> files = new LinkedList<>();

    JavaClass javaClass = generateClass(api);

    String fileContent = JavaCopyrightHeaderTemplate.generate().toString();

    String fileName =
        JavaNameRules.getFileName(javaClass, AndroidGeneratorSuite.GENERATOR_NAMESPACE);
    files.add(new GeneratedFile(fileContent, fileName));

    return files;
  }

  private JavaClass generateClass(final Interface<CppStubSpec.InterfacePropertyAccessor> api) {
    JavaClass javaClass = new JavaClass(api.getName());

    // TODO(APIGEN-107): Add fields, constants ...

    api.getFrancaInterface()
        .getMethods()
        .forEach(fMethod -> javaClass.methods.add(generateMethod(api, fMethod)));

    return javaClass;
  }

  private JavaMethod generateMethod(
      final Interface<CppStubSpec.InterfacePropertyAccessor> api, final FMethod fMethod) {
    JavaMethod javaMethod = new JavaMethod(fMethod.getName());

    // TODO(APIGEN-107): Add body, return type, parameters, visibility ...

    return javaMethod;
  }
}
