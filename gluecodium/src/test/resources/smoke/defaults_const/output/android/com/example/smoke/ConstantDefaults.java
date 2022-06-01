/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.fire.SomeStruct;
public final class ConstantDefaults {
    @NonNull
    public SomeStruct field1;
    @NonNull
    public SomeStruct field2;
    public ConstantDefaults() {
        this.field1 = com.example.fire.StructConstants.DUMMY;
        this.field2 = com.example.fire.StructConstants.DUMMY4;
    }
}
