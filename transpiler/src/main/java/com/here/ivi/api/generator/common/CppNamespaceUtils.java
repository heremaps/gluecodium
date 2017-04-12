package com.here.ivi.api.generator.common;

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import navigation.CppStubSpec;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FStructType;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class CppNamespaceUtils {

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
        } catch(NullPointerException e) {
            //property is optional, if not set this could cause a null pointer exception
            return false;
        }
    }

    /** Creates a namespace prefix to access the type with `name` defined in `typeDefiner` from the `rootModel`
     *  Assumes the referenced type is in a TypeCollection namespace or part of an Interface */
    public static String prefixNamespace(CppModelAccessor rootModel,
                                         DefinedBy typeDefiner,
                                         FModelElement element) {

        List<String> names = builtDisjointNamespace(
                rootModel.getModelNamespace(),
                rootModel.getModelNamespace(typeDefiner.getPackages()));

        names.add(typeDefiner.getBaseName());

        // complex structs are modelled as fidl structs encapsulated in typecollections
        // such structs are translated to c++ without the containing type collection but taking its name
        if (!(element instanceof FStructType && isComplexStruct(rootModel,typeDefiner)))
        {
            names.add(element.getName());
        }

        return String.join("::", names);
    }

    /** Creates a namespace prefix to access the type with `name` defined in `typeDefiner` from the `rootModel`
     *  Assumes the referenced type is a Interface */
    public static String prefixInterfaceNamespace(CppModelAccessor rootModel,
                                                  DefinedBy typeDefiner,
                                                  String name) {

        List<String> names = builtDisjointNamespace(
                rootModel.getModelNamespace(),
                rootModel.getModelNamespace(typeDefiner.getPackages()));
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
    public static ArrayList<String> builtDisjointNamespace(String[] base, String[] target) {
        int i = 0;
        // find largest common part…
        for (; i < base.length && i < target.length; i++) {
            if (!base[i].equals(target[i])) {
                break;
            }
        }

        // … and strip it off
        return new ArrayList<>(Arrays.asList(target).subList(i, target.length));
    }
}
