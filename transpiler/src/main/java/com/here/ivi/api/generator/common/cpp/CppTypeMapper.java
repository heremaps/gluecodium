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
import com.here.ivi.api.model.common.LazyTypeRefName;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeInfo;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import org.franca.core.franca.*;

public class CppTypeMapper {

  public static CppTypeRef map(FrancaElement<?> rootModel, FTypedElement typedElement) {
    CppTypeRef type = CppTypeMapper.map(rootModel, typedElement.getType());

    if (typedElement.isArray()) {
      //TODO: APIGEN-145 handle array types
      return new CppComplexTypeRef.Builder("void").build();
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
    throw new TranspilerExecutionException(
        "unmapped ftype ref" + type + ". Name: " + type.getDerived().getName());
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
      return mapStruct((FStructType) derived);
    }
    if (derived instanceof FEnumerationType) {
      return mapEnum((FEnumerationType) derived);
    }
    if (derived instanceof FUnionType) {
      return mapUnion((FUnionType) derived);
    }
    throw new TranspilerExecutionException(
        "unmapped derived ref" + type + ". Name: " + type.getDerived().getName());
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

  private static CppTypeRef mapTypeDef(FrancaElement<?> rootModel, FTypeDef typedef) {
    // TODO APIGEN-439 Replace this when typedef support is implemented
    return map(rootModel, typedef.getActualType());
  }

  private static CppComplexTypeRef mapArray(
      @SuppressWarnings("unused") FrancaElement<?> rootModel,
      @SuppressWarnings("unused") FArrayType array) {
    //TODO: APIGEN-145 handle array types
    return new CppComplexTypeRef.Builder("void").build();
  }

  public static CppTypeRef defineArray(
      @SuppressWarnings("unused") FrancaElement<?> rootModel,
      @SuppressWarnings("unused") FArrayType array) {
    //TODO: APIGEN-145 handle array types
    return new CppComplexTypeRef.Builder("void").build();
  }

  private static CppComplexTypeRef mapMap(
      @SuppressWarnings("unused") FrancaElement<?> rootModel,
      @SuppressWarnings("unused") FMapType map) {

    throw new TranspilerExecutionException("map mapping is not yet supported");
  }

  public static CppComplexTypeRef mapStruct(FStructType struct) {

    if (struct.getElements().isEmpty()) {
      throw new TranspilerExecutionException("empty struct");
    } else {
      Include structInclude = new LazyInternalInclude(DefinedBy.createFromFModelElement(struct));

      return new CppComplexTypeRef.Builder(
              new LazyTypeRefName(
                  CppNameRules.getStructName(struct.getName()),
                  CppNameRules.getNestedNameSpecifier(struct)))
          .includes(structInclude)
          .build();
    }
  }

  public static CppComplexTypeRef mapEnum(FEnumerationType enumeration) {

    Include enumInclude = new LazyInternalInclude(DefinedBy.createFromFModelElement(enumeration));

    return new CppComplexTypeRef.Builder(
            new LazyTypeRefName(
                CppNameRules.getEnumName(enumeration.getName()),
                CppNameRules.getNestedNameSpecifier(enumeration)))
        .typeInfo(CppTypeInfo.Enumeration)
        .includes(enumInclude)
        .build();
  }

  public static CppComplexTypeRef mapUnion(FUnionType union) {
    //TODO: APIGEN-145 handle union types. For now, handle them like structs
    if (union.getElements().isEmpty()) {
      throw new TranspilerExecutionException("empty union");
    } else {
      Include structInclude = new LazyInternalInclude(DefinedBy.createFromFModelElement(union));

      return new CppComplexTypeRef.Builder(
              new LazyTypeRefName(
                  CppNameRules.getStructName(union.getName()),
                  CppNameRules.getNestedNameSpecifier(union)))
          .includes(structInclude)
          .build();
    }
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
        return new CppComplexTypeRef.Builder(
                new LazyTypeRefName(
                    CppComplexTypeRef.STRING_TYPE_NAME,
                    CppComplexTypeRef.STD_NESTED_NAME_SPECIFIER))
            .includes(CppLibraryIncludes.STRING)
            .build();
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new CppComplexTypeRef.Builder(
                new LazyTypeRefName(
                    CppComplexTypeRef.BYTE_VECTOR_TYPE_NAME,
                    CppComplexTypeRef.STD_NESTED_NAME_SPECIFIER))
            .includes(CppLibraryIncludes.VECTOR, CppLibraryIncludes.INT_TYPES)
            .build();
      default:
        throw new TranspilerExecutionException(
            "unmapped predefined [" + type.getPredefined().getName() + "]");
    }
  }
}
