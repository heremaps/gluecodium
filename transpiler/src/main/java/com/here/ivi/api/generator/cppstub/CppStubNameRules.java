package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.generator.common.NameHelper;
import com.here.ivi.api.generator.common.cpp.CppDefaultNameRules;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaModel;
import navigation.CppStubSpec;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;

import java.io.File;
import java.util.List;
import java.util.Optional;

public class CppStubNameRules extends CppDefaultNameRules {

    private FrancaModel<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor> model;

    public CppStubNameRules(FrancaModel<CppStubSpec.InterfacePropertyAccessor,
                                    CppStubSpec.TypeCollectionPropertyAccessor> model) {
        this.model = model;
    }

    public List<String> namespace(FType type) {
        DefinedBy definer = DefinedBy.getDefinedBy(type);
        List<String> result = definer.getPackages();
        // complex structs are modelled as fidl structs encapsulated in type collections
        // such structs are translated to c++ without the containing type collection but taking its name
        if(!isComplexStruct(definer)) {
            result.add(typeCollectionName(definer.type));
        }
        return result;
    }

    public String cppTypename(FType type) {
        DefinedBy definer = DefinedBy.getDefinedBy(type);
        // complex structs are modelled as fidl structs encapsulated in type collections
        // such structs are translated to c++ without the containing type collection but taking its name
        if(isComplexStruct(definer)) {
            return definer.type.getName();
        }
        return type.getName();
    }

    public String className(FTypeCollection base) {
        return getClassName(base);
    }

    public String typeCollectionTarget(List<String> directories, FrancaModel.TypeCollection<?> tc) {
        return "stub" + File.separator + String.join(File.separator, directories) + File.separator + typeCollectionName(tc.fTypeCollection) + headerFileSuffix();
    }

    public String interfaceTarget(List<String> directories, FrancaModel.Interface<?> iface) {
        return "stub" + File.separator + String.join(File.separator, directories) + File.separator + className(iface.fInterface) + headerFileSuffix();
    }

    private boolean isComplexStruct(DefinedBy definer) {
        Optional<? extends CppStubSpec.IDataPropertyAccessor> acc =
                model.find(definer).map(FrancaModel.FrancaElement::getAccessor);

        if (!acc.isPresent()) {
            throw new RuntimeException("Could not find accessor. Invalid franca definition. " + definer);
        }
        try {
            //complex structs are defined exclusively inside type collections ...
            return (acc.get() instanceof CppStubSpec.TypeCollectionPropertyAccessor) &&
                    acc.get().getIsStructDefinition(definer.type);
        } catch (NullPointerException e) {
            //property is optional, if not set this could cause a null pointer exception
            return false;
        }
    }

    public static String listenerName(FInterface iface) {
        return getClassName(iface) + "Listener";
    }

    private static String getClassName(FTypeCollection base) {
        return NameHelper.toUpperCamel(base.getName()) + "Stub";
    }
}