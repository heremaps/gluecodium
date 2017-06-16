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

import com.google.common.collect.Sets;
import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cppmodel.CppElements;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.HashSet;
import java.util.Set;
import navigation.BaseApiSpec;
import org.franca.core.franca.*;

public class CppTypeMapper {

  public static CppType map(
      CppModelAccessor<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel,
      FArgument argument) {
    CppType type = CppTypeMapper.map(rootModel, argument.getType());

    if (argument.isArray()) {
      type =
          CppTypeMapper.wrapArrayType(
              rootModel.getDefiner(),
              type,
              CppTypeMapper.ArrayMode.map(rootModel, argument),
              rootModel.getRules());
    }

    return type;
  }

  public static CppType map(
      CppModelAccessor<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel,
      FAttribute attribute) {
    CppType type = CppTypeMapper.map(rootModel, attribute.getType());

    if (attribute.isArray()) {
      type =
          CppTypeMapper.wrapArrayType(
              rootModel.getDefiner(),
              type,
              CppTypeMapper.ArrayMode.map(rootModel, attribute),
              rootModel.getRules());
    }

    return type;
  }

  public static CppType map(CppModelAccessor<?> rootModel, FConstantDef constant) {
    CppType type = CppTypeMapper.map(rootModel, constant.getType());

    if (constant.isArray()) {
      // FIXME impossible to define if a constant is a set or not inside Franca, always putting as vector
      // should have CppTypeMapper.ArrayMode.map(rootModel, constant)
      type =
          CppTypeMapper.wrapArrayType(
              rootModel.getDefiner(), type, ArrayMode.STD_VECTOR, rootModel.getRules());
    }

    return type;
  }

  public static CppType map(CppModelAccessor<?> rootModel, FField field) {
    CppType type = CppTypeMapper.map(rootModel, field.getType());

    if (field.isArray()) {
      type =
          CppTypeMapper.wrapArrayType(
              rootModel.getDefiner(),
              type,
              CppTypeMapper.ArrayMode.map(rootModel, field),
              rootModel.getRules());
    }

    return type;
  }

  public static CppType map(CppModelAccessor<?> rootModel, FTypeRef type) {

    if (type.getDerived() != null) {
      return mapDerived(rootModel, type);
    }

    if (type.getPredefined() != FBasicTypeId.UNDEFINED) {
      return mapPredefined(type);
    }

    return new CppType();
  }

  private static CppType mapDerived(CppModelAccessor<?> rootModel, FTypeRef type) {
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

    return new CppType(null, "UNMAPPED DERIVED", CppElements.TypeInfo.Invalid);
  }

