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

import java.util.Iterator;
import java.util.List;
import org.trimou.handlebars.BasicHelper;
import org.trimou.handlebars.Options;

/**
 * Apply a partial to each value in an Iterable and join the results with a separator.<br>
 * Usage: {{joinPartial iterable "partial-name" "separator"}}<br>
 * Example: {{joinPartial parameters "cpp/CppMethodParameter" ", "}}
 */
class JoinPartialHelper extends BasicHelper {

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
