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
import com.here.ivi.api.model.cmodel.CParameter;
import com.here.ivi.api.model.cmodel.CType;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.test.TemplateComparison;
import java.util.Arrays;
import java.util.Collections;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CBridgeImplementationTemplateTest {
  @Rule public final TemporaryFolder tempFolder = new TemporaryFolder();

  public String generate(final CInterface iface) {
    return CBridgeGenerator.generateImplementationContent(iface);
  }

  @Test
  public void systemInclude() {
    CInterface cInterface = new CInterface();
    cInterface.implementationIncludes =
        Collections.singleton(Include.createSystemInclude("header.h"));
    final String expected = "#include <header.h>\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void projectInclude() {
    CInterface cInterface = new CInterface();
    cInterface.implementationIncludes =
        Collections.singleton(Include.createInternalInclude("header.h"));
    final String expected = "#include \"header.h\"\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void function() {
    CInterface cInterface = new CInterface();
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("functionName")
                .delegateCallTemplate("functionDelegate()")
                .build());
    final String expected = "void functionName() {\n" + "    functionDelegate();\n" + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithOneParameter() {
    CInterface cInterface = new CInterface();
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("parameterFunctionName")
                .parameters(Collections.singletonList(new CParameter("one", CType.INT32)))
                .delegateCallTemplate("delegator(%1$s)")
                .build());
    final String expected =
        "void parameterFunctionName(int32_t one) {\n"
            + "    auto&& cpp_one = one;\n"
            + "    delegator(cpp_one);\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithTwoParameters() {
    CInterface cInterface = new CInterface();
    final CParameter first = new CParameter("first", CType.INT16);
    final CParameter second = new CParameter("second", CType.DOUBLE);
    final CFunction doubleFunction =
        new CFunction.Builder("doubleFunction")
            .parameters(Arrays.asList(first, second))
            .delegateCallTemplate("namespacy::classy::doubleFunction(%1$s, %2$s)")
            .build();
    cInterface.functions = Collections.singletonList(doubleFunction);
    final String expected =
        "void doubleFunction(int16_t first, double second) {\n"
            + "    auto&& cpp_first = first;\n"
            + "    auto&& cpp_second = second;\n"
            + "    namespacy::classy::doubleFunction(cpp_first, cpp_second);\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithReturnValue() {
    CInterface cInterface = new CInterface();
    cInterface.functions =
        Collections.singletonList(
            new CFunction.Builder("returner")
                .returnType(CType.FLOAT)
                .delegateCallTemplate("delegate()")
                .build());
    final String expected =
        "float returner() {\n"
            + "    {\n"
            + "        auto&& cpp_result = delegate();\n"
            + "        return cpp_result;\n"
            + "    }\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }
}
