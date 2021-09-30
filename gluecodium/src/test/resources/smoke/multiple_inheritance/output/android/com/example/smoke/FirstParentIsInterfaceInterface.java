/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public interface FirstParentIsInterfaceInterface extends ParentInterface, ParentNarrowOne {
    void childFunction();
    @NonNull
    String getChildProperty();
    void setChildProperty(@NonNull final String value);
}
