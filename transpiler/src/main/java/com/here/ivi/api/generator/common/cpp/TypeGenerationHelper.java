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

import com.here.ivi.api.generator.baseapi.StubCommentParser;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.cppmodel.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.franca.core.franca.*;

public class TypeGenerationHelper {

  private static final Logger logger =
      java.util.logging.Logger.getLogger(TypeGenerationHelper.class.getName());

  /**
   * This methods creates all fields for the given struct.
   *
   * <p>It will use the values assigned to the fields in the defaultInitializer if given to set the
   * default values or fall back to values from the CppDefaultInitializer.
   *
   * @param rootType The type in which the fields will be used. Defines the naming rules and include
   *     paths.
   * @param struct The struct from which the fields are read
   * @param defaultInitializer The default values for all the fields, can be null
   * @return the list of cpp fields
   */
  public static List<CppField> buildCppFields(
      FrancaElement<?> rootType, FStructType struct, FCompoundInitializer defaultInitializer) {

    List<CppField> fields = new ArrayList<>();

    // map matching fields to defaultInitializer constant to speed up lookup below
    Map<FField, FFieldInitializer> initializerLookup = Collections.emptyMap();
    if (defaultInitializer != null) {
      initializerLookup =
          defaultInitializer
              .getElements()
              .stream()
              .collect(Collectors.toMap(FFieldInitializer::getElement, Function.identity()));
    }

    // if no specific defaults are defined, generate fields without any specific default values
    for (FField fieldInfo : struct.getElements()) {
      FFieldInitializer initializerValue = initializerLookup.get(fieldInfo);
      CppField field = TypeGenerationHelper.buildCppField(rootType, fieldInfo, initializerValue);
      field.comment = StubCommentParser.parse(fieldInfo).getMainBodyText();
      fields.add(field);
    }

    return fields;
  }

  public static CppField buildCppField(
      FrancaElement<?> rootType, FField ffield, FFieldInitializer initializer) {

    CppField field = new CppField();
    field.name = CppNameRules.getFieldName(ffield.getName());
    field.type = CppTypeMapper.map(rootType, ffield);

    // if default values are specified in another object (see DefaultValueRules), use them
    if (initializer == null) {
      field.initializer = CppDefaultInitializer.map(ffield);
    } else {
      field.initializer = CppValueMapper.map(field.type, initializer.getValue());
    }
    return field;
  }

  public static CppConstant buildCppConstant(FrancaElement<?> rootModel, FConstantDef constantDef) {

    String name = CppNameRules.getConstantName(constantDef.getName());
    CppType type = CppTypeMapper.map(rootModel, constantDef);
    CppValue value = CppValueMapper.map(type, constantDef.getRhs());

    return new CppConstant(name, type, value);
  }

  public static CppEnumClass buildCppEnumClass(FEnumerationType enumerationType) {
    CppEnumClass enumClass = new CppEnumClass();
    enumClass.enumeration = buildCppEnum(enumerationType);

    return enumClass;
  }

  public static CppEnum buildCppEnum(FEnumerationType enumerationType) {
    CppEnum enumeration = new CppEnum();
    enumeration.comment = StubCommentParser.parse(enumerationType).getMainBodyText();
    enumeration.name = CppNameRules.getEnumName(enumerationType.getName());

    for (FEnumerator enumerator : enumerationType.getEnumerators()) {
      CppEnumItem item = new CppEnumItem();

      item.name = CppNameRules.getEnumEntryName(enumerator.getName());
      item.value = CppValueMapper.map(enumerator.getValue());
      item.comment = StubCommentParser.parse(enumerator).getMainBodyText();

      enumeration.items.add(item);
    }

    if (!enumeration.isValid()) {
      logger.warning("Invalid enum: " + enumerationType.getName());
    }

    return enumeration;
  }
}
