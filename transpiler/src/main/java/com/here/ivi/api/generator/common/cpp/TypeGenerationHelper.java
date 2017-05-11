package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.generator.cppstub.StubCommentParser;
import com.here.ivi.api.model.cppmodel.*;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

import java.util.logging.Logger;

public class TypeGenerationHelper {

    private static Logger logger = java.util.logging.Logger.getLogger(TypeGenerationHelper.class.getName());

    public static CppField buildCppField(CppNameRules nameRules,
                                         CppModelAccessor<? extends CppStubSpec.TypeCollectionPropertyAccessor> rootType,
                                         FField ffield,
                                         FFieldInitializer initializer) {

        FTypeRef typeRef = ffield.getType();
        CppField field = new CppField();
        field.name = nameRules.fieldName(ffield.getName());
        field.type = CppTypeMapper.map(rootType, typeRef);

        // if default values are specified in another object (see DefaultValueRules), use them
        if (initializer != null) {
            field.initializer = CppValueMapper.map(field.type, initializer.getValue(), nameRules);
        } else {
            field.initializer = CppDefaultInitializer.map(ffield);
        }
        return field;
    }

    public static CppConstant buildCppConstant(CppNameRules nameRules,
                                               CppModelAccessor<? extends CppStubSpec.TypeCollectionPropertyAccessor> rootModel,
                                               FConstantDef constantDef) {
        CppConstant constant = new CppConstant();

        // no need to check isArray here, it is redundant
        constant.type = CppTypeMapper.map(rootModel, constantDef.getType());
        constant.name = nameRules.constantName(constantDef.getName());
        constant.value = CppValueMapper.map(constant.type, constantDef.getRhs(), nameRules);

        return constant;
    }

    public static CppEnumClass buildCppEnumClass(CppNameRules nameRules, FEnumerationType enumerationType) {
        CppEnumClass enumClass = new CppEnumClass();
        enumClass.enumeration = buildCppEnum(nameRules, enumerationType);

        return enumClass;
    }

    public static CppEnum buildCppEnum(CppNameRules nameRules, FEnumerationType enumerationType) {
        CppEnum enumeration = new CppEnum();
        enumeration.comment = StubCommentParser.parse(enumerationType).getMainBodyText();
        enumeration.name = nameRules.enumName(enumerationType.getName());

        for (FEnumerator enumerator : enumerationType.getEnumerators()) {
            CppEnumItem item = new CppEnumItem();

            item.name = nameRules.enumEntryName(enumerator.getName());
            item.value = CppValueMapper.map(enumerator.getValue());
            item.comment = StubCommentParser.parse(enumerator).getMainBodyText();

            enumeration.items.add(item);
        }

        if (!enumeration.isValid()) {
            logger.warning("Invalid enum: " + enumerationType.getName());
        }

        return enumeration;
    }
}
