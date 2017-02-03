package com.here.ivi.api.model.cppmodel;

import java.util.ArrayList;
import java.util.List;

public class CppStruct extends CppElement {
    public CppStruct inherits;
    public List<CppField> fields = new ArrayList<>();
}
