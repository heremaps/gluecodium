/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public interface ParentNarrowOne {
    void parentFunctionOne();
    @NonNull
    String getParentPropertyOne();
    void setParentPropertyOne(@NonNull final String value);
}
