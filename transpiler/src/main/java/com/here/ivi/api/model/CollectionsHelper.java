package com.here.ivi.api.model;

import java.util.Collection;
import java.util.List;

public class CollectionsHelper {

    public static <T> boolean areEqual(Collection<T> a, Collection<T> b) {
        if (a == null && b == null) {
            return true;
        }
        if (a == null || b == null || a.size() != b.size()) {
            return false;
        }

        return a.containsAll(b); // same length so if a is in b, b is also in a
    }

    public static <T> boolean areEqualOrdered(List<T> a, List<T> b) {
        if (a == null && b == null) {
            return true;
        }
        if (a == null || b == null) {
            return false;
        }

        return a.equals(b);
    }
}
