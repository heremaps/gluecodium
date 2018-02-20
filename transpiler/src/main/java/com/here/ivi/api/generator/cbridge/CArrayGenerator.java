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

package com.here.ivi.api.generator.cbridge;

import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.CBRIDGE_PUBLIC;
import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.INCLUDE_DIR;
import static com.here.ivi.api.generator.cbridge.CBridgeNameRules.SRC_DIR;
import static com.here.ivi.api.model.cbridge.CType.FIXED_WIDTH_INTEGERS_INCLUDE;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cbridge.CArray;
import com.here.ivi.api.model.common.Include;
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

    Collection<Include> headerIncludes = new TreeSet<>();
    headerIncludes.addAll(CBridgeComponents.collectHeaderIncludes(arrays));
    headerIncludes.add(FIXED_WIDTH_INTEGERS_INCLUDE);

    Map<String, Object> headerData = new HashMap<>();
    headerData.put("arrays", arrays);
    headerData.put("includes", headerIncludes);

    GeneratedFile headerFile =
        new GeneratedFile(
            TemplateEngine.render("cbridge/ArraysHeader", headerData), CBRIDGE_ARRAY_HEADER);

    Collection<Include> implementationIncludes = new TreeSet<>();
    implementationIncludes.addAll(CBridgeComponents.collectImplementationIncludes(arrays));
    implementationIncludes.add(Include.createInternalInclude(CBRIDGE_ARRAY_HEADER));

    Map<String, Object> implementationData = new HashMap<>();
    implementationData.put("arrays", arrays);
    implementationData.put("includes", implementationIncludes);

    GeneratedFile implementationFile =
        new GeneratedFile(
            TemplateEngine.render("cbridge/ArraysImpl", implementationData), CBRIDGE_ARRAY_IMPL);

    return Arrays.asList(headerFile, implementationFile);
  }
}
