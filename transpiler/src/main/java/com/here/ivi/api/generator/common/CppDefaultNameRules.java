package com.here.ivi.api.generator.common;

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.cppmodel.CppClass;

import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FType;
import com.here.ivi.api.generator.common.NameHelper;

import java.util.List;

public abstract class CppDefaultNameRules implements CppNameRules {

    public String typeCollectionName(FTypeCollection base) {
        return NameHelper.toUpperCamel(base.getName());// MyTypeCollection
    }

    public String methodName(String base) {
        return NameHelper.toLowerCamel(base); // doStuff
    }

    public String argumentName(String base) {
        return NameHelper.toLowerCamel(base); // myArg
    }

    public String constantName(String base) {
        return NameHelper.toUpperCamel(base); // MyConstant
    }

    public String enumName(String base) {
        return NameHelper.toUpperCamel(base); // MyEnum
    }

    public String enumEntryName(String base) {
        return NameHelper.toUpperCamel(base); // MyEnumEntry
    }

    public String fieldName(String base) {
        return NameHelper.toLowerCamel(base); // myField
    }

    public String structName(String base) {
        return NameHelper.toUpperCamel(base); // MyStruct
    }

    public String typedefName(String base) {
            return NameHelper.toUpperCamel(base); // MyTypedef
    }

    public List<String> packageToDirectoryStructure(List<String> packages) {
        return packages; // keep directory structure as package structure
    }

    public List<String> packageToNamespace(List<String> packages) {
        return packages; // keep namespace structure as package structure
    }

    public String headerFileSuffix() {
        return ".h";
    }
}