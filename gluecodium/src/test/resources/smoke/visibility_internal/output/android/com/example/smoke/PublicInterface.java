/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public interface PublicInterface {
    static final class InternalStruct {
        @NonNull
        public PublicClass.InternalStruct fieldOfInternalType;
        InternalStruct(@NonNull final PublicClass.InternalStruct fieldOfInternalType) {
            this.fieldOfInternalType = fieldOfInternalType;
        }
    }
}
