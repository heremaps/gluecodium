/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class StructWithInstances {
    @NonNull
    public SimpleClass classInstance;
    @NonNull
    public SimpleInterface interfaceInstance;
    public StructWithInstances(@NonNull final SimpleClass classInstance, @NonNull final SimpleInterface interfaceInstance) {
        this.classInstance = classInstance;
        this.interfaceInstance = interfaceInstance;
    }
    @NonNull
    public native SimpleClass useSimpleClass(@NonNull final SimpleClass input);
    @NonNull
    public native SimpleInterface useSimpleInterface(@NonNull final SimpleInterface input);
}
