package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.generator.common.templates.*;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cppmodel.*;

public class CppTemplateDelegator {
    public CharSequence generate(CppNamespace ns) {
        return CppNamespaceTemplate.generate(this, ns);
    }
    public CharSequence generate(CppConstant constant) {
        return CppConstantTemplate.generate(constant);
    }
    public CharSequence generate(CppEnum cppEnum) {
        return CppEnumTemplate.generate(cppEnum);
    }
    public CharSequence generate(CppEnumClass cppEnum) {
        return CppEnumClassTemplate.generate(cppEnum);
    }
    public CharSequence generate(CppStruct struct) {
        return CppPureStructTemplate.generate(struct);
    }
    public CharSequence generate(CppTypeDef typeDef) {
        return CppTypeDefTemplate.generate(typeDef);
    }
    public CharSequence generate(CppClass cppClass) {
        return CppClassTemplate.generate(cppClass);
    }
    public CharSequence generate(Includes.Include include) {
        return CppIncludeTemplate.generate(include);
    }
}
