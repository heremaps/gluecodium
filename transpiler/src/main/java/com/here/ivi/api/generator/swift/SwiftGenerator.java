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

import static java.util.Collections.singletonList;

import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.swift.templates.SwiftFileTemplate;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.swift.SwiftClass;
import java.util.List;

public class SwiftGenerator {
  private SwiftNameRules nameRules;

  public SwiftGenerator(SwiftNameRules rules, SwiftIncludeResolver resolver) {
    nameRules = rules;
  }

  public List<GeneratedFile> generate(Interface<?> iface) {
    SwiftClass clazz = buildSwiftModel(iface);
    return singletonList(
        new GeneratedFile(
            SwiftFileTemplate.generate(clazz), nameRules.getImplementationFileName(iface)));
  }

  protected SwiftClass buildSwiftModel(Interface<?> iface) {
    SwiftModelBuilder modelBuilder = new SwiftModelBuilder(iface, nameRules);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(singletonList(modelBuilder));

    treeWalker.walk(iface);

    return modelBuilder.getFirstResult(SwiftClass.class);
  }
}
