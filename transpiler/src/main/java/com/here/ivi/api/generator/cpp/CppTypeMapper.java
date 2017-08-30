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
import com.here.ivi.api.model.common.LazyInternalInclude;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTypeDefRef;
import com.here.ivi.api.model.cppmodel.CppTypeInfo;
import com.here.ivi.api.model.cppmodel.CppTypeRef;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FBroadcast;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FField;
import org.franca.core.franca.FMapType;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;
import org.franca.core.franca.FUnionType;

public final class CppTypeMapper {
  private static final String VOID_POINTER = "void*";

  public static CppTypeRef map(FrancaElement<?> rootModel, FTypedElement typedElement) {
    CppTypeRef type = CppTypeMapper.map(rootModel, typedElement.getType());

    if (typedElement.isArray()) {
      return wrapVector(type);
    }
    return type;
  }

  public static CppTypeRef map(FrancaElement<?> rootModel, FTypeRef type) {
    if (type.getDerived() != null) {
      FType derived = type.getDerived();

      // types without a parent are not valid
      if (derived.eContainer() == null) {
        return reportInvalidType(rootModel, type);
      }

      return mapDerived(rootModel, derived);
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

  public static CppTypeRef mapDerived(FrancaElement<?> rootModel, FType derived) {
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
    throw new TranspilerExecutionException("Unmapped derived type: " + derived.getName());
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

      if (arg.eContainer() instanceof FMethod || arg.eContainer() instanceof FBroadcast) {
        name = ((FModelElement) arg.eContainer()).getName() + "::" + arg.getName();
      } else {
        name = arg.getName();
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
    List<String> nestedNameSpecifier = CppNameRules.getNestedNameSpecifier(typedef);
    String fullyQualifiedName =
        createFullyQualifiedName(
            nestedNameSpecifier, CppNameRules.getStructName(typedef.getName()));
    return new CppTypeDefRef(fullyQualifiedName, map(rootModel, typedef.getActualType()));
  }

  public static CppComplexTypeRef mapArray(
      final FrancaElement<?> rootModel, final FArrayType array) {
    CppTypeRef elementType = map(rootModel, array.getElementType());

    Set<Include> includes = elementType.includes;
    includes.add(CppLibraryIncludes.VECTOR);
    return new CppComplexTypeRef.Builder("::std::vector< " + elementType.name + " >")
        .includes(includes)
        .build();
  }

  private static CppComplexTypeRef mapMap(
      @SuppressWarnings("unused") FrancaElement<?> rootModel,
      @SuppressWarnings("unused") FMapType map) {
    //TODO: APIGEN-145 handle complex types
    return new CppComplexTypeRef.Builder(VOID_POINTER).build();
  }

  public static CppComplexTypeRef mapStruct(FStructType struct) {

    Include structInclude = new LazyInternalInclude(DefinedBy.createFromFModelElement(struct));
    List<String> nestedNameSpecifier = CppNameRules.getNestedNameSpecifier(struct);

    return new CppComplexTypeRef.Builder(
            createFullyQualifiedName(
                nestedNameSpecifier, CppNameRules.getStructName(struct.getName())))
        .includes(structInclude)
        .build();
  }

  public static CppComplexTypeRef mapEnum(FEnumerationType enumeration) {

    Include enumInclude = new LazyInternalInclude(DefinedBy.createFromFModelElement(enumeration));
    List<String> nestedNameSpecifier = CppNameRules.getNestedNameSpecifier(enumeration);

    return new CppComplexTypeRef.Builder(
            createFullyQualifiedName(
                nestedNameSpecifier, CppNameRules.getEnumName(enumeration.getName())))
        .typeInfo(CppTypeInfo.Enumeration)
        .includes(enumInclude)
        .build();
  }

  public static CppComplexTypeRef mapUnion(FUnionType union) {
    //TODO: APIGEN-145 handle union types. For now, handle them like structs
    Include structInclude = new LazyInternalInclude(DefinedBy.createFromFModelElement(union));
    List<String> nestedNameSpecifier = CppNameRules.getNestedNameSpecifier(union);

    return new CppComplexTypeRef.Builder(
            createFullyQualifiedName(
                nestedNameSpecifier, CppNameRules.getStructName(union.getName())))
        .includes(structInclude)
        .build();
  }

  public static CppComplexTypeRef wrapMapType(CppTypeRef key, CppTypeRef value) {

    List<Include> includes = new LinkedList<>();
    includes.addAll(key.includes);
    includes.addAll(value.includes);
    includes.add(CppLibraryIncludes.MAP);

    return new CppComplexTypeRef.Builder(
            "::std::unordered_map< " + key.name + ", " + value.name + " >")
        .includes(includes)
        .build();
  }

  public static CppComplexTypeRef wrapUniquePtr(@SuppressWarnings("unused") CppTypeRef content) {
    throw new TranspilerExecutionException("wrapping of unique pointers is not yet supported");
  }

  public static CppComplexTypeRef wrapSharedPtr(@SuppressWarnings("unused") CppTypeRef content) {
    throw new TranspilerExecutionException("wrapping of shared pointers is not yet supported");
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
    return "::"
        + (!nestedNameSpecifier.isEmpty() ? String.join("::", nestedNameSpecifier) + "::" : "")
        + unqualifiedId;
  }
}
