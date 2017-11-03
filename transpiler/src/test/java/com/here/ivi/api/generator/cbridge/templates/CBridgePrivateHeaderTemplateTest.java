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

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.test.TemplateComparison;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FModelElement;
import org.junit.Test;

public class CBridgePrivateHeaderTemplateTest {

  @Test
  public void getPointerFunctionForStruct() {
    CInterface cInterface = new CInterface("");
    CStruct struct = new CStruct("name", "baseName", new CppTypeInfo(CType.VOID));
    CField field = new CField("floatField", "baseApiFieldName", new CppTypeInfo(CType.FLOAT));
    struct.fields.add(field);
    cInterface.structs.add(struct);

    final String expected =
        "#pragma once\n"
            + "inline baseName* get_pointer(nameRef handle) {\n"
            + "    return static_cast<baseName*>(handle.private_pointer);\n"
            + "}\n";
    final String generated = generate(cInterface);
    TemplateComparison.assertEqualPrivateHeaderContent(expected, generated);
  }

  @Test
  public void getPointerFunctionForInstance() {
    CInterface cInterface = new CInterface("");
    IncludeResolver resolver = mock(IncludeResolver.class);
    FModelElement francaInterface = mock(FInterface.class);
    FModel francaParent = mock(FModel.class);
    when(francaInterface.getName()).thenReturn("SomeClass");
    when(francaInterface.eContainer()).thenReturn(francaParent);
    when(francaParent.getName()).thenReturn("some.package");
    cInterface.selfType =
        CppTypeInfo.createCustomTypeInfo(resolver, francaInterface, CppTypeInfo.TypeCategory.CLASS);
    CFunction method =
        CFunction.builder("instanceMethod")
            .selfParameter(new CInParameter("self", cInterface.selfType))
            .build();
    cInterface.functions.add(method);

    final String expected =
        "#pragma once\n"
            + "inline std::shared_ptr<some::package::SomeClass>* get_pointer(some_package_SomeClassRef handle) {\n"
            + "    return static_cast<std::shared_ptr<some::package::SomeClass>*>(handle.private_pointer);\n"
            + "}\n";
    final String generated = generate(cInterface);
    TemplateComparison.assertEqualPrivateHeaderContent(expected, generated);
  }

  public String generate(final CInterface iface) {
    return CBridgeGenerator.generatePrivateHeaderContent(iface);
  }
}
