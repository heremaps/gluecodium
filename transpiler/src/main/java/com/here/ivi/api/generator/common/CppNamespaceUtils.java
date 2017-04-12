package com.here.ivi.api.generator.common;

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class CppNamespaceUtils {
    /** Creates a namespace prefix to access the type with `name` defined in `typeDefiner` from the `rootModel`
     *  Assumes the referenced type is in a TypeCollection namespace or part of an Interface */
    public static String prefixNamespace(CppModelAccessor<?> rootModel,
                                         DefinedBy typeDefiner,
                                         FModelElement element) {
        List<String> names = builtDisjointNamespace(
                rootModel.getNamespace(),
                rootModel.getRules().packageToNamespace(typeDefiner.getPackages()));

        names.addAll(applyNamingRules(rootModel, typeDefiner, element));

        return String.join("::", names);
    }

    /** Creates a namespace prefix to access the type with `name` defined in `typeDefiner` from the `rootModel` */
    public static String prefixNamespace(CppModelAccessor<?> rootModel,
                                         DefinedBy typeDefiner,
                                         String name) {
        List<String> names = builtDisjointNamespace(
                rootModel.getNamespace(),
                rootModel.getRules().packageToNamespace(typeDefiner.getPackages()));
        names.add(name);
        return String.join("::", names);
    }

    /**
     * Creates the namespace needed to reference a type in the target namespace from the base
     * namespace:
     *
     * e.g. for b: navigation.guidance, t: navigation.routing - the result will be routing
     *      for b: com.here.test,       t: navigation.routing - the result will be navigation.routing
     */
    private static List<String> builtDisjointNamespace(List<String> base, List<String> target) {
        int i = 0;
        // find largest common part…
        for (; i < base.size() && i < target.size(); i++) {
            if (!base.get(i).equals(target.get(i))) {
                break;
            }
        }

        // … and strip it off
        return target.subList(i, target.size());
    }

    private static boolean isComplexStruct(CppModelAccessor<?> rootModel, DefinedBy definer)
    {
        Optional<? extends CppStubSpec.IDataPropertyAccessor> acc = rootModel.getAccessor(definer);
        if (!acc.isPresent() ) {
            throw new RuntimeException("Could not find accessor. Invalid franca definition. " + definer);
        }
        try {
            //complex structs are defined exclusively inside typecollections ...
            return (acc.get() instanceof CppStubSpec.TypeCollectionPropertyAccessor) &&
                    acc.get().getIsStructDefinition(definer.type);
        } catch (NullPointerException e) {
            //property is optional, if not set this could cause a null pointer exception
            return false;
        }
    }

    private static List<String> applyNamingRules(CppModelAccessor<?> rootModel,
                                                 DefinedBy typeDefiner,
                                                 FModelElement element) {

        List<String> names = new ArrayList<>();
        names.add(rootModel.getRules().typeCollectionName(typeDefiner.getBaseName()));

        // complex structs are modelled as fidl structs encapsulated in typecollections
        // such structs are translated to c++ without the containing type collection but taking its name
        boolean addElementName = !(element instanceof FStructType && isComplexStruct(rootModel, typeDefiner));

        if (addElementName) {
            String name = element.getName();

            if (element instanceof FEnumerationType) {
                name = rootModel.getRules().enumName(name);
            } else if (element instanceof FStructType) {
                name = rootModel.getRules().structName(name);
            } else if (element instanceof FTypeDef) {
                name = rootModel.getRules().typedefName(name);
            } else if (element instanceof FMapType) {
                name = rootModel.getRules().typedefName(name);
            } else if (element instanceof FArrayType) {
                name = rootModel.getRules().typedefName(name);
            }

            names.add(name);
        }

        return names;
    }
}
