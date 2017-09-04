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

package com.here.ivi.api.generator.cbridge.templates;

import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.model.cmodel.CFunction;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.test.TemplateComparison;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

public class CBridgePrivateHeaderTemplateTest {

  @Test
  public void privateFunctionNotPresentInImplementation() {
    CInterface cInterface = new CInterface();
    CFunction normalFunction = new CFunction.Builder("publicFunction").build();
    CFunction privateFunction =
        new CFunction.Builder("privateFunction").markAsInternalOnly().build();
    List<CFunction> functions = new ArrayList<>();
    functions.add(normalFunction);
    functions.add(privateFunction);
    cInterface.functions = functions;

    final String expected = "#pragma once\nvoid privateFunction() {\n    ;\n}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualPrivateHeaderContent(expected, generated);
  }

  public String generate(final CInterface iface) {
    return CBridgeGenerator.generatePrivateHeaderContent(iface);
  }
}
