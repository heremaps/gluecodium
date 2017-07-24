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

package com.here.ivi.api.generator.common;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.trimou.engine.MustacheEngine;
import org.trimou.engine.MustacheEngineBuilder;
import org.trimou.engine.locator.ClassPathTemplateLocator;
import org.trimou.handlebars.BasicHelper;
import org.trimou.handlebars.Options;

public final class TemplateEngine {

  private static final MustacheEngine ENGINE;

  /**
   * Prefix each line of a multi-line value with a prefix.<br>
   * Usage: {{prefix value "prefix"}}<br>
   * Example: {{prefix comment "// "}}
   */
  private static class PrefixHelper extends BasicHelper {

    @Override
    public void execute(Options options) {
      List<Object> parameters = options.getParameters();
      if (parameters.isEmpty()) {
        return;
      }

      final String prefix = (parameters.size() > 1) ? parameters.get(1).toString() : "";
      final String value = getValue(options, parameters.get(0));
      options.append(
          Arrays.stream(value.split("\n")).map(s -> prefix + s).collect(Collectors.joining("\n")));
    }

    public String getValue(final Options options, final Object dataObject) {
      return dataObject.toString();
    }
  }

  /**
   * Prefix each line of a multi-line partial with a prefix.<br>
   * Usage: {{prefixPartial "partial-name" "prefix"}}<br>
   * Example: {{prefixPartial "common/CopyrightNotice" " // "}}
   */
  private static class PrefixPartialHelper extends PrefixHelper {

    @Override
    public String getValue(final Options options, final Object dataObject) {
      StringBuilder builder = new StringBuilder();
      options.partial(dataObject.toString(), builder);
      return builder.toString();
    }
  }

  static {
    ENGINE =
        MustacheEngineBuilder.newBuilder()
            .addTemplateLocator(new ClassPathTemplateLocator(1, "templates", "mustache"))
            .setProperty("org.trimou.engine.config.skipValueEscaping", true)
            .registerHelper("prefix", new PrefixHelper())
            .registerHelper("prefixPartial", new PrefixPartialHelper())
            .build();
  }

  public static String render(final String templateName, final Object data) {
    return ENGINE.getMustache(templateName).render(data);
  }
}
