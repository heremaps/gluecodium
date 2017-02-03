package com.here.ivi.api.model.cppmodel;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class CppStruct extends CppElement {
    public CppStruct inherits;
    public List<CppField> fields = new ArrayList<>();

    @Override
    public Stream<CppElement> stream() {
        return Stream.concat(fields.stream(), Stream.of(inherits));
    }
}
