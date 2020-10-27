/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
@OnStruct
public final class AttributesStruct {
    @OnConstInStruct
    public static final boolean PI = false;
    @OnField
    @NonNull
    public String field;
    public AttributesStruct(@NonNull final String field) {
        this.field = field;
    }
    @OnFunctionInStruct
    public native void veryFun(@OnParameterInStruct @NonNull final String param);
}
