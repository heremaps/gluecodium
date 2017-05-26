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

package com.here.ivi.api.model.cppmodel;

public class CppAssignments {

  public interface CppAssignment {}

  public static class PlainAssignment implements CppAssignment {
    public CppValue leftHandSide;
    public CppValue rightHandSide;

    public boolean isValid() {
      return leftHandSide.isValid() && rightHandSide.isValid();
    }
  }

  /*
   * This class models an assignment via a method call. Suppose the conversion from class A to class B like
   *
   * A sourceObject = <some initialization>;
   * B target;
   * convert(A,B);
   *
   * signature of belonging convert method:
   * public static convert(const A& in, B& out);
   */
  public static class MethodAssignment extends CppElementWithIncludes implements CppAssignment {

    public MethodAssignment(String name, CppValue inputParameter, CppValue outputParameter) {
      super(name);
      this.inputParameter = inputParameter;
      this.outputParameter = outputParameter;
    }

    public CppValue inputParameter;
    public CppValue outputParameter;

    public boolean isValid() {
      return name != null && inputParameter.isValid() && outputParameter.isValid();
    }
  }
}
