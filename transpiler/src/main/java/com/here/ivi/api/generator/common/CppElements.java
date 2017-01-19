package com.here.ivi.api.generator.common;

import java.util.ArrayList;
import java.util.List;

public class CppElements {
    public static final String HEADER_FILE_SUFFIX = ".h";

    public static class CppElement {
    }

    public static class CppNamespace {
        public final String name;
        public List<CppElement> members = new ArrayList<>();
        public List<CppNamespace> subNs = new ArrayList<>();

        public CppNamespace() {
            this("", null);
        }

        public CppNamespace(String name) {
            this(name, null);
        }

        public CppNamespace(String name, CppNamespace lastNs) {
            this.name = name;
            if (lastNs != null) {
                this.subNs.add(lastNs);
            }
        }
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
}
