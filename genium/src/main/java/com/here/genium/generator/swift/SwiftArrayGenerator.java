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

package com.here.genium.generator.swift;

import static java.util.Collections.emptyList;

import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.swift.SwiftArray;
import com.here.genium.model.swift.SwiftFile;
import java.util.*;

public final class SwiftArrayGenerator {

  private static final String SWIFT_ARRAY = "swift/Collections.swift";

  private final Map<String, SwiftArray> arrayCollector = new HashMap<>();

  public void collect(final Map<String, SwiftArray> arrays) {
    this.arrayCollector.putAll(arrays);
  }

  public List<GeneratedFile> generate() {
    SwiftFile arrayFile = new SwiftFile();
    arrayFile.arrays.addAll(new TreeMap<>(arrayCollector).values());

    if (arrayFile.isEmpty()) {
      return emptyList();
    } else {
      String content = TemplateEngine.render("swift/Array", arrayFile);
      return Collections.singletonList(new GeneratedFile(content, SWIFT_ARRAY));
    }
  }
}
