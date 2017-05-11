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

package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.templates.GeneratorNoticeTemplate;
import com.here.ivi.api.generator.common.templates.MethodBodyTemplate;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.cppmodel.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class CppGeneratorHelper {

  static Logger logger = java.util.logging.Logger.getLogger(CppGeneratorHelper.class.getName());

  public static CharSequence generateGeneratorNotice(
      GeneratorSuite suite, FrancaElement<?> element, String outputTarget) {
    String inputFile;
    try {
      inputFile = suite.getTool().resolveRelativeToRootPath(element.getModel().getPath());
    } catch (IOException e) {
      throw new TranspilerExecutionException(
          String.format("Could not resolve input file %s.", element.getModel().getPath()));
    }

    String inputDefinition = element.getName() + ':' + element.getVersion();
    return GeneratorNoticeTemplate.generate(suite, inputDefinition, inputFile, outputTarget);
  }

  public static CppMethod generateDtor(String className, MethodBodyTemplate mbt) {
    CppMethod dtor = new CppMethod();
    dtor.name = "~" + className;
    dtor.mbt = mbt;
    dtor.returnType = CppType.None;
    dtor.specifiers.add(CppMethod.Specifier.VIRTUAL);
    return dtor;
  }

  public static CppMethod generateEmptyCtor(String className, MethodBodyTemplate mbt) {
    CppMethod ctor = new CppMethod();
    ctor.mbt = mbt;
    ctor.name = className;
    ctor.returnType = CppType.None;
    return ctor;
  }

  public static CppMethod generateCopyCtor(String className, MethodBodyTemplate mbt) {
    CppMethod ctor = new CppMethod();
    ctor.mbt = mbt;
    ctor.name = className;
    ctor.returnType = CppType.None;
    ctor.inParameters.add(generateClassParam(className));
    return ctor;
  }

  public static CppMethod generateAssignOp(String className, MethodBodyTemplate mbt) {
    CppMethod ctor = new CppMethod();
    ctor.mbt = mbt;
    ctor.name = "operator=";
    ctor.returnType = new CppType(className + "&"); //TODO ugly ref here...
    ctor.inParameters.add(generateClassParam(className));
    return ctor;
  }

  private static CppParameter generateClassParam(String className) {
    CppParameter other = new CppParameter();
    other.name = "other";
    other.type = new CppType(null, className, CppElements.TypeInfo.Complex);
    other.mode = CppParameter.Mode.Input;
    return other;
  }

  public static List<CppNamespace> packageToCppNamespace(List<String> packages) {
    List<CppNamespace> namespaces = new ArrayList<>();
    CppNamespace parentNs = null;
    for (String p : packages) {
      CppNamespace newNs = new CppNamespace(p);
      if (parentNs != null) {
        parentNs.members.add(newNs);
      }
      namespaces.add(newNs);
      parentNs = newNs;
    }

    return namespaces;
  }
}
