/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
@OnInterface
public interface AttributesInterface {
    @OnConstInInterface
    public static final boolean PI = false;
    @OnFunctionInInterface
    void veryFun(@OnParameterInInterface @NonNull final String param);
    @OnPropertyInInterface
    @NonNull
    String getProp();
    @OnPropertyInInterface
    void setProp(@NonNull final String value);
}
