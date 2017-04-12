package com.here.ivi.api.generator.cppstub.templates

import com.here.ivi.api.generator.common.templates.CppNameRules
import com.here.ivi.api.generator.common.NameHelper
import java.io.File
import java.util.List
import com.here.ivi.api.model.FrancaModel

class CppStubNameRules implements CppNameRules {

    override typeCollectionName(String base) '''
        «NameHelper.toUpperCamel(base)»''' // MyTypeCollection

    override String className(String base) '''
        «NameHelper.toUpperCamel(base)»Stub''' // MyClassStub

    override String methodName(String base) '''
        «NameHelper.toSnakeCase(base)»''' // doStuff

    override String argumentName(String base) '''
        «NameHelper.toSnakeCase(base)»''' // myArg

    override String constantName(String base) '''
        «NameHelper.toUpperCamel(base)»''' // MyConstant

    override String enumName(String base) '''
        «NameHelper.toUpperCamel(base)»''' // MyEnum

    override String enumEntryName(String base) '''
        «NameHelper.toUpperCamel(base)»''' // MyEnumEntry

    override String fieldName(String base) '''
        «NameHelper.toLowerCamel(base)»''' // myField

    override String structName(String base) '''
        «NameHelper.toUpperCamel(base)»''' // MyStruct

    override String typedefName(String base) '''
        «NameHelper.toUpperCamel(base)»''' // MyTypedef

    override List<String> packageToDirectoryStructure(List<String> packages) {
        return packages // keep directory structure as package structure
    }

    override List<String> packageToNamespace(List<String> packages) {
        return packages // keep namespace structure as package structure
    }

    override String headerFileSuffix() {
        '.h'
    }

    override String typeCollectionTarget(List<String> directories, FrancaModel.TypeCollection<?> tc) {
        "stub" + File.separator + String.join(File.separator, directories) + File.separator + typeCollectionName(tc.getName()) + headerFileSuffix();
    }

    override String interfaceTarget(List<String> directories, FrancaModel.Interface<?> iface) {
        "stub" + File.separator + String.join(File.separator, directories) + File.separator + className(iface.getName()) + headerFileSuffix();
    }
}
