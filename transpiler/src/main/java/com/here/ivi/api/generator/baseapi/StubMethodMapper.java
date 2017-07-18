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

import com.here.ivi.api.generator.common.cpp.CppTypeMapper;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppCustomType;
import com.here.ivi.api.model.cppmodel.CppPrimitiveType;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.cppmodel.CppTypeInfo;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.HashSet;
import java.util.Set;
import navigation.BaseApiSpec;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FMethod;

/**
 * Helper class for mapping FMethod and related Franca model elements into the C++ model. All
 * methods in the class operate with a precondition of Franca model being valid.
 */
public final class StubMethodMapper {

  public static class ReturnTypeData {
    public final CppType type;
    public final String comment;

    public ReturnTypeData(final CppType type, final String comment) {
      this.type = type;
      this.comment = comment;
    }
  }

  private static final Include EXPECTED_INCLUDE =
      Include.createSystemInclude("cpp/internal/expected.h");

  public static ReturnTypeData mapMethodReturnType(
      FMethod francaMethod, FrancaElement<?> rootModel) {

    CppType errorType = null;
    String errorComment = "";

    if (francaMethod.getErrorEnum() != null) {
      errorType = CppTypeMapper.mapEnum(rootModel, francaMethod.getErrorEnum());
      errorComment = StubCommentParser.FORMATTER.readCleanedErrorComment(francaMethod);
    }

    CppType outArgType = null;
    String outArgComment = "";

    EList<FArgument> outArgs = francaMethod.getOutArgs();
    if (!outArgs.isEmpty()) {
      // If outArgs size is 2 or more, the output has to be wrapped in a struct,
      // which is not supported yet.
      outArgType = mapArgumentType(outArgs.get(0), francaMethod, rootModel);
      outArgComment = "The result type, containing " + outArgType.name + " value.";
    }

    if (errorType == null && outArgType == null) {
      return new ReturnTypeData(CppPrimitiveType.VOID_TYPE, "");
    } else if (errorType != null && outArgType == null) {
      return new ReturnTypeData(errorType, errorComment);
    } else if (errorType == null) {
      return new ReturnTypeData(outArgType, outArgComment);
    }

    // wrap multiple out values (error + outArg) in their own type
    Set<Include> includes = new HashSet<>();
    includes.addAll(errorType.includes);
    includes.addAll(outArgType.includes);
    includes.add(EXPECTED_INCLUDE);

    CppType returnType =
        new CppCustomType(
            "here::internal::Expected< " + errorType.name + ", " + outArgType.name + " >",
            CppTypeInfo.Complex,
            includes);

    String returnComment =
        "The result type, containing either an error or the " + outArgType.name + " value.";

    return new ReturnTypeData(returnType, returnComment);
  }

  public static CppType mapArgumentType(
      FArgument francaArgument, FMethod francaMethod, FrancaElement<?> rootModel) {

    CppType type = CppTypeMapper.map(rootModel, francaArgument);

    if (!(type instanceof CppCustomType)
        || ((CppCustomType) type).info != CppTypeInfo.InterfaceInstance) {
      return type;
    }

    boolean isFactoryMethod = false;
    if (francaMethod != null) {
      BaseApiSpec.IDataPropertyAccessor propertyAccessor = rootModel.getPropertyAccessor();
      if (propertyAccessor instanceof BaseApiSpec.InterfacePropertyAccessor
          && ((BaseApiSpec.InterfacePropertyAccessor) propertyAccessor).getCreates(francaMethod)
              != null) {
        isFactoryMethod = true;
      }
    }

    if (isFactoryMethod) {
      return CppTypeMapper.wrapUniquePtr(type);
    } else {
      return CppTypeMapper.wrapSharedPtr(type);
    }
  }
}
