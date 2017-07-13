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

import com.here.ivi.api.generator.cbridge.templates.CBridgeHeaderTemplate;
import com.here.ivi.api.generator.cbridge.templates.CBridgeImplementationTemplate;
import com.here.ivi.api.generator.common.FrancaTreeWalker;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.franca.Interface;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class CBridgeGenerator {
  private final CBridgeNameRules cBridgeNameRules;

  public CBridgeGenerator(CBridgeNameRules nameRules) {
    this.cBridgeNameRules = nameRules;
  }

  public List<GeneratedFile> generate(Interface<?> iface) {
    CInterface cModel = buildCBridgeModel(iface);
    return Arrays.asList(
        new GeneratedFile(
            CBridgeHeaderTemplate.generate(cModel),
            cBridgeNameRules.getHeaderFileNameWithPath(iface)),
        new GeneratedFile(
            CBridgeImplementationTemplate.generate(cModel),
            cBridgeNameRules.getImplementationFileNameWithPath(iface)));
  }

  CInterface buildCBridgeModel(Interface<?> anInterface) {
    CModelBuilder modelBuilder = new CModelBuilder(anInterface);
    FrancaTreeWalker treeWalker = new FrancaTreeWalker(Collections.singletonList(modelBuilder));

    treeWalker.walk(anInterface);

    return modelBuilder.getFirstResult(CInterface.class);
  }
}
