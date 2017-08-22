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
import com.here.ivi.api.model.javamodel.JavaInheritance;
import java.util.HashMap;

// TODO: Kill while porting JavaClassTemplate
public final class JavaInheritanceTemplate {
  private JavaInheritanceTemplate() {}

  /**
   * Generates extendedInterface for an interface
   *
   * @param baseClass set of interface extendedInterface
   */
  public static String generate(final JavaInheritance baseClass) {
    HashMap<String, Object> data = new HashMap<>();
    data.put("base", baseClass);

    return TemplateEngine.render("java/Extends", data);
  }
}
