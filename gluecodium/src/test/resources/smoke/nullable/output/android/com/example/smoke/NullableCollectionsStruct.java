/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import java.util.Date;
import java.util.List;
import java.util.Map;
public final class NullableCollectionsStruct {
    @NonNull
    public List<Date> dates;
    @NonNull
    public Map<Integer, Nullable.SomeStruct> structs;
    public NullableCollectionsStruct(@NonNull final List<Date> dates, @NonNull final Map<Integer, Nullable.SomeStruct> structs) {
        this.dates = dates;
        this.structs = structs;
    }
}