  private static CppType reportInvalidType(CppModelAccessor<?> rootModel, FTypeRef type) {
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

  private static CppType mapTypeDef(CppModelAccessor<?> rootModel, FTypeDef typedef) {
    DefinedBy typeRefDefiner = DefinedBy.createFromFModelElement(typedef);

    if (typedef.getActualType() == null) {
      return new CppType(typeRefDefiner, "NO ACTUAL TYPE FOUND", CppElements.TypeInfo.Invalid);
    } else if (InstanceRules.isInstanceId(typedef)) {
      Includes.Include include =
          new Includes.LazyInternalInclude(
              typeRefDefiner, Includes.InternalType.Interface, rootModel.getRules());

      // each Instance type is defined directly in the Interface that is refers to, this is already
      // resolved in the typeRefDefiner, and named as the interface

      String name = rootModel.getRules().getClassName(typeRefDefiner.type);
      String namespacedName = CppNamespaceUtils.getCppTypename(rootModel, typeRefDefiner, name);

      return new CppType(
          typeRefDefiner, namespacedName, CppElements.TypeInfo.InterfaceInstance, include);
    } else {
      CppType actual = map(rootModel, typedef.getActualType());
      DefinedBy actualTypeDefiner = actual.definedIn;

      // lookup where type came from, setup includes
      Includes.Include include =
          new Includes.LazyInternalInclude(actualTypeDefiner, rootModel.getRules());

      String namespacedName = CppNamespaceUtils.getCppTypename(rootModel, typedef);
      // actually use the typedef in this case, not the underlying type
      return new CppType(typeRefDefiner, namespacedName, actual.info, include);
    }
  }

  private static CppType mapArray(CppModelAccessor<?> rootModel, FArrayType array) {
    DefinedBy arrayDefiner = DefinedBy.createFromFModelElement(array);

    String typeName = array.getName(); // use name defined for array
    if (typeName != null) {
      // lookup where array typedef came from, setup includes
      Set<Includes.Include> includes =
          Sets.newHashSet(new Includes.LazyInternalInclude(arrayDefiner, rootModel.getRules()));

      typeName = CppNamespaceUtils.getCppTypename(rootModel, array);

      return new CppType(arrayDefiner, typeName, CppElements.TypeInfo.Complex, includes);
    }

    FTypeRef elementType = array.getElementType();
    CppType actual = map(rootModel, elementType);

    // if no name is given, fallback to underlying type
    return wrapArrayType(
        arrayDefiner, actual, ArrayMode.map(rootModel, array), rootModel.getRules());
  }

  public static CppType defineArray(CppModelAccessor<?> rootModel, FArrayType array) {
    DefinedBy arrayDefiner = DefinedBy.createFromFModelElement(array);
    FTypeRef elementType = array.getElementType();
    CppType actual = map(rootModel, elementType);

    return wrapArrayType(
        arrayDefiner, actual, ArrayMode.map(rootModel, array), rootModel.getRules());
  }

  private enum ArrayMode {
    STD_VECTOR,
    STD_SET;

    public static ArrayMode map(CppModelAccessor<?> rootModel, FArrayType array) {
      return rootModel.getAccessor().getIsSet(array) ? STD_SET : STD_VECTOR;
    }

    public static ArrayMode map(CppModelAccessor<?> rootModel, FField field) {
      return rootModel.getAccessor().getIsSet(field) ? STD_SET : STD_VECTOR;
    }

    public static ArrayMode map(
        CppModelAccessor<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel,
        FArgument argument) {
      return rootModel.getAccessor().getIsSet(argument) ? STD_SET : STD_VECTOR;
    }

    public static ArrayMode map(
        CppModelAccessor<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel,
        FAttribute argument) {
      return rootModel.getAccessor().getIsSet(argument) ? STD_SET : STD_VECTOR;
    }
  }

  private static CppType wrapArrayType(
      DefinedBy definedIn, CppType elementType, ArrayMode mode, CppNameRules nameRules) {
    CppType result;
    switch (mode) {
      case STD_VECTOR:
        result = wrapVector(elementType, nameRules);
        break;
      case STD_SET:
        result = wrapSet(elementType, nameRules);
        break;
      default:
        return null;
    }
    result.definedIn = definedIn;
    return result;
  }

  private static CppType mapMap(CppModelAccessor<?> rootModel, FMapType map) {
    DefinedBy mapDefiner = DefinedBy.createFromFModelElement(map);

    if (map.getKeyType() == null || map.getValueType() == null) {
      return new CppType(mapDefiner, "NO KEY OR VALUE TYPE FOUND", CppElements.TypeInfo.Invalid);
    } else {

      String typeName = map.getName(); // use name defined for map
      if (typeName != null) {
        // lookup where map typedef came from, setup includes
        Set<Includes.Include> includes =
            Sets.newHashSet(new Includes.LazyInternalInclude(mapDefiner, rootModel.getRules()));
        typeName = CppNamespaceUtils.getCppTypename(rootModel, map);

        return new CppType(mapDefiner, typeName, CppElements.TypeInfo.Complex, includes);
      }

      CppType key = map(rootModel, map.getKeyType());
      CppType value = map(rootModel, map.getValueType());

      // if no names are given, fallback to underlying type
      return wrapMapType(mapDefiner, key, value, rootModel.getRules());
    }
  }

  public static CppType mapStruct(CppModelAccessor<?> rootModel, FStructType struct) {
    DefinedBy structDefiner = DefinedBy.createFromFModelElement(struct);

    if (struct.getElements().isEmpty()) {
      return new CppType(structDefiner, "EMPTY STRUCT", CppElements.TypeInfo.Invalid);
    } else {
      Includes.Include include =
          new Includes.LazyInternalInclude(structDefiner, rootModel.getRules());
      String typeName = CppNamespaceUtils.getCppTypename(rootModel, struct);

      return new CppType(structDefiner, typeName, CppElements.TypeInfo.Complex, include);
    }
  }

  public static CppType mapEnum(CppModelAccessor<?> rootModel, FEnumerationType enumeration) {
    DefinedBy enumDefiner = DefinedBy.createFromFModelElement(enumeration);

    if (enumeration.getEnumerators().isEmpty()) {
      return new CppType(enumDefiner, "EMPTY ENUM", CppElements.TypeInfo.Invalid);
    } else {
      Includes.Include include =
          new Includes.LazyInternalInclude(enumDefiner, rootModel.getRules());
      String typeName = CppNamespaceUtils.getCppTypename(rootModel, enumeration);

      return new CppType(enumDefiner, typeName, CppElements.TypeInfo.BuiltIn, include);
    }
  }

  public static CppType wrapMapType(
      DefinedBy mapDefiner, CppType key, CppType value, CppNameRules nameRules) {
    // lookup where map types came from, setup includes
    Includes.Include keyInclude = new Includes.LazyInternalInclude(key.definedIn, nameRules);
    Includes.Include valueInclude = new Includes.LazyInternalInclude(value.definedIn, nameRules);

    String mapType = "std::map< " + key.name + ", " + value.name + " >";

    // include key type, value type and the map
    Set<Includes.Include> includes = new HashSet<>(key.includes);
    includes.add(keyInclude);
    includes.add(valueInclude);
    includes.add(CppLibraryIncludes.MAP);

    return new CppType(mapDefiner, mapType, CppElements.TypeInfo.Complex, includes);
  }

  private static CppType wrapStdTemplateType(
      CppType content,
      String templateName,
      Includes.Include libraryInclude,
      CppNameRules nameRules) {
    // lookup where content type came from, setup includes
    Includes.Include typeInclude = new Includes.LazyInternalInclude(content.definedIn, nameRules);

    String mapType = "std::" + templateName + "< " + content.name + " >";

    Set<Includes.Include> includes = new HashSet<>(content.includes);
    includes.add(typeInclude);
    includes.add(libraryInclude);

    return new CppType(content.definedIn, mapType, CppElements.TypeInfo.Complex, includes);
  }

  public static CppType wrapUniquePtr(CppType content, CppNameRules nameRules) {
    return wrapStdTemplateType(content, "unique_ptr", CppLibraryIncludes.MEMORY, nameRules);
  }

  public static CppType wrapSharedPtr(CppType content, CppNameRules nameRules) {
    return wrapStdTemplateType(content, "shared_ptr", CppLibraryIncludes.MEMORY, nameRules);
  }

  public static CppType wrapWeakPtr(CppType content, CppNameRules nameRules) {
    return wrapStdTemplateType(content, "weak_ptr", CppLibraryIncludes.MEMORY, nameRules);
  }

  public static CppType wrapVector(CppType content, CppNameRules nameRules) {
    return wrapStdTemplateType(content, "vector", CppLibraryIncludes.VECTOR, nameRules);
  }

  public static CppType wrapSet(CppType content, CppNameRules nameRules) {
    return wrapStdTemplateType(content, "set", CppLibraryIncludes.SET, nameRules);
  }

  private static CppType mapPredefined(FTypeRef type) {
    DefinedBy definer = DefinedBy.createFromFModelElement(type);

    switch (type.getPredefined().getValue()) {
      case FBasicTypeId.BOOLEAN_VALUE:
        return new CppType(definer, "bool", CppElements.TypeInfo.BuiltIn);
      case FBasicTypeId.FLOAT_VALUE:
        return new CppType(definer, "float", CppElements.TypeInfo.BuiltIn);
      case FBasicTypeId.DOUBLE_VALUE:
        return new CppType(definer, "double", CppElements.TypeInfo.BuiltIn);
      case FBasicTypeId.INT8_VALUE:
        return new CppType(
            definer, "int8_t", CppElements.TypeInfo.BuiltIn, CppLibraryIncludes.INT_TYPES);
      case FBasicTypeId.INT16_VALUE:
        return new CppType(
            definer, "int16_t", CppElements.TypeInfo.BuiltIn, CppLibraryIncludes.INT_TYPES);
      case FBasicTypeId.INT32_VALUE:
        return new CppType(
            definer, "int32_t", CppElements.TypeInfo.BuiltIn, CppLibraryIncludes.INT_TYPES);
      case FBasicTypeId.INT64_VALUE:
        return new CppType(
            definer, "int64_t", CppElements.TypeInfo.BuiltIn, CppLibraryIncludes.INT_TYPES);
      case FBasicTypeId.UINT8_VALUE:
        return new CppType(
            definer, "uint8_t", CppElements.TypeInfo.BuiltIn, CppLibraryIncludes.INT_TYPES);
      case FBasicTypeId.UINT16_VALUE:
        return new CppType(
            definer, "uint16_t", CppElements.TypeInfo.BuiltIn, CppLibraryIncludes.INT_TYPES);
      case FBasicTypeId.UINT32_VALUE:
        return new CppType(
            definer, "uint32_t", CppElements.TypeInfo.BuiltIn, CppLibraryIncludes.INT_TYPES);
      case FBasicTypeId.UINT64_VALUE:
        return new CppType(
            definer, "uint64_t", CppElements.TypeInfo.BuiltIn, CppLibraryIncludes.INT_TYPES);
      case FBasicTypeId.STRING_VALUE:
        return new CppType(
            definer, "std::string", CppElements.TypeInfo.Complex, CppLibraryIncludes.STRING);
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new CppType(
            definer,
            "std::vector< uint8_t >",
            CppElements.TypeInfo.Complex,
            CppLibraryIncludes.VECTOR);
      default:
        return new CppType(
            definer,
            "UNMAPPED PREDEFINED [" + type.getPredefined().getName() + "]",
            CppElements.TypeInfo.Invalid);
    }
  }
}
