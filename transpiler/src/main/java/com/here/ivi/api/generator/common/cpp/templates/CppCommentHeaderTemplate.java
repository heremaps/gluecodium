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

package com.here.ivi.api.generator.common.cpp.templates;

import com.here.ivi.api.generator.common.TemplateEngine;
import java.time.Year;
import java.util.HashMap;
import java.util.Map;

public class CppCommentHeaderTemplate {

  public static String generate(final CharSequence generatorNotice) {
    Map<String, Object> dataObject = new HashMap<>();
    dataObject.put("year", Year.now().getValue());
    dataObject.put("generatorNotice", generatorNotice);
    return TemplateEngine.render("cpp/CppCommentHeader", dataObject);
  }
}
