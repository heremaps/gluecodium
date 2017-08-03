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

package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.common.LazyInternalInclude;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeInfo;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FBroadcast;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FField;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;

public class CppTypeMapper {

  public static CppTypeRef map(FrancaElement<?> rootModel, FTypedElement typedElement) {
    CppTypeRef type = CppTypeMapper.map(rootModel, typedElement.getType());

    if (typedElement.isArray()) {
      throw new TranspilerExecutionException("wrapping of arrays is not yet supported");
    }
    return type;
  }

  public static CppTypeRef map(FrancaElement<?> rootModel, FTypeRef type) {

    if (type.getDerived() != null) {
      return mapDerived(rootModel, type);
    }

    if (type.getPredefined() != FBasicTypeId.UNDEFINED) {
      return mapPredefined(type);
    }
    throw new TranspilerExecutionException("unmapped ftype ref" + type);
  }

  private static CppTypeRef mapDerived(FrancaElement<?> rootModel, FTypeRef type) {
    FType derived = type.getDerived();

    // types without a parent are not valid
    if (derived.eContainer() == null) {
      return reportInvalidType(rootModel, type);
    }

    if (derived instanceof FTypeDef) {
      return mapTypeDef(rootModel, (FTypeDef) derived);
    }
    if (derived instanceof FArrayType) {
      return mapArray(rootModel, (FArrayType) derived);
    }
    if (derived instanceof FMapType) {
      return mapMap(rootModel, (FMapType) derived);
    }
    if (derived instanceof FStructType) {
      return mapStruct(rootModel, (FStructType) derived);
    }
    if (derived instanceof FEnumerationType) {
      return mapEnum(rootModel, (FEnumerationType) derived);
    }
    throw new TranspilerExecutionException("unmapped derived ref" + type);
  }

  private static CppTypeRef reportInvalidType(FrancaElement<?> rootModel, FTypeRef type) {
    DefinedBy definer = DefinedBy.createFromFModelElement(type);
    String name = "unknown";
    String typeDesc = "derived type";

    if (type.eContainer() instanceof FTypeDef) {
      name = ((FTypeDef) type.eContainer()).getName();
      typeDesc = "type reference";
    } else if (type.eContainer() instanceof FArgument) {
      FArgument arg = (FArgument) type.eContainer();
      name = arg.getName();

      // look at method name as well
      if (arg.eContainer() instanceof FMethod) {
        name = ((FMethod) arg.eContainer()).getName() + "::" + name;
      } else if (arg.eContainer() instanceof FBroadcast) {
        name = ((FMethod) arg.eContainer()).getName() + "::" + name;
      }

      typeDesc = "argument";
    } else if (type.eContainer() instanceof FField) {
      name = ((FField) type.eContainer()).getName();
      typeDesc = "field";
    } else if (type.eContainer() instanceof FAttribute) {
      name = ((FAttribute) type.eContainer()).getName();
      typeDesc = "attribute";
    }

    String formatMessage =
        "Failed resolving %s for '%s' in %s (indicates wrong typedef or missing include). "
            + "Type included in %s.";
    throw new TranspilerExecutionException(
        String.format(formatMessage, typeDesc, name, definer, rootModel));
  }

  private static CppTypeRef mapTypeDef(
      @SuppressWarnings("unused") FrancaElement<?> rootModel,
      @SuppressWarnings("unused") FTypeDef typedef) {
    throw new TranspilerExecutionException("mapping type defs is not yet supported");
  }

  private static CppComplexTypeRef mapArray(
      @SuppressWarnings("unused") FrancaElement<?> rootModel,
      @SuppressWarnings("unused") FArrayType array) {
    throw new TranspilerExecutionException("mapping arrays is not yet supported");
  }

  public static CppTypeRef defineArray(
      @SuppressWarnings("unused") FrancaElement<?> rootModel,
      @SuppressWarnings("unused") FArrayType array) {
    throw new TranspilerExecutionException("defining arrays is not yet supported");
  }

  private static CppComplexTypeRef mapMap(
      @SuppressWarnings("unused") FrancaElement<?> rootModel,
      @SuppressWarnings("unused") FMapType map) {

    throw new TranspilerExecutionException("map mapping is not yet supported");
  }

  public static CppComplexTypeRef mapStruct(FrancaElement<?> rootModel, FStructType struct) {

    if (struct.getElements().isEmpty()) {
      return new CppComplexTypeRef("EMPTY STRUCT", CppTypeInfo.Invalid);
    } else {
      Include structInclude = new LazyInternalInclude(DefinedBy.createFromFModelElement(struct));
      String typeName = CppNamespaceUtils.getCppTypename(rootModel, struct);

      return new CppComplexTypeRef(typeName, CppTypeInfo.Complex, structInclude);
    }
  }

  public static CppComplexTypeRef mapEnum(
      @SuppressWarnings("unused") FrancaElement<?> rootModel,
      @SuppressWarnings("unused") FEnumerationType enumeration) {

    throw new TranspilerExecutionException("mapping enums is not yet supported");
  }

  public static CppComplexTypeRef wrapMapType(
      @SuppressWarnings("unused") Include mapInclude,
      @SuppressWarnings("unused") CppTypeRef key,
      @SuppressWarnings("unused") CppTypeRef value) {

    throw new TranspilerExecutionException("wrapping of maps is not yet supported");
  }

  public static CppComplexTypeRef wrapUniquePtr(@SuppressWarnings("unused") CppTypeRef content) {
    throw new TranspilerExecutionException("wrapping of unique pointers is not yet supported");
  }

  public static CppComplexTypeRef wrapSharedPtr(@SuppressWarnings("unused") CppTypeRef content) {
    throw new TranspilerExecutionException("wrapping of shared pointers is not yet supported");
  }

  private static CppTypeRef mapPredefined(final FTypeRef type) {

    switch (type.getPredefined().getValue()) {
      case FBasicTypeId.BOOLEAN_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.BOOL);
      case FBasicTypeId.FLOAT_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.FLOAT);
      case FBasicTypeId.DOUBLE_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.DOUBLE);
      case FBasicTypeId.INT8_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT8);
      case FBasicTypeId.INT16_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT16);
      case FBasicTypeId.INT32_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT32);
      case FBasicTypeId.INT64_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT64);
      case FBasicTypeId.UINT8_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.UINT8);
      case FBasicTypeId.UINT16_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.UINT16);
      case FBasicTypeId.UINT32_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.UINT32);
      case FBasicTypeId.UINT64_VALUE:
        return new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.UINT64);
      case FBasicTypeId.STRING_VALUE:
        return new CppComplexTypeRef(
            CppComplexTypeRef.STRING_TYPE_NAME, CppTypeInfo.Complex, CppLibraryIncludes.STRING);
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new CppComplexTypeRef(
            "std::vector< uint8_t >",
            CppTypeInfo.Complex,
            CppLibraryIncludes.VECTOR,
            CppLibraryIncludes.INT_TYPES);
      default:
        throw new TranspilerExecutionException(
            "unmapped predefined [" + type.getPredefined().getName() + "]");
    }
  }
}
