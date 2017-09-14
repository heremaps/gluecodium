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
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

public class CBridgeNameRules {

  public static final String SOURCE_FOLDER = "cbridge";
  private static final String INTERNAL_SOURCE_FOLDER = "cbridge_internal";

  private static final String CPP_NAMESPACE_DELIMITER = "::";
  private static final String UNDERSCORE_DELIMITER = "_";

  public String getHeaderFileNameWithPath(final FrancaElement francaElement) {
    return Paths.get(
            getPublicDirectoryName(francaElement.getPackageNames()),
            getHeaderFileName(getName(francaElement)))
        .toString();
  }

  public String getPrivateHeaderFileNameWithPath(final FrancaElement francaElement) {
    return Paths.get(
            getPrivateDirectoryName(francaElement.getPackageNames()),
            getPrivateHeaderFileName(getName(francaElement)))
        .toString();
  }

  public String getImplementationFileNameWithPath(final FrancaElement francaElement) {
    return Paths.get(
            getPublicDirectoryName(francaElement.getPackageNames()),
            getImplementationFileName(getName(francaElement)))
        .toString();
  }

  private String getHeaderFileName(final String elementName) {
    return elementName + ".h";
  }

  private String getPrivateHeaderFileName(final String elementName) {
    return elementName + "Impl.h";
  }

  private String getImplementationFileName(final String elementName) {
    return elementName + ".cpp";
  }

  private String getDirectoryName(final List<String> packages, final String rootFolder) {
    return Paths.get(rootFolder, packages.toArray(new String[packages.size()])).toString();
  }

  private String getPublicDirectoryName(final List<String> packages) {
    return getDirectoryName(packages, SOURCE_FOLDER);
  }

  private String getPrivateDirectoryName(final List<String> packages) {
    return getDirectoryName(packages, INTERNAL_SOURCE_FOLDER);
  }

  private String getName(final FrancaElement francaElement) {
    return NameHelper.toUpperCamelCase(francaElement.getName());
  }

  public String getFunctionTableName(FInterface francaInterface) {
    return String.join(UNDERSCORE_DELIMITER, getNestedNameSpecifier(francaInterface))
        + "_FunctionTable";
  }

  public String getDelegateMethodName(final FMethod method) {
    return fullyQualifiedName(
        CppNameRules.getNestedNameSpecifier(method),
        CppNameRules.getMethodName(method.getName()),
        CPP_NAMESPACE_DELIMITER);
  }

  public String getMethodName(final FMethod method) {
    List<String> nestedNameSpecifier = getNestedNameSpecifier(method);
    nestedNameSpecifier.add(NameHelper.toLowerCamelCase(method.getName()));
    return String.join(UNDERSCORE_DELIMITER, nestedNameSpecifier);
  }

  public String getStructRefType(final FModelElement francaStruct) {
    return getStructBaseName(francaStruct) + "Ref";
  }

  public String getStructBaseName(final FModelElement francaStruct) {
    return fullyQualifiedName(
        getNestedNameSpecifier(francaStruct),
        NameHelper.toUpperCamelCase(francaStruct.getName()),
        UNDERSCORE_DELIMITER);
  }

  public String getBaseApiInstanceName(final FModelElement francaModel) {
    return String.join(CPP_NAMESPACE_DELIMITER, getNestedNameSpecifier(francaModel));
  }

  public String getBaseApiStructName(FModelElement struct) {
    return fullyQualifiedName(
        CppNameRules.getNestedNameSpecifier(struct),
        CppNameRules.getStructName(struct.getName()),
        CPP_NAMESPACE_DELIMITER);
  }

  private static String fullyQualifiedName(
      List<String> nameSpecifier, String name, String delimiter) {
    List<String> names = new LinkedList<>(nameSpecifier);
    names.add(name);
    return String.join(delimiter, names);
  }

  public List<String> getNestedNameSpecifier(EObject type) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(type);
    List<String> result = DefinedBy.getPackages(typeCollection);
    result.add(NameHelper.toUpperCamelCase(typeCollection.getName()));

    return result;
  }
}
