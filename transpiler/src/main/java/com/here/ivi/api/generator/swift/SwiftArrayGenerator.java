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

package com.here.ivi.api.generator.swift;

import static java.util.Collections.emptyList;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.swift.SwiftArray;
import com.here.ivi.api.model.swift.SwiftFile;
import java.util.*;

public final class SwiftArrayGenerator {

  private static final String SWIFT_ARRAY = "swift/Collections.swift";

  private final Map<String, SwiftArray> arrayCollector = new HashMap<>();

  public void collect(final Map<String, SwiftArray> arrays) {
    this.arrayCollector.putAll(arrays);
  }

  public List<GeneratedFile> generate() {
    SwiftFile arrayFile = new SwiftFile();
    arrayFile.arrays = new ArrayList<>(arrayCollector.values());

    if (arrayFile.isEmpty()) {
      return emptyList();
    } else {
      String content = TemplateEngine.render("swift/Array", arrayFile);
      return Collections.singletonList(new GeneratedFile(content, SWIFT_ARRAY));
    }
  }
}
