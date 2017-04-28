package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaModel;
import navigation.CppStubSpec;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;

import java.util.Optional;


public abstract class CppDefaultNameRules implements CppNameRules {

    protected FrancaModel<? extends CppStubSpec.InterfacePropertyAccessor, ? extends CppStubSpec.TypeCollectionPropertyAccessor> model;

    public CppDefaultNameRules(FrancaModel<? extends CppStubSpec.InterfacePropertyAccessor,
            ? extends CppStubSpec.TypeCollectionPropertyAccessor> model) {
        this.model = model;
    }

    protected boolean isComplexStruct(DefinedBy definer) {
        Optional<? extends CppStubSpec.IDataPropertyAccessor> accessor =
                model.find(definer).map(FrancaModel.FrancaElement::getAccessor);

        if (!accessor.isPresent()) {
            throw new RuntimeException("Could not find accessor. Invalid franca definition. " + definer);
        }
        try {
            //complex structs are defined exclusively inside type collections ...
            return (accessor.get() instanceof CppStubSpec.TypeCollectionPropertyAccessor) &&
                    accessor.get().getIsStructDefinition(definer.type);
        } catch (NullPointerException e) {
            //property is optional, if not set this could cause a null pointer exception
            return false;
        }
    }

    public String cppTypename(FType type) {
        DefinedBy definer = DefinedBy.getDefinedBy(type);
        // complex structs are modelled as fidl structs encapsulated in type collections
        // such structs are translated to c++ without the containing type collection but taking its name
        return isComplexStruct(definer) ? definer.type.getName() : type.getName();
    }

    public String typeCollectionName(FTypeCollection base) {
        return NameHelper.toUpperCamel(base.getName());// MyTypeCollection
    }

    public String methodName(String base) {
        return NameHelper.toLowerCamel(base); // doStuff
    }

    public String argumentName(String base) {
        return NameHelper.toLowerCamel(base); // myArg
    }

    public String enumName(String base) {
        return NameHelper.toUpperCamel(base); // MyEnum
    }

    public String structName(String base) {
        return NameHelper.toUpperCamel(base); // MyStruct
    }

    public String typedefName(String base) {
        return NameHelper.toUpperCamel(base); // MyTypedef
    }

    public String headerFileSuffix() {
        return ".h";
    }
}
