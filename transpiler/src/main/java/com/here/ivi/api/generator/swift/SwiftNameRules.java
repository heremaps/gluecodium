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

package com.here.ivi.api.generator.swift;

import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.UNDERSCORE_DELIMITER;

import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.swift.SwiftType;
import java.io.File;
import org.franca.core.franca.*;

public final class SwiftNameRules {

  private static final String TARGET_DIRECTORY = "swift" + File.separator;

  private SwiftNameRules() {}

  public static String getImplementationFileName(final FTypeCollection francaTypeCollection) {
    return TARGET_DIRECTORY
        + String.join(File.separator, DefinedBy.getPackages(francaTypeCollection))
        + File.separator
        + getFileName(francaTypeCollection)
        + ".swift";
  }

  private static String getFileName(final FTypeCollection francaTypeCollection) {
    if (francaTypeCollection instanceof FInterface) {
      return SwiftNameRules.computeClassName(francaTypeCollection);
    } else {
      return getTypeCollectionName(francaTypeCollection);
    }
  }

  public static String getMethodName(final FMethod method) {
    return method.getName();
  }

  public static String getParameterName(final FArgument argument) {
    return argument.getName();
  }

  public static String getClassName(final FTypeCollection base) {
    return SwiftNameRules.computeClassName(base);
  }

  public static String getClassName(final String string) {
    return NameHelper.toUpperCamelCase(string);
  }

  public static String getStructName(final String structName) {
    return NameHelper.toUpperCamelCase(structName);
  }

  public static String getFieldName(final String fieldName) {
    return NameHelper.toLowerCamelCase(fieldName);
  }

  public static String getTypeCollectionName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }

  public static String computeClassName(final FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName());
  }

  public static String getEnumTypeName(FModelElement francaEnumerator) {
    return NameHelper.toUpperCamelCase(francaEnumerator.getName());
  }

  public static String getEnumItemName(FEnumerator francaEnumerator) {
    return NameHelper.toLowerCamelCase(francaEnumerator.getName());
  }

  public static String getPropertyName(FAttribute name) {
    return NameHelper.toLowerCamelCase(name.getName());
  }

  public static String getAccessorBaseName(FAttribute attribute) {
    return CBridgeNameRules.fullyQualifiedName(
        CBridgeNameRules.getNestedNameSpecifier(attribute),
        NameHelper.toLowerCamelCase(attribute.getName()),
        UNDERSCORE_DELIMITER);
  }

  public static String getPropertySetterName(String accessorBaseName) {
    return accessorBaseName + "_set";
  }

  public static String getPropertyGetterName(String accessorBaseName) {
    return accessorBaseName + "_get";
  }

  public static String getArrayName(SwiftType innerType) {
    String name =
        (innerType.implementingClass != null) ? innerType.implementingClass : innerType.name;
    name = SwiftNameRules.getClassName(name.replace("_", ""));
    return name + "List";
  }
}
