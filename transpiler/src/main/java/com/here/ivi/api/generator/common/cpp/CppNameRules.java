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
import java.io.File;
import java.util.List;
import org.franca.core.franca.FType;

public final class CppNameRules {
  private CppNameRules() {}

  public static String getCppTypename(String baseName) {
    return baseName;
  }

  public static String getTypeCollectionName(String typeCollectionName) {
    return NameHelper.toUpperCamelCase(typeCollectionName); // MyTypeCollection
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
    result.add(getTypeCollectionName(definer.type.getName()));
    return result;
  }

  public static List<String> getNamespace(DefinedBy definer) {
    return definer.getPackages();
  }

  public static String getClassName(String typeCollectionName) {
    return NameHelper.toUpperCamelCase(typeCollectionName) + "Stub";
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
            ? getClassName(((Interface<?>) francaElement).getFrancaInterface().getName())
            : getTypeCollectionName(francaElement.getFrancaTypeCollection().getName()))
        + getHeaderFileSuffix();
  }

  public static String getListenerName(String interfaceName) {
    return (NameHelper.toUpperCamelCase(interfaceName) + "Stub") + "Listener";
  }
}
