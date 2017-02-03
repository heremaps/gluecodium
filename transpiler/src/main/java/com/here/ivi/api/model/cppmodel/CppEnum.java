package com.here.ivi.api.model.cppmodel;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hhinrich on 03/02/2017.
 */
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
}
