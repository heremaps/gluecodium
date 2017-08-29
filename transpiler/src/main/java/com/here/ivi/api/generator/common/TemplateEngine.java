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

import com.google.common.annotations.VisibleForTesting;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import org.trimou.engine.MustacheEngine;
import org.trimou.engine.MustacheEngineBuilder;
import org.trimou.engine.locator.ClassPathTemplateLocator;
import org.trimou.handlebars.BasicHelper;
import org.trimou.handlebars.BasicSectionHelper;
import org.trimou.handlebars.HelpersBuilder;
import org.trimou.handlebars.Options;

public final class TemplateEngine {

  private static final MustacheEngine ENGINE;

  /**
   * Prefix each line of a multi-line value with a prefix.<br>
   * Usage: {{prefix value "prefix"}}<br>
   * Example: {{prefix comment "// "}}
   */
  @VisibleForTesting
  static class PrefixHelper extends BasicHelper {

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

    protected String getValue(final Options options, final Object dataObject) {
      if (dataObject != null) {
        return dataObject.toString();
      } else {
        return "";
      }
    }
  }

  /**
   * Prefix each line of a multi-line partial with a prefix.<br>
   * Usage: {{prefixPartial "partial-name" "prefix"}}<br>
   * Example: {{prefixPartial "common/CopyrightNotice" " // "}}
   */
  @VisibleForTesting
  static class PrefixPartialHelper extends PrefixHelper {

    @Override
    protected String getValue(final Options options, final Object dataObject) {
      StringBuilder builder = new StringBuilder();
      options.partial(dataObject.toString(), builder);
      return builder.toString();
    }
  }

  /**
   * Apply a partial to each value in an Iterable and join the results with a separator.<br>
   * Usage: {{joinPartial iterable "partial-name" "separator"}}<br>
   * Example: {{joinPartial parameters "cpp/CppMethodParameter" ", "}}
   */
  @VisibleForTesting
  static class JoinPartialHelper extends BasicHelper {

    @Override
    public void execute(Options options) {
      List<Object> parameters = options.getParameters();
      if (parameters.size() < 2) {
        return;
      }

      final Object value = parameters.get(0);
      final String partialName = parameters.get(1).toString();
      final String separator = (parameters.size() > 2) ? parameters.get(2).toString() : "";

      if (value instanceof Iterable<?>) {
        Iterator<?> iterator = ((Iterable<?>) value).iterator();
        while (iterator.hasNext()) {
          applyPartial(options, partialName, iterator.next());
          if (iterator.hasNext()) {
            options.append(separator);
          }
        }
      } else {
        applyPartial(options, partialName, value);
      }
    }

    private static void applyPartial(
        final Options options, final String partialName, final Object dataObject) {
      options.push(dataObject);
      options.partial(partialName);
      options.pop();
    }
  }

  /**
   * Execute a block if the class name of the value equals the given string<br>
   * Usage: {{#instanceOf value "className"}}...{{/instanceOf}}<br>
   * Example: {{#instanceOf this "CppTaggedUnion"}}...{{/instanceOf}}
   */
  @VisibleForTesting
  static class InstanceOfHelper extends BasicSectionHelper {

    @Override
    public void execute(Options options) {
      List<Object> parameters = options.getParameters();
      if (parameters.size() < 2) {
        return;
      }

      Object object = parameters.get(0);
      String className = parameters.get(1).toString();
      if (object.getClass().getName().endsWith(className)) {
        options.fn();
      }
    }
  }

  static {
    ENGINE =
        MustacheEngineBuilder.newBuilder()
            .addTemplateLocator(new ClassPathTemplateLocator(1, "templates", "mustache"))
            .setProperty("org.trimou.engine.config.skipValueEscaping", true)
            .registerHelper("prefix", new PrefixHelper())
            .registerHelper("prefixPartial", new PrefixPartialHelper())
            .registerHelper("joinPartial", new JoinPartialHelper())
            .registerHelper("instanceOf", new InstanceOfHelper())
            .registerHelpers(
                HelpersBuilder.empty().addJoin().addInclude().addFmt().addSet().build())
            .build();
  }

  public static String render(final String templateName, final Object data) {
    return ENGINE.getMustache(templateName).render(data);
  }
}
