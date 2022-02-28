/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class BlobDefaults {
    @NonNull
    public byte[] emptyList;
    @NonNull
    public byte[] deadBeef;
    public BlobDefaults() {
        this.emptyList = new byte[] {  };
        this.deadBeef = new byte[] { (byte) 222, (byte) 173, (byte) 190, (byte) 239 };
    }
}
