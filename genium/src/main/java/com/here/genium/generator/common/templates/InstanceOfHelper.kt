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

import java.util.List;
import org.trimou.handlebars.BasicSectionHelper;
import org.trimou.handlebars.Options;

/**
 * instanceOf: execute a block if the class name of the value equals the given string<br>
 * Usage: {{#instanceOf value "className"}}...{{/instanceOf}}<br>
 * Example: {{#instanceOf this "CppStruct"}}...{{/instanceOf}}<br>
 * notInstanceOf: execute a block if the class name of the value is not equal to the given string
 * <br>
 * Usage: {{#notInstanceOf value "className"}}...{{/notInstanceOf}}<br>
 * Example: {{#notInstanceOf this "CppStruct"}}...{{/notInstanceOf}} *
 */
class InstanceOfHelper extends BasicSectionHelper {

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
