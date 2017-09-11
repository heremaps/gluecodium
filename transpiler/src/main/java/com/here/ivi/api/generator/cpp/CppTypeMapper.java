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

package com.here.ivi.api.generator.cpp;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;
import org.franca.core.franca.FUnionType;

public class CppTypeMapper {

  private final CppIncludeResolver includeResolver;

  public CppTypeMapper(final CppIncludeResolver includeResolver) {
    this.includeResolver = includeResolver;
  }

  public CppTypeRef map(FTypedElement typedElement) {
    CppTypeRef type = map(typedElement.getType());
    return typedElement.isArray() ? wrapVector(type) : type;
  }

  public CppTypeRef map(FTypeRef type) {
    if (type.getDerived() != null) {
      return mapDerived(type.getDerived());
    }
    if (type.getPredefined() != FBasicTypeId.UNDEFINED) {
      return mapPredefined(type);
    }

    if (type.getInterval() != null) {
      throw new TranspilerExecutionException(
          "The transpiler does not support integer ranges. "
              + "Please use regular Integer types like Int64 instead. Type: "
              + type);
    }

    throw new TranspilerExecutionException("Unmapped ftype ref" + type);
  }

  private CppTypeRef mapDerived(FType derived) {
    if (derived instanceof FTypeDef) {
      return mapTypeDef((FTypeDef) derived);
    }
    if (derived instanceof FArrayType) {
      return mapArray((FArrayType) derived);
    }
    if (derived instanceof FMapType) {
      return mapMapType((FMapType) derived);
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
    throw new TranspilerExecutionException("Unmapped derived type: " + derived.getName());
  }

  private CppTypeRef mapTypeDef(FTypeDef typedef) {

    List<String> nestedNameSpecifier = CppNameRules.getNestedNameSpecifier(typedef);

    if (InstanceRules.isInstanceId(typedef)) {
      return new CppComplexTypeRef.Builder(
              "::std::shared_ptr< " + createFullyQualifiedName(nestedNameSpecifier, "") + " >")
          .includes(includeResolver.resolveInclude(typedef), CppLibraryIncludes.MEMORY)
          .build();
    } else {

      CppTypeRef actualType = map(typedef.getActualType());
      String typeDefName = CppNameRules.getTypedefName(typedef.getName());

      return new CppTypeDefRef(
          createFullyQualifiedName(nestedNameSpecifier, typeDefName),
          actualType,
          includeResolver.resolveInclude(typedef));
    }
  }

  public CppComplexTypeRef mapArray(final FArrayType array) {
    CppTypeRef elementType = map(array.getElementType());
    return wrapVector(elementType);
  }

  public CppComplexTypeRef mapMapType(FMapType francaMapType) {

    CppTypeRef key = map(francaMapType.getKeyType());
    CppTypeRef value = map(francaMapType.getValueType());

    List<Include> includes = new LinkedList<>();
    includes.addAll(key.includes);
    includes.addAll(value.includes);
    includes.add(CppLibraryIncludes.MAP);

    return new CppComplexTypeRef.Builder(
            "::std::unordered_map< " + key.name + ", " + value.name + " >")
        .includes(includes)
        .build();
  }

  public CppComplexTypeRef mapStruct(FStructType struct) {

    List<String> nestedNameSpecifier = CppNameRules.getNestedNameSpecifier(struct);

    return new CppComplexTypeRef.Builder(
            createFullyQualifiedName(
                nestedNameSpecifier, CppNameRules.getStructName(struct.getName())))
        .includes(includeResolver.resolveInclude(struct))
        .build();
  }

  public CppComplexTypeRef mapEnum(FEnumerationType enumeration) {

    List<String> nestedNameSpecifier = CppNameRules.getNestedNameSpecifier(enumeration);

    return new CppComplexTypeRef.Builder(
            createFullyQualifiedName(
                nestedNameSpecifier, CppNameRules.getEnumName(enumeration.getName())))
        .typeInfo(CppTypeInfo.Enumeration)
        .includes(includeResolver.resolveInclude(enumeration))
        .build();
  }

  private CppComplexTypeRef mapUnion(FUnionType union) {

    List<String> nestedNameSpecifier = CppNameRules.getNestedNameSpecifier(union);

    return new CppComplexTypeRef.Builder(
            createFullyQualifiedName(
                nestedNameSpecifier, CppNameRules.getStructName(union.getName())))
        .includes(includeResolver.resolveInclude(union))
        .build();
  }

  private static CppComplexTypeRef wrapVector(final CppTypeRef content) {
    List<Include> includes = new LinkedList<>(content.includes);
    includes.add(CppLibraryIncludes.VECTOR);
    return new CppComplexTypeRef.Builder("::std::vector< " + content.name + " >")
        .includes(includes)
        .build();
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
        return new CppComplexTypeRef.Builder(CppComplexTypeRef.STRING_TYPE_NAME)
            .includes(CppLibraryIncludes.STRING)
            .build();
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new CppComplexTypeRef.Builder(CppComplexTypeRef.BYTE_VECTOR_TYPE_NAME)
            .includes(CppLibraryIncludes.VECTOR, CppLibraryIncludes.INT_TYPES)
            .build();
      default:
        throw new TranspilerExecutionException(
            "unmapped predefined [" + type.getPredefined().getName() + "]");
    }
  }

  private static String createFullyQualifiedName(
      List<String> nestedNameSpecifier, String unqualifiedId) {
    return (!nestedNameSpecifier.isEmpty() ? "::" + String.join("::", nestedNameSpecifier) : "")
        + (unqualifiedId.isEmpty() ? "" : "::" + unqualifiedId);
  }
}
