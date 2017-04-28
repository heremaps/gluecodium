package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.cpp.CppTypeMapper;
import com.here.ivi.api.generator.common.cpp.CppValueMapper;
import com.here.ivi.api.model.cppmodel.CppConstant;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import navigation.CppStubSpec;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FField;
import org.franca.core.franca.FFieldInitializer;
import org.franca.core.franca.FTypeRef;

public class TypeGenerationHelper {

    public static CppField buildCppField(CppNameRules nameRules,
                                         CppModelAccessor<? extends CppStubSpec.TypeCollectionPropertyAccessor> rootType,
                                         FField ffield,
                                         FFieldInitializer initializer) {

        FTypeRef typeRef = ffield.getType();
        CppField field = new CppField();
        field.name = nameRules.fieldName(ffield.getName());
        field.type = CppTypeMapper.map(rootType, typeRef);
        if (initializer != null) {
            field.initializer = CppValueMapper.map(field.type, initializer.getValue());
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
        constant.value = CppValueMapper.map(constant.type, constantDef.getRhs());

        return constant;
    }
}
