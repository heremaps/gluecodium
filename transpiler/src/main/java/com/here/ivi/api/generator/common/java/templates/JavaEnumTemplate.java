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

package com.here.ivi.api.generator.common.java.templates;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.javamodel.JavaElements;
import com.here.ivi.api.model.javamodel.JavaEnum;
import java.time.Year;
import java.util.HashMap;

public final class JavaEnumTemplate {
  private JavaEnumTemplate() {}

  public static String generate(final JavaEnum javaEnum) {
    HashMap<String, Object> data = new HashMap<>();
    data.put("year", Year.now().getValue()); // Copyright template
    // TODO(APIGEN-590): Move this into JavaEnum or parent
    data.put("imports", JavaElements.collectImports(javaEnum));
    data.put("javaEnum", javaEnum);

    return TemplateEngine.render("java/EnumHeader", data);
  }
}
