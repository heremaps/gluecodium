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
import com.here.ivi.api.model.FrancaModel;
import java.util.Optional;
import navigation.CppStubSpec;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;

public abstract class CppDefaultNameRules implements CppNameRules {

  private FrancaModel<?, ?> model;

  public CppDefaultNameRules(FrancaModel<?, ?> model) {
    this.model = model;
  }

  protected boolean definesStructWithMethods(DefinedBy definer) {
    Optional<? extends CppStubSpec.IDataPropertyAccessor> accessor =
        model.find(definer).map(FrancaElement::getPropertyAccessor);

    if (!accessor.isPresent()) {
      throw new RuntimeException("Could not find accessor. Invalid franca definition. " + definer);
    }
    try {
      //complex structs are defined exclusively inside type collections ...
      return accessor.get() instanceof CppStubSpec.TypeCollectionPropertyAccessor
          && accessor.get().getIsStructDefinition(definer.type);
    } catch (NullPointerException e) {
      //property is optional, if not set this could cause a null pointer exception
      return false;
    }
  }

  public String getCppTypename(FType type) {
    DefinedBy definer = DefinedBy.createFromFModelElement(type);
    // complex structs are modelled as fidl structs encapsulated in type collections
    // such structs are translated to c++ without the containing type collection but taking its name
    return definesStructWithMethods(definer) && type instanceof FStructType
        ? definer.type.getName()
        : type.getName();
  }

  public String getTypeCollectionName(FTypeCollection base) {
    return NameHelper.toUpperCamelCase(base.getName()); // MyTypeCollection
  }

  public String getMethodName(String base) {
    return NameHelper.toLowerCamelCase(base); // doStuff
  }

  public String getArgumentName(String base) {
    return NameHelper.toLowerCamelCase(base); // myArg
  }

  public String getEnumName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyEnum
  }

  public String getStructName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyStruct
  }

  public String getTypedefName(String base) {
    return NameHelper.toUpperCamelCase(base); // MyTypedef
  }

  public String getHeaderFileSuffix() {
    return ".h";
  }
}
