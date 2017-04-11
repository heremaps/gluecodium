package com.here.ivi.api.model.cppmodel;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class CppEnum extends CppElement {
    public List<CppEnumItem> items = new ArrayList<>();

    public boolean isValid() {
        boolean ret = true;
        for (CppEnumItem item : items) {
            if (!item.isValid()) {
                ret = false;
                break;
            }
        }
        return !items.isEmpty() && !name.isEmpty() && ret;
    }

    @Override
    public Stream<CppElement> stream() {
        return items.stream().map(CppElement.class::cast);
    }
}
