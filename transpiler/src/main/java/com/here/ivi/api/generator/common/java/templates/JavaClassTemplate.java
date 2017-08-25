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
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaElements;
import java.time.Year;
import java.util.HashMap;

public final class JavaClassTemplate {
  private JavaClassTemplate() {}

  public static String generate(final JavaClass javaClass) {
    HashMap<String, Object> data = new HashMap<>();
    data.put("year", Year.now().getValue()); // Copyright template
    // TODO(APIGEN-590): Move this into JavaClass
    data.put("imports", JavaElements.collectImports(javaClass));
    data.put("javaClass", javaClass);

    return TemplateEngine.render("java/ClassHeader", data);
  }
}
