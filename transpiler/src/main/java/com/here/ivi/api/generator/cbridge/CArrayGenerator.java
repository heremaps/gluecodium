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

import static com.here.ivi.api.model.cmodel.CType.FIXED_WIDTH_INTEGERS_INCLUDE;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.cmodel.CArray;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.common.Include;
import java.util.*;

public final class CArrayGenerator {

  private static final String ARRAY_FILE = "ArrayCollection";
  private static final String CBRIDGE_ARRAY_HEADER = "cbridge/" + ARRAY_FILE + ".h";
  private static final String CBRIDGE_ARRAY_IMPL = "cbridge/" + ARRAY_FILE + ".cpp";
  public static final String CBRIDGE_ARRAY_REF = "cbridge/" + ARRAY_FILE + "Ref.h";
  public static final String CBRIDGE_INTERNAL_ARRAY_IMPL =
      "cbridge_internal/" + ARRAY_FILE + "Impl.h";

  private final Map<String, CArray> arrayCollector = new HashMap<>();

  public void collect(final Map<String, CArray> arrays) {
    this.arrayCollector.putAll(arrays);
  }

  public List<GeneratedFile> generate() {
    CInterface arraysInterface = new CInterface(ARRAY_FILE);
    arraysInterface.arrays = new ArrayList<>(arrayCollector.values());
    arraysInterface.headerIncludes = CBridgeComponents.collectHeaderIncludes(arraysInterface);
    arraysInterface.headerIncludes.add(FIXED_WIDTH_INTEGERS_INCLUDE);
    arraysInterface.implementationIncludes =
        CBridgeComponents.collectImplementationIncludes(arraysInterface);
    arraysInterface.implementationIncludes.add(Include.createInternalInclude(CBRIDGE_ARRAY_HEADER));
    arraysInterface.privateHeaderIncludes =
        CBridgeComponents.collectPrivateHeaderIncludes(arraysInterface);

    String fileHeader = TemplateEngine.render("cbridge/FileHeader", null);
    return Arrays.asList(
        new GeneratedFile(
            fileHeader + TemplateEngine.render("cbridge/Header", arraysInterface),
            CBRIDGE_ARRAY_HEADER),
        new GeneratedFile(
            fileHeader + TemplateEngine.render("cbridge/Implementation", arraysInterface),
            CBRIDGE_ARRAY_IMPL),
        new GeneratedFile(
            fileHeader + TemplateEngine.render("cbridge/ArraysReferences", arraysInterface),
            CBRIDGE_ARRAY_REF),
        new GeneratedFile(
            fileHeader + TemplateEngine.render("cbridge/PrivateHeader", arraysInterface),
            CBRIDGE_INTERNAL_ARRAY_IMPL));
  }
}
