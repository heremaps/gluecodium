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
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.Interface;
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

  public List<String> getNamespace(FType type) {
    DefinedBy definer = DefinedBy.createFromFModelElement(type);
    List<String> result = definer.getPackages();
    // complex structs are modelled as fidl structs encapsulated in type collections
    // such structs are translated to c++ without the containing type collection but taking its name
    if (!definesStructWithMethods(definer)) {
      result.add(getTypeCollectionName(definer.type));
    }
    return result;
  }

  public String getClassName(FTypeCollection base) {
    return computeClassName(base);
  }

  public String getEnumEntryName(String base) {
    return NameHelper.toUpperCamel(base); // MyEnumEntry
  }

  public String getFieldName(String base) {
    return NameHelper.toLowerCamel(base); // myField
  }

  public String getConstantName(String base) {
    return NameHelper.toUpperCamel(base); // MyConstant
  }

  public String getHeaderPath(FrancaElement<?> francaElement) {
    return "stub"
        + File.separator
        + String.join(File.separator, francaElement.getPackage())
        + File.separator
        + (francaElement instanceof Interface<?>
            ? getClassName(((Interface<?>) francaElement).getFrancaInterface())
            : getTypeCollectionName(francaElement.getFrancaTypeCollection()))
        + getHeaderFileSuffix();
  }

  public List<String> convertPackageToNamespace(List<String> packages) {
    return packages; // keep namespace structure as package structure
  }

  public static String getListenerName(FInterface iface) {
    return computeClassName(iface) + "Listener";
  }

  private static String computeClassName(FTypeCollection base) {
    return NameHelper.toUpperCamel(base.getName()) + "Stub";
  }
}
