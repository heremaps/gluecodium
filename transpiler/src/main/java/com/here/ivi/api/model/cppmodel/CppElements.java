package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.Includes;

import java.util.*;

public class CppElements {

    public static final String CONST_QUALIFIER = "const";
    public static final String REF_QUALIFIER = "&";
    public static final String POINTER = "*";

    public enum Visibility {
        Default,
        Public,
        Protected,
        Private
    }

    public enum TypeInfo {
        Invalid,
        BuiltIn,
        InterfaceInstance,
        Complex
    }

    public static CppNamespace packageToNamespace(String[] packages) {
        CppNamespace lastNs = null;
        for (String p : packages) {
            lastNs = new CppNamespace(p, lastNs);
        }

        if (lastNs != null) {
            return lastNs;
        }

        return new CppNamespace();
    }

    public static Set<Includes.Include> collectIncludes(CppNamespace root) {
        Set<Includes.Include> results = new HashSet<>();

        // TODO change to visitor?
        for ( CppElement m : root.members ) {

            if (m instanceof CppNamespace) {
                results.addAll(collectIncludes((CppNamespace) m));
            } else if (m instanceof CppStruct) {
                CppStruct struct = (CppStruct) m;
                struct.fields.stream().map(f -> f.type.includes).forEach(results::addAll);
            } else if (m instanceof CppConstant) {
                CppConstant constant = (CppConstant) m;
                results.addAll(constant.type.includes);
            } else if (m instanceof CppTypeDef) {
                CppTypeDef td = (CppTypeDef) m;
                results.addAll(td.targetType.includes);
            } else if (m instanceof CppClass) {
                CppClass clazz = (CppClass)m;
                results.addAll(collectIncludes((CppNamespace) m));
            }
            // TODO go through classes, and methods
        }

        return results;
    }

    //TODO move to helper class
    public static <T> boolean areEqual(List<T> a, List<T> b) {
        List<T> listOne = new ArrayList<>(a);
        List<T> listTwo = new ArrayList<>(b);
        listOne.removeAll(b);
        listTwo.removeAll(a);
        return listOne.isEmpty() && listTwo.isEmpty();
    }
}
