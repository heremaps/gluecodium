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

package com.here.ivi.api.generator.cbridge;

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.model.franca.DefinedBy;
import java.io.File;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.*;

public final class CBridgeNameRules {
  public static final String CBRIDGE_PUBLIC = "cbridge";
  public static final String CBRIDGE_INTERNAL = "cbridge_internal";
  public static final String INCLUDE_DIR = "include";
  public static final String SRC_DIR = "src";

  public static final String UNDERSCORE_DELIMITER = "_";
  private static final String CPP_NAMESPACE_DELIMITER = "::";
  private static final String PUBLIC_HEADER_SUFFIX = ".h";
  private static final String PRIVATE_HEADER_SUFFIX = "Impl.h";
  private static final String IMPL_SUFFIX = ".cpp";

  private CBridgeNameRules() {}

  public static String getHeaderFileNameWithPath(final FTypeCollection francaTypeCollection) {
    return getPathComponents(
        francaTypeCollection, CBRIDGE_PUBLIC, INCLUDE_DIR, PUBLIC_HEADER_SUFFIX);
  }

  public static String getPrivateHeaderFileNameWithPath(
      final FTypeCollection francaTypeCollection) {
    return getPathComponents(
        francaTypeCollection, CBRIDGE_INTERNAL, INCLUDE_DIR, PRIVATE_HEADER_SUFFIX);
  }

  public static String getImplementationFileNameWithPath(
      final FTypeCollection francaTypeCollection) {
    return getPathComponents(francaTypeCollection, CBRIDGE_PUBLIC, SRC_DIR, IMPL_SUFFIX);
  }

  private static String getPathComponents(
      final FTypeCollection francaTypeCollection,
      final String prefix,
      final String subfolder,
      final String suffix) {
    ArrayList<String> pathComponents = new ArrayList<>();
    pathComponents.add(prefix);
    pathComponents.add(subfolder);
    pathComponents.addAll(DefinedBy.getPackages(francaTypeCollection));
    pathComponents.add(getName(francaTypeCollection) + suffix);
    return String.join(File.separator, pathComponents);
  }

  private static String getName(final FTypeCollection francaTypeCollection) {
    return NameHelper.toUpperCamelCase(francaTypeCollection.getName());
  }

  public static String getFunctionTableName(FInterface francaInterface) {
    return getInterfaceName(francaInterface) + "_FunctionTable";
  }

  public static String getInterfaceName(FInterface francaInterface) {
    return String.join(UNDERSCORE_DELIMITER, getNestedNameSpecifier(francaInterface));
  }

  public static String getMethodName(final FMethod method) {
    List<String> nestedNameSpecifier = getNestedNameSpecifier(method);
    nestedNameSpecifier.add(NameHelper.toLowerCamelCase(method.getName()));
    if (method.getSelector() != null && !method.getSelector().isEmpty()) {
      nestedNameSpecifier.add(method.getSelector());
    }
    return String.join(UNDERSCORE_DELIMITER, nestedNameSpecifier);
  }

  public static String getStructRefType(final FModelElement francaStruct) {
    return getStructBaseName(francaStruct) + "Ref";
  }

  public static String getStructBaseName(final FModelElement francaStruct) {
    return fullyQualifiedName(
        getNestedNameSpecifier(francaStruct),
        NameHelper.toUpperCamelCase(francaStruct.getName()),
        UNDERSCORE_DELIMITER);
  }

  public static String getInstanceRefType(final FModelElement francaModel) {
    return String.join(UNDERSCORE_DELIMITER, getNestedNameSpecifier(francaModel)) + "Ref";
  }

  public static String getBaseApiInstanceName(final FModelElement francaModel) {
    return String.join(CPP_NAMESPACE_DELIMITER, getNestedNameSpecifier(francaModel));
  }

  public static String getBaseApiStructName(FModelElement struct) {
    return fullyQualifiedName(
        CppNameRules.getNestedNameSpecifier(struct),
        CppNameRules.getStructName(struct.getName()),
        CPP_NAMESPACE_DELIMITER);
  }

  public static String getBaseApiEnumName(FEnumerationType francaEnum) {
    return fullyQualifiedName(
        CppNameRules.getNestedNameSpecifier(francaEnum),
        CppNameRules.getEnumName(francaEnum.getName()),
        CPP_NAMESPACE_DELIMITER);
  }

  public static String fullyQualifiedName(
      List<String> nameSpecifier, String name, String delimiter) {
    List<String> names = new LinkedList<>(nameSpecifier);
    names.add(name);
    return String.join(delimiter, names);
  }

  public static List<String> getNestedNameSpecifier(final FModelElement modelElement) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(modelElement);
    List<String> result = DefinedBy.getPackages(typeCollection);
    result.add(NameHelper.toUpperCamelCase(typeCollection.getName()));

    return result;
  }

  public static String getEnumItemName(FEnumerator francaEnumItem) {
    return fullyQualifiedName(
        getNestedNameSpecifier(francaEnumItem),
        francaEnumItem.getName().toLowerCase(),
        UNDERSCORE_DELIMITER);
  }

  public static String getEnumName(FModelElement francaEnumerator) {
    return fullyQualifiedName(
        getNestedNameSpecifier(francaEnumerator),
        NameHelper.toUpperCamelCase(francaEnumerator.getName()),
        UNDERSCORE_DELIMITER);
  }

  public static String getBaseApiCall(
      final CppTypeInfo.TypeCategory category, final String baseAPIName) {
    switch (category) {
      case CLASS:
        return "std::shared_ptr<" + baseAPIName + ">";
      case STRUCT:
        return baseAPIName;
    }
    return null;
  }

  public static String getBaseApiName(
      final FModelElement elementType, final CppTypeInfo.TypeCategory category) {
    switch (category) {
      case CLASS:
        return CBridgeNameRules.getBaseApiInstanceName(elementType);
      case STRUCT:
        return CBridgeNameRules.getBaseApiStructName(elementType);
    }
    return null;
  }

  public static String getHandleName(
      final FModelElement elementType, final CppTypeInfo.TypeCategory category) {
    switch (category) {
      case CLASS:
        return CBridgeNameRules.getInstanceRefType(elementType);
      case STRUCT:
        return CBridgeNameRules.getStructRefType(elementType);
    }
    return null;
  }
}
