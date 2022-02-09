/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class StructWithAnEnum {
    @NonNull
    public AnEnum config;
    public StructWithAnEnum() {
        this.config = AnEnum.ENABLED;
    }
}
