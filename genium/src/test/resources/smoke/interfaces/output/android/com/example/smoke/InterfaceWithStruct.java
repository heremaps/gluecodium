/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public interface InterfaceWithStruct {
    public static class InnerStruct {
        public byte value;
        public InnerStruct() {
            this((byte)0);
        }
        public InnerStruct(byte value) {
            this.value = value;
        }
    }
    @NonNull
    InterfaceWithStruct.InnerStruct innerStructMethod(final InterfaceWithStruct.InnerStruct inputStruct);
}
