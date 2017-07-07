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
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.cppmodel.CppCustomType;
import com.here.ivi.api.model.cppmodel.CppElements;
import com.here.ivi.api.model.cppmodel.CppPrimitiveType;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.cppmodel.CppTypeDefType;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import navigation.BaseApiSpec;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FArrayType;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FBroadcast;
import org.franca.core.franca.FConstantDef;
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

  public static CppType map(
      FrancaElement<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel,
      FAttribute attribute) {
    CppType type = CppTypeMapper.map(rootModel, attribute.getType());

    if (attribute.isArray()) {
      type =
          CppTypeMapper.wrapArrayType(
              new Includes.LazyInternalInclude(DefinedBy.createFromFrancaElement(rootModel)),
              type,
              CppTypeMapper.ArrayMode.map(rootModel, attribute));
    }

    return type;
  }

  public static CppType map(FrancaElement<?> rootModel, FConstantDef constant) {
    CppType type = CppTypeMapper.map(rootModel, constant.getType());

    if (constant.isArray()) {
      // FIXME impossible to define if a constant is a set or not inside Franca, always putting as vector
      // should have CppTypeMapper.ArrayMode.map(rootModel, constant)
      type =
          CppTypeMapper.wrapArrayType(
              new Includes.LazyInternalInclude(DefinedBy.createFromFrancaElement(rootModel)),
              type,
              ArrayMode.STD_VECTOR);
    }

    return type;
  }

  public static CppType map(FrancaElement<?> rootModel, FTypedElement typedElement) {
    CppType type = CppTypeMapper.map(rootModel, typedElement.getType());

    if (typedElement.isArray()) {
      type =
          CppTypeMapper.wrapArrayType(
              new Includes.LazyInternalInclude(DefinedBy.createFromFrancaElement(rootModel)),
              type,
              CppTypeMapper.ArrayMode.map(rootModel, typedElement));
    }

    return type;
  }

  public static CppType map(FrancaElement<?> rootModel, FTypeRef type) {

    if (type.getDerived() != null) {
      return mapDerived(rootModel, type);
    }

    if (type.getPredefined() != FBasicTypeId.UNDEFINED) {
      return mapPredefined(type);
    }

    return new CppCustomType("UNMAPPED FTYPEREF", CppElements.TypeInfo.Invalid);
  }

  private static CppType mapDerived(FrancaElement<?> rootModel, FTypeRef type) {
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

    return new CppCustomType("UNMAPPED DERIVED", CppElements.TypeInfo.Invalid);
  }

  private static CppType reportInvalidType(FrancaElement<?> rootModel, FTypeRef type) {
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

  private static CppType mapTypeDef(FrancaElement<?> rootModel, FTypeDef typedef) {
    DefinedBy typeDefDefiner = DefinedBy.createFromFModelElement(typedef);
    Includes.Include typeDefInclude =
        new Includes.LazyInternalInclude(typeDefDefiner, Includes.InternalType.Interface);

    if (typedef.getActualType() == null) {
      return new CppCustomType("NO ACTUAL TYPE FOUND", CppElements.TypeInfo.Invalid);
    } else if (InstanceRules.isInstanceId(typedef)) {

      // each Instance type is defined directly in the Interface that is refers to, this is already
      // resolved in the typeRefDefiner, and named as the interface

      String name = CppNameRules.getClassName(typeDefDefiner.type.getName());
      String namespacedName = CppNamespaceUtils.getCppTypename(rootModel, typeDefDefiner, name);

      return new CppCustomType(
          namespacedName, CppElements.TypeInfo.InterfaceInstance, typeDefInclude);
    } else {
      CppType actual = map(rootModel, typedef.getActualType());
      String namespacedName = CppNamespaceUtils.getCppTypename(rootModel, typedef);

      // actually use the typedef in this case, not the underlying type
      return new CppTypeDefType(namespacedName, actual, Collections.singletonList(typeDefInclude));
    }
  }

  private static CppCustomType mapArray(FrancaElement<?> rootModel, FArrayType array) {
    // lookup where array typedef came from, setup includes
    Includes.Include arrayInclude =
        new Includes.LazyInternalInclude(DefinedBy.createFromFModelElement(array));

    String typeName = array.getName(); // use name defined for array
    if (typeName != null) {

      typeName = CppNamespaceUtils.getCppTypename(rootModel, array);

      return new CppCustomType(typeName, CppElements.TypeInfo.Complex, arrayInclude);
    }

    FTypeRef elementType = array.getElementType();
    CppType actual = map(rootModel, elementType);

    // if no name is given, fallback to underlying type
    return wrapArrayType(arrayInclude, actual, ArrayMode.map(rootModel, array));
  }

  public static CppType defineArray(FrancaElement<?> rootModel, FArrayType array) {
    Includes.Include arrayInclude =
        new Includes.LazyInternalInclude(DefinedBy.createFromFModelElement(array));
    FTypeRef elementType = array.getElementType();
    CppType actual = map(rootModel, elementType);

    return wrapArrayType(arrayInclude, actual, ArrayMode.map(rootModel, array));
  }

  private enum ArrayMode {
    STD_VECTOR,
    STD_SET;

    public static ArrayMode map(FrancaElement<?> rootModel, FArrayType array) {
      return rootModel.getPropertyAccessor().getIsSet(array) ? STD_SET : STD_VECTOR;
    }

    public static ArrayMode map(FrancaElement<?> rootModel, FTypedElement typedElement) {

      boolean isSet = false;
      BaseApiSpec.IDataPropertyAccessor propertyAccessor = rootModel.getPropertyAccessor();
      if (typedElement instanceof FField) {
        isSet = propertyAccessor.getIsSet((FField) typedElement);
      } else if (propertyAccessor instanceof BaseApiSpec.InterfacePropertyAccessor) {
        BaseApiSpec.InterfacePropertyAccessor interfacePropertyAccessor =
            (BaseApiSpec.InterfacePropertyAccessor) propertyAccessor;
        if (typedElement instanceof FArgument) {
          isSet = interfacePropertyAccessor.getIsSet((FArgument) typedElement);
        } else if (typedElement instanceof FAttribute) {
          isSet = interfacePropertyAccessor.getIsSet((FAttribute) typedElement);
        }
      }

      return isSet ? STD_SET : STD_VECTOR;
    }
  }

  private static CppCustomType wrapArrayType(
      Includes.Include arrayInclude, CppType elementType, ArrayMode mode) {
    CppCustomType result;
    switch (mode) {
      case STD_VECTOR:
        result = wrapVector(elementType);
        break;
      case STD_SET:
        result = wrapSet(elementType);
        break;
      default:
        return null;
    }
    result.includes.add(arrayInclude);
    return result;
  }

  private static CppCustomType mapMap(FrancaElement<?> rootModel, FMapType map) {

    // lookup where map typedef came from, setup includes
    Includes.Include mapInclude =
        new Includes.LazyInternalInclude(DefinedBy.createFromFModelElement(map));

    if (map.getKeyType() == null || map.getValueType() == null) {
      return new CppCustomType("NO KEY OR VALUE TYPE FOUND", CppElements.TypeInfo.Invalid);
    } else {

      String typeName = map.getName(); // use name defined for map
      if (typeName != null) {

        typeName = CppNamespaceUtils.getCppTypename(rootModel, map);

        return new CppCustomType(typeName, CppElements.TypeInfo.Complex, mapInclude);
      }

      CppType key = map(rootModel, map.getKeyType());
      CppType value = map(rootModel, map.getValueType());

      // if no names are given, fallback to underlying type
      return wrapMapType(mapInclude, key, value);
    }
  }

  public static CppCustomType mapStruct(FrancaElement<?> rootModel, FStructType struct) {

    if (struct.getElements().isEmpty()) {
      return new CppCustomType("EMPTY STRUCT", CppElements.TypeInfo.Invalid);
    } else {
      Includes.Include structInclude =
          new Includes.LazyInternalInclude(DefinedBy.createFromFModelElement(struct));
      String typeName = CppNamespaceUtils.getCppTypename(rootModel, struct);

      return new CppCustomType(typeName, CppElements.TypeInfo.Complex, structInclude);
    }
  }

  public static CppCustomType mapEnum(FrancaElement<?> rootModel, FEnumerationType enumeration) {

    if (enumeration.getEnumerators().isEmpty()) {
      return new CppCustomType("EMPTY ENUM", CppElements.TypeInfo.Invalid);
    } else {
      Includes.Include enumInclude =
          new Includes.LazyInternalInclude(DefinedBy.createFromFModelElement(enumeration));
      String typeName = CppNamespaceUtils.getCppTypename(rootModel, enumeration);

      return new CppCustomType(typeName, CppElements.TypeInfo.Enumeration, enumInclude);
    }
  }

  public static CppCustomType wrapMapType(Includes.Include mapInclude, CppType key, CppType value) {

    String mapType = "std::map< " + key.name + ", " + value.name + " >";

    // include key type, value type and the map
    Set<Includes.Include> includes = new HashSet<>(key.includes);
    includes.addAll(key.includes);
    includes.addAll(value.includes);
    includes.add(CppLibraryIncludes.MAP);
    includes.add(mapInclude);

    return new CppCustomType(mapType, CppElements.TypeInfo.Complex, includes);
  }

  private static CppCustomType wrapStdTemplateType(
      CppType content, String templateName, Includes.Include libraryInclude) {

    String mapType = "std::" + templateName + "< " + content.name + " >";

    Set<Includes.Include> includes = new HashSet<>(content.includes);
    includes.add(libraryInclude);

    return new CppCustomType(mapType, CppElements.TypeInfo.Complex, includes);
  }

  public static CppCustomType wrapUniquePtr(CppType content) {
    return wrapStdTemplateType(content, "unique_ptr", CppLibraryIncludes.MEMORY);
  }

  public static CppCustomType wrapSharedPtr(CppType content) {
    return wrapStdTemplateType(content, "shared_ptr", CppLibraryIncludes.MEMORY);
  }

  public static CppCustomType wrapWeakPtr(CppType content) {
    return wrapStdTemplateType(content, "weak_ptr", CppLibraryIncludes.MEMORY);
  }

  public static CppCustomType wrapVector(CppType content) {
    return wrapStdTemplateType(content, "vector", CppLibraryIncludes.VECTOR);
  }

  public static CppCustomType wrapSet(CppType content) {
    return wrapStdTemplateType(content, "set", CppLibraryIncludes.SET);
  }

  private static CppType mapPredefined(final FTypeRef type) {

    switch (type.getPredefined().getValue()) {
      case FBasicTypeId.BOOLEAN_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.BOOL);
      case FBasicTypeId.FLOAT_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.FLOAT);
      case FBasicTypeId.DOUBLE_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.DOUBLE);
      case FBasicTypeId.INT8_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.INT8);
      case FBasicTypeId.INT16_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.INT16);
      case FBasicTypeId.INT32_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.INT32);
      case FBasicTypeId.INT64_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.INT64);
      case FBasicTypeId.UINT8_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.UINT8);
      case FBasicTypeId.UINT16_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.UINT16);
      case FBasicTypeId.UINT32_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.UINT32);
      case FBasicTypeId.UINT64_VALUE:
        return new CppPrimitiveType(CppPrimitiveType.Type.UINT64);
      case FBasicTypeId.STRING_VALUE:
        return new CppCustomType(
            CppCustomType.STRING_TYPE_NAME,
            CppElements.TypeInfo.Complex,
            CppLibraryIncludes.STRING);
      case FBasicTypeId.BYTE_BUFFER_VALUE:
        return new CppCustomType(
            "std::vector< uint8_t >", CppElements.TypeInfo.Complex, CppLibraryIncludes.VECTOR);
      default:
        return new CppCustomType(
            "UNMAPPED PREDEFINED [" + type.getPredefined().getName() + "]",
            CppElements.TypeInfo.Invalid);
    }
  }
}
