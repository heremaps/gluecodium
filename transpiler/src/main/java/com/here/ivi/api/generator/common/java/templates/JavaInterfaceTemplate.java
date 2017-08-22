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
import com.here.ivi.api.model.javamodel.JavaInterface;
import java.time.Year;
import java.util.HashMap;

public final class JavaInterfaceTemplate {
  private JavaInterfaceTemplate() {}

  public static String generate(final JavaInterface javaInterface) {
    HashMap<String, Object> data = new HashMap<>();
    data.put("year", Year.now().getValue()); // Copyright template
    data.put("javaPackage", javaInterface.javaPackage);
    data.put("comment", javaInterface.comment); // DocComment template
    data.put("name", javaInterface.name);
    data.put("extendedInterface", javaInterface.extendedInterface);
    // TODO: Move this into JavaInterface:
    data.put("imports", JavaElements.collectImports(javaInterface));
    data.put("methods", javaInterface.methods);

    return TemplateEngine.render("java/Interface", data);
  }
}
