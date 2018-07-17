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

package com.here.genium.generator.common.templates;

import org.trimou.engine.MustacheEngine;
import org.trimou.engine.MustacheEngineBuilder;
import org.trimou.engine.locator.ClassPathTemplateLocator;
import org.trimou.handlebars.HelpersBuilder;
import org.trimou.handlebars.SwitchHelper;

public final class TemplateEngine {

  private static final MustacheEngine ENGINE;
  private static final CopyrightHeaderResolver COPYRIGHT_HEADER_RESOLVER =
      new CopyrightHeaderResolver();

  private static boolean copyrightHeaderInitialized;

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
            .addResolver(COPYRIGHT_HEADER_RESOLVER)
            .build();
  }

  public static void initCopyrightHeaderContents(String contents) {
    if (!copyrightHeaderInitialized) {
      COPYRIGHT_HEADER_RESOLVER.setCopyrightHeaderContents(contents);
      copyrightHeaderInitialized = true;
    }
  }

  public static String render(final String templateName, final Object data) {

    return ENGINE.getMustache(templateName).render(data);
  }
}
