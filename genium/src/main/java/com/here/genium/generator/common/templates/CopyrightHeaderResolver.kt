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

import lombok.Setter;
import org.trimou.engine.resolver.AbstractResolver;
import org.trimou.engine.resolver.ResolutionContext;
import org.trimou.engine.resolver.Resolver;

/**
 * Resolves "copyrightHeader" keyword into the copyright header contents.<br>
 * Will be used in general prefixed with a prefix corresponding to the prefix for comments in the
 * target language. Example: {{prefix copyrightHeader "// "}}
 */
class CopyrightHeaderResolver extends AbstractResolver {

  public static final String TAG_COPYRIGHT_HEADER = "copyrightHeader";

  @Setter private String copyrightHeaderContents;

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
