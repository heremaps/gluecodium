/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class StructWithClass {
    @NonNull
    public SimpleClass classInstance;
    public StructWithClass(@NonNull final SimpleClass classInstance) {
        this.classInstance = classInstance;
    }
}
