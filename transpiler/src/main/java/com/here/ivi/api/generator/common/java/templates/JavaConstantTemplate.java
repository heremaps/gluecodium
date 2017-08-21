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
import com.here.ivi.api.generator.common.java.JavaCommentFormatter;
import com.here.ivi.api.model.javamodel.JavaConstant;
import java.util.HashMap;

public final class JavaConstantTemplate {
  private JavaConstantTemplate() {}

  public static String generate(final JavaConstant javaConstant) {
    String accessModifier = javaConstant.visibility.toAccessModifier();

    HashMap<String, Object> data = new HashMap<>();
    data.put("comment", JavaCommentFormatter.format(javaConstant.comment));
    if (!accessModifier.isEmpty()) {
      data.put("accessModifier", accessModifier);
    }
    data.put("type", javaConstant.type.name);
    data.put("name", javaConstant.name);
    data.put("value", javaConstant.value.name);

    return TemplateEngine.render("java/Constant", data);
  }
}
