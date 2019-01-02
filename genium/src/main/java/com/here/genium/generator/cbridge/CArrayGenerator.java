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

package com.here.genium.generator.cbridge;

import static com.here.genium.generator.cbridge.CBridgeNameRules.CBRIDGE_PUBLIC;
import static com.here.genium.generator.cbridge.CBridgeNameRules.INCLUDE_DIR;
import static com.here.genium.generator.cbridge.CBridgeNameRules.SRC_DIR;
import static com.here.genium.model.cbridge.CType.FIXED_WIDTH_INTEGERS_INCLUDE;

import com.here.genium.generator.common.GeneratedFile;
import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.cbridge.CArray;
import com.here.genium.model.common.Include;
import java.nio.file.Paths;
import java.util.*;

public final class CArrayGenerator {

  private static final String ARRAY_FILE = "ArrayCollection";
  public static final String CBRIDGE_ARRAY_HEADER =
      Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, ARRAY_FILE + ".h").toString();
  public static final String CBRIDGE_ARRAY_IMPL =
      Paths.get(CBRIDGE_PUBLIC, SRC_DIR, ARRAY_FILE + ".cpp").toString();

  private final Map<String, CArray> arrayCollector = new HashMap<>();

  public void collect(final Map<String, CArray> arrays) {
    this.arrayCollector.putAll(arrays);
  }

  public List<GeneratedFile> generate() {

    Collection<CArray> arrays = arrayCollector.values();

    Collection<Include> headerIncludes =
        new TreeSet<>(CBridgeComponents.collectHeaderIncludes(arrays));
    headerIncludes.add(FIXED_WIDTH_INTEGERS_INCLUDE);

    Map<String, Object> headerData = new HashMap<>();
    headerData.put("arrays", arrays);
    headerData.put("includes", headerIncludes);

    GeneratedFile headerFile =
        new GeneratedFile(
            TemplateEngine.INSTANCE.render("cbridge/ArraysHeader", headerData),
            CBRIDGE_ARRAY_HEADER);

    Collection<Include> implementationIncludes =
        new TreeSet<>(CBridgeComponents.collectImplementationIncludes(arrays));
    implementationIncludes.add(Include.Companion.createInternalInclude(CBRIDGE_ARRAY_HEADER));

    Map<String, Object> implementationData = new HashMap<>();
    implementationData.put("arrays", arrays);
    implementationData.put("includes", implementationIncludes);

    GeneratedFile implementationFile =
        new GeneratedFile(
            TemplateEngine.INSTANCE.render("cbridge/ArraysImpl", implementationData),
            CBRIDGE_ARRAY_IMPL);

    return Arrays.asList(headerFile, implementationFile);
  }
}
