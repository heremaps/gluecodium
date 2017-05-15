package com.here.ivi.api.generator.common.cpp;

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import org.franca.core.franca.*;

import java.util.List;

public class CppNamespaceUtils {
    /** Creates a cpp typename including namespace prefix to access the type 'element' defined from the 'rootModel'
     *  Assumes the referenced type is in a TypeCollection namespace or part of an Interface */
    public static String getCppTypename(CppModelAccessor<?> rootModel,
                                        FType element) {
        List<String> names = builtDisjointNamespace(
                rootModel.getNamespace(),
                rootModel.getRules().namespace(element));

        names.add(rootModel.getRules().cppTypename(element));

        return String.join("::", names);
    }

    /** Creates a cpp typename  including namespace prefix to access the type with 'name' defined in 'typeDefiner' from the 'rootModel' */
    public static String getCppTypename(CppModelAccessor<?> rootModel,
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
        // find largest common part...
        for (; i < base.size() && i < target.size(); i++) {
            if (!base.get(i).equals(target.get(i))) {
                break;
            }
        }

        // ... and strip it off
        return target.subList(i, target.size());
    }
}
