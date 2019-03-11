/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.common;

import com.google.common.annotations.VisibleForTesting;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import org.trimou.engine.MustacheEngine;
import org.trimou.engine.MustacheEngineBuilder;
import org.trimou.engine.locator.ClassPathTemplateLocator;
import org.trimou.engine.resolver.AbstractResolver;
import org.trimou.engine.resolver.ResolutionContext;
import org.trimou.engine.resolver.Resolver;
import org.trimou.handlebars.BasicHelper;
import org.trimou.handlebars.BasicSectionHelper;
import org.trimou.handlebars.HelpersBuilder;
import org.trimou.handlebars.Options;
import org.trimou.handlebars.SwitchHelper;

public final class TemplateEngine {

  private static final MustacheEngine ENGINE;

  private static boolean copyrightHeaderInitialized;

  /**
   * Prefix each line of a multi-line value with a prefix. Trim each line at the end to avoid
   * trailing whitespace.<br>
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
          Arrays.stream(value.split("\n"))
              .map(s -> (prefix + s).replaceAll("\\s+$", ""))
              .collect(Collectors.joining("\n")));
    }

    protected String getValue(final Options options, final Object dataObject) {
      return (dataObject != null) ? dataObject.toString() : "";
    }
  }

  /**
   * Prefix each line of a multi-line partial with a prefix. Trim each line at the end to avoid
   * trailing whitespace.<br>
   * Usage: {{prefixPartial "partial-name" "prefix"}}<br>
   * Example: {{prefixPartial "common/CopyrightNotice" "// "}}
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
   * Capitalize value of a given String.<br>
   * Example: {{capitalize "someString"}}
   */
  @VisibleForTesting
  static class CapitalizeHelper extends BasicHelper {
    @Override
    public void execute(Options options) {
      List<Object> parameters = options.getParameters();
      if (parameters.isEmpty()) {
        return;
      }
      final String value = getValue(parameters.get(0));
      options.append(
          String.valueOf(value.charAt(0)).toUpperCase() + value.substring(1, value.length()));
    }

    private String getValue(final Object dataObject) {
      return (dataObject != null) ? dataObject.toString() : "";
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
   * instanceOf: execute a block if the class name of the value equals the given string<br>
   * Usage: {{#instanceOf value "className"}}...{{/instanceOf}}<br>
   * Example: {{#instanceOf this "CppStruct"}}...{{/instanceOf}}<br>
   * notInstanceOf: execute a block if the class name of the value is not equal to the given string
   * <br>
   * Usage: {{#notInstanceOf value "className"}}...{{/notInstanceOf}}<br>
   * Example: {{#notInstanceOf this "CppStruct"}}...{{/notInstanceOf}} *
   */
  @VisibleForTesting
  static class InstanceOfHelper extends BasicSectionHelper {

    private final boolean equality;

    InstanceOfHelper(final boolean equality) {
      super();
      this.equality = equality;
    }

    @Override
    public void execute(Options options) {
      List<Object> parameters = options.getParameters();
      if (parameters.size() < 2) {
        return;
      }

      Object object = parameters.get(0);
      String className = parameters.get(1).toString();
      if (object.getClass().getName().endsWith(className) == equality) {
        options.fn();
      }
    }
  }

  /**
   * Resolves "copyrightHeader" keyword into the copyright header contents.<br>
   * Will be used in general prefixed with a prefix corresponding to the prefix for comments in the
   * target language. Example: {{prefix copyrightHeader "// "}}
   */
  @VisibleForTesting
  static class CopyrightHeaderResolver extends AbstractResolver {

    private static String copyrightHeaderContents;

    public static final String TAG_COPYRIGHT_HEADER = "copyrightHeader";

    CopyrightHeaderResolver() {
      super(Resolver.DEFAULT_PRIORITY);
    }

    @Override
    public Object resolve(Object contextObject, String name, ResolutionContext context) {

      if (TAG_COPYRIGHT_HEADER.equals(name)) {
        return copyrightHeaderContents;
      }

      return null;
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
            .registerHelper("instanceOf", new InstanceOfHelper(true))
            .registerHelper("notInstanceOf", new InstanceOfHelper(false))
            .registerHelper("capitalize", new CapitalizeHelper())
            .registerHelper("switch", new NiceSwitchHelper())
            .registerHelper("case", new SwitchHelper.CaseHelper(true))
            .registerHelper("default", new SwitchHelper.DefaultHelper())
            .registerHelpers(
                HelpersBuilder.empty()
                    .addIsEqual()
                    .addFmt()
                    .addInclude()
                    .addIsNotEqual()
                    .addJoin()
                    .addSet()
                    .build())
            .addResolver(new CopyrightHeaderResolver())
            .build();
  }

  public static void initCopyrightHeaderContents(String contents) {
    if (!copyrightHeaderInitialized) {
      CopyrightHeaderResolver.copyrightHeaderContents = contents;
      copyrightHeaderInitialized = true;
    }
  }

  public static String render(final String templateName, final Object data) {

    return ENGINE.getMustache(templateName).render(data);
  }
}
