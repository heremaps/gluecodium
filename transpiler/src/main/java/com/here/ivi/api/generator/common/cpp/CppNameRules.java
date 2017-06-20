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

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import java.io.File;
import java.util.List;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;

public final class CppNameRules {
  private CppNameRules() {}

  public static String getCppTypename(FType type) {
    return type.getName();
  }

  public static String getTypeCollectionName(FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName()); // MyTypeCollection
  }

  public static String getMethodName(String base) {
    return NameHelper.toLowerCamelCase(base); // doStuff
  }

  public static String getArgumentName(String base) {
    return NameHelper.toLowerCamelCase(base); // myArg
  }

  public static String getEnumName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyEnum
  }

  public static String getStructName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyStruct
  }

  public static String getTypedefName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyTypedef
  }

  public static String getHeaderFileSuffix() {
    return ".h";
  }

  public static List<String> getNamespace(FType type) {
    DefinedBy definer = DefinedBy.createFromFModelElement(type);
    List<String> result = getNamespace(definer);
    result.add(getTypeCollectionName(definer.type));
    return result;
  }

  public static List<String> getNamespace(DefinedBy definer) {
    return definer.getPackages();
  }

  //this looks redundant in current revision, but it is required for APIGEN-42
  //in short: for converter generation it is required to generate multiple cpp types
  //out of one fidl definition
  //see: APIGEN-42 & APIGEN-110
  public static List<String> getNamespace(CppModelAccessor<?> modelAccessor) {
    return getNamespace(modelAccessor.getDefiner());
  }

  public static String getClassName(FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName()) + "Stub";
  }

  public static String getEnumEntryName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyEnumEntry
  }

  public static String getFieldName(String base) {
    return NameHelper.toLowerCamelCase(base); // myField
  }

  public static String getConstantName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyConstant
  }

  public static String getHeaderPath(FrancaElement<?> francaElement) {
    return "stub"
        + File.separator
        + String.join(File.separator, francaElement.getPackage())
        + File.separator
        + (francaElement instanceof Interface<?>
            ? getClassName(((Interface<?>) francaElement).getFrancaInterface())
            : getTypeCollectionName(francaElement.getFrancaTypeCollection()))
        + getHeaderFileSuffix();
  }

  public static String getListenerName(FInterface iface) {
    return (NameHelper.toUpperCamelCase(iface.getName()) + "Stub") + "Listener";
  }
}
