package com.here.ivi.api.model.cppmodel;

import java.util.ArrayList;
import java.util.List;

public class CppNamespace extends CppElement {
    public List<CppElement> members = new ArrayList<>();

    public CppNamespace() {
        this("", null);
    }

    public CppNamespace(String name) {
        this(name, null);
    }

    public CppNamespace(String name, CppNamespace lastNs) {
        this.name = name;
        if (lastNs != null) {
            this.members.add(lastNs);
        }
    }
}
