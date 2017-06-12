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

package com.here.ivi.api.generator.common.java;

import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import com.here.ivi.api.model.javamodel.JavaType;
import navigation.BaseApiSpec;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;

public final class JavaTypeMapper {
  public static JavaType map(
      final Interface<BaseApiSpec.InterfacePropertyAccessor> api, final FTypeRef fTypeRef) {
    if (fTypeRef.getDerived() != null) {
      return mapDerived(api, fTypeRef);
    }
    if (fTypeRef.getPredefined() != null) {
      return mapPredefined(fTypeRef);
    }

    return new JavaPrimitiveType(Type.VOID);
  }

  private static JavaType mapPredefined(FTypeRef type) {
    switch (type.getPredefined().getValue()) {
      case FBasicTypeId.BOOLEAN_VALUE:
        return new JavaPrimitiveType(Type.BOOL);
      case FBasicTypeId.FLOAT_VALUE:
        return new JavaPrimitiveType(Type.FLOAT);
      case FBasicTypeId.DOUBLE_VALUE:
        return new JavaPrimitiveType(Type.DOUBLE);
      case FBasicTypeId.INT8_VALUE:
      case FBasicTypeId.INT16_VALUE:
      case FBasicTypeId.INT32_VALUE:
      case FBasicTypeId.INT64_VALUE:
      case FBasicTypeId.UINT8_VALUE:
      case FBasicTypeId.UINT16_VALUE:
      case FBasicTypeId.UINT32_VALUE:
      case FBasicTypeId.UINT64_VALUE:
        return new JavaPrimitiveType(Type.INT);
      case FBasicTypeId.STRING_VALUE:
        return new JavaReferenceType(JavaReferenceType.Type.STRING);
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new JavaReferenceType(JavaReferenceType.Type.BYTE_ARRAY);
      default:
        return new JavaPrimitiveType(Type.VOID);
    }
  }

  private static JavaType mapDerived(
      final Interface<BaseApiSpec.InterfacePropertyAccessor> api, final FTypeRef type) {
    FType derived = type.getDerived();

    // types without a parent are not valid
    if (derived.eContainer() == null) {
      //TODO: return reportInvalidType(api, type);
    }

    if (derived instanceof FTypeDef) {
      //TODO: return mapTypeDef(api, (FTypeDef) derived);
    }
    if (derived instanceof FArrayType) {
      //TODO: return mapArray(api, (FArrayType) derived);
    }
    if (derived instanceof FMapType) {
      //TODO: return mapMap(api, (FMapType) derived);
    }
    if (derived instanceof FStructType) {
      //TODO: return mapStruct(api, (FStructType) derived);
    }
    if (derived instanceof FEnumerationType) {
      //TODO: return mapEnum(api, (FEnumerationType) derived);
    }

    return new JavaCustomType("TODO");
  }
}
