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

import com.here.ivi.api.generator.cppstub.StubCommentParser;
import com.here.ivi.api.model.cppmodel.*;
import java.util.logging.Logger;
import org.franca.core.franca.*;

public class TypeGenerationHelper {

  private static final Logger logger =
      java.util.logging.Logger.getLogger(TypeGenerationHelper.class.getName());

  public static CppField buildCppField(
      CppModelAccessor<?> rootType, FField ffield, FFieldInitializer initializer) {

    CppField field = new CppField();
    CppNameRules nameRules = rootType.getRules();
    field.name = nameRules.getFieldName(ffield.getName());
    field.type = CppTypeMapper.map(rootType, ffield);

    // if default values are specified in another object (see DefaultValueRules), use them
    if (initializer == null) {
      field.initializer = CppDefaultInitializer.map(ffield);
    } else {
      field.initializer = CppValueMapper.map(field.type, initializer.getValue(), nameRules);
    }
    return field;
  }

  public static CppConstant buildCppConstant(
      CppModelAccessor<?> rootModel, FConstantDef constantDef) {

    CppConstant constant = new CppConstant();
    constant.type = CppTypeMapper.map(rootModel, constantDef);
    CppNameRules nameRules = rootModel.getRules();
    constant.name = nameRules.getConstantName(constantDef.getName());
    constant.value = CppValueMapper.map(constant.type, constantDef.getRhs(), nameRules);

    return constant;
  }

  public static CppEnumClass buildCppEnumClass(
      CppNameRules nameRules, FEnumerationType enumerationType) {
    CppEnumClass enumClass = new CppEnumClass();
    enumClass.enumeration = buildCppEnum(nameRules, enumerationType);

    return enumClass;
  }

  public static CppEnum buildCppEnum(CppNameRules nameRules, FEnumerationType enumerationType) {
    CppEnum enumeration = new CppEnum();
    enumeration.comment = StubCommentParser.parse(enumerationType).getMainBodyText();
    enumeration.name = nameRules.getEnumName(enumerationType.getName());

    for (FEnumerator enumerator : enumerationType.getEnumerators()) {
      CppEnumItem item = new CppEnumItem();

      item.name = nameRules.getEnumEntryName(enumerator.getName());
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
