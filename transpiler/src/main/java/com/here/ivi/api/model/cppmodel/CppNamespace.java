package com.here.ivi.api.model.cppmodel;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class CppNamespace extends CppElement {
    public List<CppElement> members = new ArrayList<>();

    public CppNamespace() {
        super("");
    }

    public CppNamespace(String name) {
        super(name);
    }

    public boolean isEmpty() {
        return members.isEmpty();
    }

    @Override
    public Stream<CppElement> stream() {
        return members.stream();
    }
}
