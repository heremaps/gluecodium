/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;
public class StaticMethods extends NativeBase {
    /** For internal use only */
    protected StaticMethods(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);

    public static native boolean returnInvertedBoolean(final boolean input);
    public static native boolean returnAndBoolean(final boolean input1, final boolean input2);
    public static native byte[] returnInputByteBuffer(final byte[] inputBuffer);
    public static native byte[] returnReverseByteBuffer(final byte[] inputBuffer);
    public static native byte[] concatenateByteBuffers(final byte[] input1, final byte[] input2);
    public static native float returnFloat(final float inputNumber);
    public static native float returnIncrementedFloat(final float inputNumber);
    public static native float sumTwoFloats(final float inputNumber1, final float inputNumber2);
    public static native double returnDouble(final double inputNumber);
    public static native double returnIncrementedDouble(final double inputNumber);
    public static native double sumTwoDoubles(final double inputNumber1, final double inputNumber2);
    public static native byte returnNextNumberINT8(final byte inputNumber);
    public static native byte sumTwoNumbersINT8(final byte inputNumber1, final byte inputNumber2);
    public static native byte returnPrimeINT8();
    public static native long returnNextNumberUINT8(final long inputNumber);
    public static native long sumTwoNumbersUINT8(final long inputNumber1, final long inputNumber2);
    public static native long returnPrimeUINT8();
    public static native short returnNextNumberINT16(final short inputNumber);
    public static native short sumTwoNumbersINT16(final short inputNumber1, final short inputNumber2);
    public static native short returnPrimeINT16();
    public static native long returnNextNumberUINT16(final long inputNumber);
    public static native long sumTwoNumbersUINT16(final long inputNumber1, final long inputNumber2);
    public static native long returnPrimeUINT16();
    public static native int returnNextNumberINT32(final int inputNumber);
    public static native int sumTwoNumbersINT32(final int inputNumber1, final int inputNumber2);
    public static native int returnPrimeINT32();
    public static native long returnNextNumberUINT32(final long inputNumber);
    public static native long sumTwoNumbersUINT32(final long inputNumber1, final long inputNumber2);
    public static native long returnPrimeUINT32();
    public static native long returnNextNumberINT64(final long inputNumber);
    public static native long sumTwoNumbersINT64(final long inputNumber1, final long inputNumber2);
    public static native long returnPrimeINT64();
    public static native long returnNextNumberUINT64(final long inputNumber);
    public static native long sumTwoNumbersUINT64(final long inputNumber1, final long inputNumber2);
    public static native long returnPrimeUINT64();
    public static native String returnInputString(final String inputString);
    public static native String concatenateStrings(final String inputString1, final String inputString2);
    public static native String returnHelloString();
    public static native String returnEmpty();
}