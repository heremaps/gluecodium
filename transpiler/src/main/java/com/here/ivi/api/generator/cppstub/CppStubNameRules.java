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

package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.generator.common.cpp.CppDefaultNameRules;
import com.here.ivi.api.model.*;
import java.io.File;
import java.util.List;
import navigation.CppStubSpec;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;

public class CppStubNameRules extends CppDefaultNameRules {

  public CppStubNameRules(
      FrancaModel<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor>
          model) {
    super(model);
  }

  public List<String> namespace(FType type) {
    DefinedBy definer = DefinedBy.getDefinedBy(type);
    List<String> result = definer.getPackages();
    // complex structs are modelled as fidl structs encapsulated in type collections
    // such structs are translated to c++ without the containing type collection but taking its name
    if (!definesStructWithMethods(definer)) {
      result.add(typeCollectionName(definer.type));
    }
    return result;
  }

  public String className(FTypeCollection base) {
    return getClassName(base);
  }

  public String enumEntryName(String base) {
    return NameHelper.toUpperCamel(base); // MyEnumEntry
  }

  public String fieldName(String base) {
    return NameHelper.toLowerCamel(base); // myField
  }

  public String constantName(String base) {
    return NameHelper.toUpperCamel(base); // MyConstant
  }

  public String typeCollectionTarget(List<String> directories, TypeCollection<?> tc) {
    return "stub"
        + File.separator
        + String.join(File.separator, directories)
        + File.separator
        + typeCollectionName(tc.getFrancaTypeCollection())
        + headerFileSuffix();
  }

  public String interfaceTarget(List<String> directories, Interface<?> iface) {
    return "stub"
        + File.separator
        + String.join(File.separator, directories)
        + File.separator
        + className(iface.getFrancaInterface())
        + headerFileSuffix();
  }

  public List<String> packageToDirectoryStructure(List<String> packages) {
    return packages; // keep directory structure as package structure
  }

  public List<String> packageToNamespace(List<String> packages) {
    return packages; // keep namespace structure as package structure
  }

  public static String listenerName(FInterface iface) {
    return getClassName(iface) + "Listener";
  }

  private static String getClassName(FTypeCollection base) {
    return NameHelper.toUpperCamel(base.getName()) + "Stub";
  }
}
