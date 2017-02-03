package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.Includes;

import java.util.*;
import java.util.stream.Collectors;

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
        return root.streamRecursive()
                .filter(p -> p instanceof CppType)
                .map(CppType.class::cast)
                .map(t -> t.includes).flatMap(Set::stream).collect(Collectors.toSet());
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
