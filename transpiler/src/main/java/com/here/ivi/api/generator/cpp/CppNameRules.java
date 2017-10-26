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

package com.here.ivi.api.generator.cpp;

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.rules.InstanceRules;
import java.io.File;
import java.util.List;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FCompoundType;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;

public final class CppNameRules {

  public static final String HEADER_FILE_SUFFIX = ".h";
  public static final String IMPLEMENTATION_FILE_SUFFIX = ".cpp";

  private CppNameRules() {}

  public static String getMethodName(String base) {
    return NameHelper.toLowerCamelCase(base); // doStuff
  }

  public static String getGetterName(String base) {
    return "get" + NameHelper.toUpperCamelCase(base);
  }

  public static String getSetterName(String base) {
    return "set" + NameHelper.toUpperCamelCase(base);
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

  public static List<String> getNestedNameSpecifier(EObject type) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(type);
    List<String> result = DefinedBy.getPackages(typeCollection);
    // special type for types defined in interfaces ...
    if (typeCollection instanceof FInterface) {
      result.add(getClassName(typeCollection.getName()));
    }

    return result;
  }

  private static String getFullyQualifiedName(List<String> nestedNameSpecifier, String name) {
    return nestedNameSpecifier.isEmpty()
        ? "::" + name
        : "::" + String.join("::", nestedNameSpecifier) + (name.isEmpty() ? "" : "::" + name);
  }

  public static String getConstantFullyQualifiedName(FConstantDef francaConstant) {
    List<String> nestedNameSpecifier = getNestedNameSpecifier(francaConstant);
    String constantName = getConstantName(francaConstant.getName());

    return getFullyQualifiedName(nestedNameSpecifier, constantName);
  }

  public static String getFullyQualifiedName(FType type) {
    List<String> nestedNameSpecifier = getNestedNameSpecifier(type);
    String typeName = "";

    if (type instanceof FCompoundType) {
      FCompoundType compoundType = (FCompoundType) type;
      typeName = getStructName(compoundType.getName());
    } else if (type instanceof FEnumerationType) {
      FEnumerationType enumeration = (FEnumerationType) type;
      typeName = getEnumName(enumeration.getName());
    } else if (type instanceof FTypeDef) {
      FTypeDef typedef = (FTypeDef) type;
      if (!InstanceRules.isInstanceId(typedef)) {
        typeName = getTypedefName(typedef.getName());
      }
    } else if (type instanceof FConstantDef) {
      FConstantDef constantDef = (FConstantDef) type;
      typeName = getConstantName(constantDef.getName());
    }

    return getFullyQualifiedName(nestedNameSpecifier, typeName);
  }

  public static String getClassName(String typeCollectionName) {
    return NameHelper.toUpperCamelCase(typeCollectionName);
  }

  public static String getEnumEntryName(String base) {
    return NameHelper.toUpperSnakeCase(base); // MY_ENUM_ENTRY
  }

  public static String getFieldName(String base) {
    return NameHelper.toLowerCamelCase(base); // myField
  }

  public static String getConstantName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyConstant
  }

  public static String getHeaderPath(final FrancaElement francaElement) {
    return getOutputFilePath(francaElement) + HEADER_FILE_SUFFIX;
  }

  public static String getOutputFilePath(final FrancaElement francaElement) {
    return String.join(File.separator, francaElement.getPackageNames())
        + File.separator
        + (francaElement instanceof Interface
            ? getClassName(francaElement.getFrancaTypeCollection().getName())
            : francaElement.getFrancaTypeCollection().getName());
  }
}
