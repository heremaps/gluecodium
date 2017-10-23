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
import com.here.ivi.api.model.franca.FrancaElement;
import java.nio.file.Paths;
import java.util.LinkedList;
import java.util.List;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

public final class CBridgeNameRules {

  public static final String SOURCE_FOLDER = "cbridge";
  private static final String INTERNAL_SOURCE_FOLDER = "cbridge_internal";

  private static final String CPP_NAMESPACE_DELIMITER = "::";
  private static final String UNDERSCORE_DELIMITER = "_";

  private CBridgeNameRules() {}

  public static String getHeaderFileNameWithPath(final FrancaElement francaElement) {
    return Paths.get(
            getPublicDirectoryName(francaElement.getPackageNames()),
            getHeaderFileName(getName(francaElement)))
        .toString();
  }

  public static String getPrivateHeaderFileNameWithPath(final FrancaElement francaElement) {
    return Paths.get(
            getPrivateDirectoryName(francaElement.getPackageNames()),
            getPrivateHeaderFileName(getName(francaElement)))
        .toString();
  }

  public static String getImplementationFileNameWithPath(final FrancaElement francaElement) {
    return Paths.get(
            getPublicDirectoryName(francaElement.getPackageNames()),
            getImplementationFileName(getName(francaElement)))
        .toString();
  }

  private static String getHeaderFileName(final String elementName) {
    return elementName + ".h";
  }

  private static String getPrivateHeaderFileName(final String elementName) {
    return elementName + "Impl.h";
  }

  private static String getImplementationFileName(final String elementName) {
    return elementName + ".cpp";
  }

  private static String getDirectoryName(final List<String> packages, final String rootFolder) {
    return Paths.get(rootFolder, packages.toArray(new String[packages.size()])).toString();
  }

  private static String getPublicDirectoryName(final List<String> packages) {
    return getDirectoryName(packages, SOURCE_FOLDER);
  }

  private static String getPrivateDirectoryName(final List<String> packages) {
    return getDirectoryName(packages, INTERNAL_SOURCE_FOLDER);
  }

  private static String getName(final FrancaElement francaElement) {
    return NameHelper.toUpperCamelCase(francaElement.getName());
  }

  public static String getFunctionTableName(FInterface francaInterface) {
    return getInterfaceName(francaInterface) + "_FunctionTable";
  }

  public static String getInterfaceName(FInterface francaInterface) {
    return String.join(UNDERSCORE_DELIMITER, getNestedNameSpecifier(francaInterface));
  }

  public static String getDelegateMethodName(final FMethod method) {
    return fullyQualifiedName(
        CppNameRules.getNestedNameSpecifier(method),
        CppNameRules.getMethodName(method.getName()),
        CPP_NAMESPACE_DELIMITER);
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

  private static String fullyQualifiedName(
      List<String> nameSpecifier, String name, String delimiter) {
    List<String> names = new LinkedList<>(nameSpecifier);
    names.add(name);
    return String.join(delimiter, names);
  }

  public static List<String> getNestedNameSpecifier(EObject type) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(type);
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

  public static String getAtrributeGetterName(FAttribute attribute) {
    List<String> nestedNameSpecifier = getNestedNameSpecifier(attribute);
    nestedNameSpecifier.add(NameHelper.toLowerCamelCase(attribute.getName()));
    nestedNameSpecifier.add("get");
    return String.join(UNDERSCORE_DELIMITER, nestedNameSpecifier);
  }

  public static String getAtrributeSetterName(FAttribute attribute) {
    List<String> nestedNameSpecifier = getNestedNameSpecifier(attribute);
    nestedNameSpecifier.add(NameHelper.toLowerCamelCase(attribute.getName()));
    nestedNameSpecifier.add("set");
    return String.join(UNDERSCORE_DELIMITER, nestedNameSpecifier);
  }
}
