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

package com.here.ivi.api.generator.swift.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.swift.SwiftEnum;
import com.here.ivi.api.model.swift.SwiftGenericParameter;
import com.here.ivi.api.model.swift.SwiftMethod;
import com.here.ivi.api.model.swift.SwiftParameter;
import com.here.ivi.api.model.swift.SwiftType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class SwiftMethodSignatureTemplateTest {

  private static final String TEMPLATE_NAME = "swift/MethodSignature";

  private final SwiftMethod swiftMethod = new SwiftMethod("methodFoo");
  private final SwiftGenericParameter genericParameter =
      new SwiftGenericParameter("very", "generic");

  @Test
  public void generateEmptyMethod() {
    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "func methodFoo() -> Void";
    assertEquals(expected, result);
  }

  @Test
  public void generateMethodWithComment() {
    swiftMethod.comment = "nonsense";

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "/**\n" + " * nonsense\n" + " */\n" + "func methodFoo() -> Void";
    assertEquals(expected, result);
  }

  @Test
  public void generateStaticMethod() {
    swiftMethod.isStatic = true;

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "static func methodFoo() -> Void";
    assertEquals(expected, result);
  }

  @Test
  public void generateMethodWithOneGenericParameter() {
    swiftMethod.genericParameters.add(genericParameter);

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "func methodFoo<Tvery: generic>() -> Void";
    assertEquals(expected, result);
  }

  @Test
  public void generateMethodWithTwoGenericParameters() {
    swiftMethod.genericParameters.add(genericParameter);
    swiftMethod.genericParameters.add(new SwiftGenericParameter("less", "so"));

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "func methodFoo<Tvery: generic, Tless: so>() -> Void";
    assertEquals(expected, result);
  }

  @Test
  public void generateMethodWithOneParameter() {
    swiftMethod.parameters.add(new SwiftParameter("typical", SwiftType.STRING));

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "func methodFoo(typical: String) -> Void";
    assertEquals(expected, result);
  }

  @Test
  public void generateMethodWithTwoParameters() {
    swiftMethod.parameters.add(new SwiftParameter("typical", SwiftType.STRING));
    swiftMethod.parameters.add(new SwiftParameter("foo", new SwiftType("Bar")));

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "func methodFoo(typical: String, foo: Bar) -> Void";
    assertEquals(expected, result);
  }

  @Test
  public void generateMethodWithReturnType() {
    swiftMethod.returnType = new SwiftType("Bar", SwiftType.TypeCategory.CLASS);

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "func methodFoo() -> Bar";
    assertEquals(expected, result);
  }

  @Test
  public void generateMethodWithOptionalReturnType() {
    swiftMethod.returnType =
        new SwiftType("Bar", SwiftType.TypeCategory.CLASS).createOptionalType();

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "func methodFoo() -> Bar?";
    assertEquals(expected, result);
  }

  @Test
  public void generateMethodWithOneGenericConstraint() {
    genericParameter.constraints.add(
        new SwiftGenericParameter.Constraint("very", "constraining", false));
    swiftMethod.genericParameters.add(genericParameter);

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "func methodFoo<Tvery: generic>() -> Void where Tvery == constraining";
    assertEquals(expected, result);
  }

  @Test
  public void generateMethodWithOneGenericProtocolConstraint() {
    genericParameter.constraints.add(
        new SwiftGenericParameter.Constraint("very", "constraining", true));
    swiftMethod.genericParameters.add(genericParameter);

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "func methodFoo<Tvery: generic>() -> Void where Tvery: constraining";
    assertEquals(expected, result);
  }

  @Test
  public void generateMethodWithTwoGenericConstraints() {
    genericParameter.constraints.add(
        new SwiftGenericParameter.Constraint("very", "Confusing", true));
    genericParameter.constraints.add(
        new SwiftGenericParameter.Constraint("very.Iterator", "somewhere", false));
    swiftMethod.genericParameters.add(genericParameter);

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected =
        "func methodFoo<Tvery: generic>() -> Void where "
            + "Tvery: Confusing, Tvery.Iterator == somewhere";
    assertEquals(expected, result);
  }

  @Test
  public void createTrowingFuncReturningVoid() {
    swiftMethod.error = SwiftEnum.builder("SomeErrorEnum").build();

    String result = TemplateEngine.render(TEMPLATE_NAME, swiftMethod);

    String expected = "func methodFoo() throws -> Void";
    assertEquals(expected, result);
  }
}
