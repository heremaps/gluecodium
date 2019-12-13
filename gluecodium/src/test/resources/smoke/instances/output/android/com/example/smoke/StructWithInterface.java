/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class StructWithInterface {
    @NonNull
    public SimpleInterface interfaceInstance;
    public StructWithInterface(@NonNull final SimpleInterface interfaceInstance) {
        this.interfaceInstance = interfaceInstance;
    }
}
