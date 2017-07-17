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
import com.here.ivi.api.model.cppmodel.CppEnum;
import com.here.ivi.api.model.cppmodel.CppEnumItem;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FEnumerator;

public class TypeGenerationHelper {

  public static CppEnum buildCppEnum(FEnumerationType enumerationType) {
    CppEnum enumeration = new CppEnum(CppNameRules.getEnumName(enumerationType.getName()), true);
    enumeration.comment = StubCommentParser.parse(enumerationType).getMainBodyText();

    for (FEnumerator enumerator : enumerationType.getEnumerators()) {
      CppEnumItem item = new CppEnumItem();

      item.name = CppNameRules.getEnumEntryName(enumerator.getName());
      item.value = CppValueMapper.map(enumerator.getValue());
      item.comment = StubCommentParser.parse(enumerator).getMainBodyText();

      enumeration.items.add(item);
    }

    return enumeration;
  }
}
