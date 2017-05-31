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

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import java.util.List;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;

//TODO this interface should be split into filename-related and identifier-related interfaces
//see: APIGEN-106

public interface CppNameRules {

  /** Returns the cpp getNamespace of given type */
  List<String> getNamespace(FType type);

  /** Returns the cpp getNamespace of given definedBy */
  List<String> getNamespace(DefinedBy definer);

  /** Returns the cpp getNamespace of given ModelAccessor */
  List<String> getNamespace(CppModelAccessor<?> modelAccesor);

  /** Returns the cpp typename of given type */
  String getCppTypename(FType type);

  /** Formats a name as a group of types and constants */
  String getTypeCollectionName(FTypeCollection base);

  /** Formats a name as a class */
  String getClassName(FTypeCollection base);

  /** Formats a name as a method */
  String getMethodName(String base);

  /** Formats a name as a argument */
  String getArgumentName(String base);

  /** Formats a name as a constant */
  String getConstantName(String base);

  /** Formats a name as a enum */
  String getEnumName(String base);

  /** Formats a name as a enum entry */
  String getEnumEntryName(String base);

  /** Formats a name as a field */
  String getFieldName(String base);

  /** Formats a name as a struct */
  String getStructName(String base);

  /** Formats a name as a typedef */
  String getTypedefName(String base);

  /** Returns the name to use for header files (.h/.hpp) */
  String getHeaderFileSuffix();

  /** Returns the path of belonging header file */
  String getHeaderPath(FrancaElement<?> francaElement);

  /** Returns the path for converter methods */
  String getConversionHeaderPath(FrancaElement<?> tc);
}
