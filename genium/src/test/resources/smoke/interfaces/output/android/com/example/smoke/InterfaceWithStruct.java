/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public interface InterfaceWithStruct {
    public static class InnerStruct {
        public byte value;
        public InnerStruct(byte value) {
            this.value = value;
        }
    }
    @NonNull
    InterfaceWithStruct.InnerStruct innerStructMethod(@NonNull final InterfaceWithStruct.InnerStruct inputStruct);
}
