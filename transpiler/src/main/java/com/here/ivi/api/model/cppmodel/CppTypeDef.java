package com.here.ivi.api.model.cppmodel;

import java.util.stream.Stream;

public class CppTypeDef extends CppElement {
    public CppType targetType;

    @Override
    public Stream<CppElement> stream() {
        return Stream.of(targetType);
    }
}
