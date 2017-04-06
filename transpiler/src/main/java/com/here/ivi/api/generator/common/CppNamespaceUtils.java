package com.here.ivi.api.generator.common;

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CppNamespaceUtils {
    /** Creates a namespace prefix to access the type with `name` defined in `typeDefiner` from the `rootModel`
     *  Assumes the referenced type is in a TypeCollection namespace or part of an Interface */
    public static String prefixNamespace(CppModelAccessor rootModel,
                                  DefinedBy typeDefiner,
                                  String name) {

        List<String> names = builtDisjointNamespace(
                rootModel.getModelNamespace(),
                rootModel.getModelNamespace(typeDefiner.getPackages()));
        names.add(typeDefiner.getBaseName());
        names.add(name);

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

    /**
     * Find the TypeCollection that contains this type by moving up the hierarchy recursively
     *
     * @param obj The franca object
     * @return The type collection that contains this type
     */
    public static FTypeCollection findDefiningTypeCollection(EObject obj) {
        if (obj instanceof FTypeCollection) {
            return (FTypeCollection)obj; // FInterface is a FTypeCollection as well
        }

        EObject parent = obj.eContainer();

        if ((parent == obj) || (parent == null)) {
            return null;
        }

        return findDefiningTypeCollection(parent);
    }

    /**
     * Gets the  model and interface that defined the given franca object
     * @param obj The franca object
     * @return The model and interface that defined the given object
     */
    public static DefinedBy getDefinedBy(EObject obj) {
        // search for parent type collection
        FTypeCollection tc = findDefiningTypeCollection(obj);

        if (tc == null || !(tc.eContainer() instanceof FModel)) {
            throw new RuntimeException("Could not resolve root of EObject. Invalid franca definition. " + obj);
        }

        FModel model = (FModel)tc.eContainer();
        return new DefinedBy(tc, model);
    }
}
