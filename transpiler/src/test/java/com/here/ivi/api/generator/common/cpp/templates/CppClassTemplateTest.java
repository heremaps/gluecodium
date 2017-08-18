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

package com.here.ivi.api.generator.common.cpp.templates;

import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppEnum;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppStruct;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({
  CppPureStructTemplate.class,
  CppEnumTemplate.class,
  CppMethodSignatureTemplate.class,
  CppDocCommentTemplate.class
})
public class CppClassTemplateTest {

  @Before
  public void setUp() {
    PowerMockito.mockStatic(CppPureStructTemplate.class);
    PowerMockito.mockStatic(CppEnumTemplate.class);
    PowerMockito.mockStatic(CppMethodSignatureTemplate.class);
    PowerMockito.mockStatic(CppDocCommentTemplate.class);
  }

  @Test
  public void emptyClass() {
    //arrange
    CppClass myClass = new CppClass("myClass");

    //act
    CppClassTemplate.generate(myClass);

    //verify
    verifyStatic();
    CppDocCommentTemplate.generate(myClass);
  }

  @Test
  public void classWithMethods() {
    //arrange
    CppClass myClass = new CppClass("myClass");
    CppMethod myMethod1 = new CppMethod.Builder("myMethodA").build();
    CppMethod myMethod2 = new CppMethod.Builder("myMethodB").build();
    myClass.methods.add(myMethod1);
    myClass.methods.add(myMethod2);

    //act
    CppClassTemplate.generate(myClass);

    //verify
    verifyStatic();
    CppDocCommentTemplate.generate(myClass);
    verifyStatic();
    CppMethodSignatureTemplate.generate(myMethod1);
    verifyStatic();
    CppMethodSignatureTemplate.generate(myMethod2);
  }

  @Test
  public void classWithEnums() {
    //arrange
    CppClass myClass = new CppClass("myClass");
    CppEnum myEnum1 = new CppEnum("enumA");
    CppEnum myEnum2 = new CppEnum("enumB");
    myClass.enums.add(myEnum1);
    myClass.enums.add(myEnum2);

    //act
    CppClassTemplate.generate(myClass);

    //verify
    verifyStatic();
    CppDocCommentTemplate.generate(myClass);
    verifyStatic();
    CppEnumTemplate.generate(myEnum1);
    verifyStatic();
    CppEnumTemplate.generate(myEnum2);
  }

  @Test
  public void classWithStructs() {
    //arrange
    CppClass myClass = new CppClass("myClass");
    CppStruct myStruct1 = new CppStruct("structA");
    CppStruct myStruct2 = new CppStruct("structB");
    myClass.structs.add(myStruct1);
    myClass.structs.add(myStruct2);

    //act
    CppClassTemplate.generate(myClass);

    //verify
    verifyStatic();
    CppDocCommentTemplate.generate(myClass);
    verifyStatic();
    CppPureStructTemplate.generate(myStruct1);
    verifyStatic();
    CppPureStructTemplate.generate(myStruct2);
  }
}
