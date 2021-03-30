/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public interface InterfaceWithStatic {
    @NonNull
    String regularFunction();
    @NonNull
    String getRegularProperty();
    void setRegularProperty(@NonNull final String value);
    @NonNull
    static String staticFunction() {
        return InterfaceWithStaticImpl.staticFunction();
    }
    @NonNull
    static String getStaticProperty() {
        return InterfaceWithStaticImpl.getStaticProperty();
    }
    static void setStaticProperty(@NonNull final String value) {
        InterfaceWithStaticImpl.setStaticProperty(value);
    }
}
