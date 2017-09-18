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

package com.here.ivi.api.generator.baseapi;

import com.here.ivi.api.generator.cpp.CppTypeMapper;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import java.util.LinkedHashSet;
import java.util.Set;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FMethod;

/**
 * Helper class for mapping FMethod and related Franca model elements into the C++ model. All
 * methods in the class operate with a precondition of Franca model being valid.
 */
public final class CppMethodMapper {

  private static final Include EXPECTED_INCLUDE =
      Include.createSystemInclude("cpp/internal/expected.h");

  public static class ReturnTypeData {
    public final CppTypeRef type;
    public final String comment;

    public ReturnTypeData(final CppTypeRef type, final String comment) {
      this.type = type;
      this.comment = comment;
    }
  }

  public static ReturnTypeData mapMethodReturnType(
      final CppTypeMapper typeMapper, final FMethod francaMethod) {

    CppTypeRef errorType = null;
    String errorComment = "";

    if (francaMethod.getErrorEnum() != null) {
      errorType = typeMapper.mapEnum(francaMethod.getErrorEnum());
      errorComment = CppCommentParser.FORMATTER.readCleanedErrorComment(francaMethod);
    }

    CppTypeRef outArgType = null;
    String outArgComment = "";

    EList<FArgument> outArgs = francaMethod.getOutArgs();
    if (!outArgs.isEmpty()) {
      // If outArgs size is 2 or more, the output has to be wrapped in a struct,
      // which is not supported yet.
      outArgType = typeMapper.map(outArgs.get(0));

      outArgComment = "The result type, containing " + outArgType.name + " value.";
    }

    if (errorType == null && outArgType == null) {
      return new ReturnTypeData(CppPrimitiveTypeRef.VOID, "");
    } else if (errorType != null && outArgType == null) {
      return new ReturnTypeData(errorType, errorComment);
    } else if (errorType == null) {
      return new ReturnTypeData(outArgType, outArgComment);
    }

    // wrap multiple out values (error + outArg) in their own type
    Set<Include> includes = new LinkedHashSet<>();
    includes.addAll(errorType.includes);
    includes.addAll(outArgType.includes);
    includes.add(EXPECTED_INCLUDE);

    CppTypeRef returnType =
        new CppComplexTypeRef.Builder(
                "here::internal::Expected< " + errorType.name + ", " + outArgType.name + " >")
            .includes(includes)
            .build();

    String returnComment =
        "The result type, containing either an error or the " + outArgType.name + " value.";

    return new ReturnTypeData(returnType, returnComment);
  }
}
