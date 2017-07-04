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

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.common.cpp.*;
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.rules.InstanceRules;
import java.util.List;
import org.franca.core.franca.*;

public final class TypeCollectionMapper implements CppModelMapper {

  @Override
  public CppNamespace mapFrancaModelToCppModel(FrancaElement<?> typeCollection) {

    List<String> namespaceName =
        CppNameRules.getNamespace(DefinedBy.createFromFrancaElement(typeCollection));
    namespaceName.add(
        CppNameRules.getTypeCollectionName(typeCollection.getFrancaTypeCollection().getName()));

    CppNamespace result = new CppNamespace(namespaceName);

    for (FType type : typeCollection.getFrancaTypeCollection().getTypes()) {
      // struct
      if (type instanceof FStructType) {
        result.members.add(buildCppStruct((FStructType) type, typeCollection));
      } else if (type instanceof FTypeDef) {

        FTypeDef typeDef = (FTypeDef) type;
        // skip the typedefs for instanceId typedefs as these types are purely internal
        if (InstanceRules.isInstanceId(typeDef)) {
          continue;
        }
        result.members.add(buildTypeDef(typeDef, typeCollection));
      } else if (type instanceof FArrayType) {
        result.members.add(buildArray((FArrayType) type, typeCollection));
      } else if (type instanceof FMapType) {
        result.members.add(buildMap((FMapType) type, typeCollection));
      } else if (type instanceof FEnumerationType) {
        result.members.add(TypeGenerationHelper.buildCppEnumClass((FEnumerationType) type));
      } else {
        throw new TranspilerExecutionException(
            String.format(
                "Missing type map in %s for %s.", typeCollection, type.getClass().getName()));
      }
    }

    // constants
    for (FConstantDef constantDef : typeCollection.getFrancaTypeCollection().getConstants()) {
      CppConstant constant = TypeGenerationHelper.buildCppConstant(typeCollection, constantDef);
      constant.comment = StubCommentParser.parse(constantDef).getMainBodyText();

      if (constant.isValid()) {
        result.members.add(constant);
      } else {
        throw new TranspilerExecutionException(
            String.format(
                "Failed generating constant! %s %s.",
                constantDef.getName(), constantDef.getRhs().getClass()));
      }
    }

    return result;
  }

  private CppElement buildMap(FMapType type, FrancaElement<?> rootModel) {
    CppTypeDef typeDef = new CppTypeDef();
    typeDef.comment = StubCommentParser.parse(type).getMainBodyText();
    typeDef.name = CppNameRules.getTypedefName(type.getName());
    typeDef.targetType =
        CppTypeMapper.wrapMapType(
            new Includes.LazyInternalInclude(DefinedBy.createFromFModelElement(type)),
            CppTypeMapper.map(rootModel, type.getKeyType()),
            CppTypeMapper.map(rootModel, type.getValueType()));

    return typeDef;
  }

  private CppElement buildTypeDef(FTypeDef type, FrancaElement<?> rootModel) {
    CppTypeDef typeDef = new CppTypeDef();
    typeDef.comment = StubCommentParser.parse(type).getMainBodyText();
    typeDef.name = CppNameRules.getTypedefName(type.getName());
    typeDef.targetType = CppTypeMapper.map(rootModel, type.getActualType());

    return typeDef;
  }

  private CppElement buildArray(FArrayType type, FrancaElement<?> rootModel) {
    CppTypeDef typeDef = new CppTypeDef();
    typeDef.comment = StubCommentParser.parse(type).getMainBodyText();
    typeDef.name = CppNameRules.getTypedefName(type.getName());
    typeDef.targetType = CppTypeMapper.defineArray(rootModel, type);

    return typeDef;
  }

  private CppStruct buildCppStruct(FStructType structType, FrancaElement<?> rootModel) {
    CppStruct struct = new CppStruct();
    struct.comment = StubCommentParser.parse(structType).getMainBodyText();
    struct.name = CppNameRules.getStructName(structType.getName());

    for (FField fieldInfo : structType.getElements()) {
      CppField field = TypeGenerationHelper.buildCppField(rootModel, fieldInfo, null);
      field.comment = StubCommentParser.parse(fieldInfo).getMainBodyText();
      struct.fields.add(field);
    }

    return struct;
  }
}
