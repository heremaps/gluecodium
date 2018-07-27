/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Arrays extends NativeBase {
    public enum SomeEnum {
        FOO(0),
        BAR(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public static class BasicStruct {
        public double value;
        public BasicStruct() {}
        public BasicStruct(double value) {
            this.value = value;
        }
    }
    public static class FancyStruct {
        public List<String> messages = new ArrayList<>();
        public List<Long> numbers = new ArrayList<>();
        public byte[] image;
        public FancyStruct() {}
        public FancyStruct(List<String> messages, List<Long> numbers, byte[] image) {
            this.messages = messages;
            this.numbers = numbers;
            this.image = image;
        }
        public static class Builder {
            private List<String> messages = new ArrayList<>();
            private List<Long> numbers = new ArrayList<>();
            private byte[] image;
            public Builder() {
            }
            public Builder setMessages(List<String> messages) {
                this.messages = messages;
                return this;
            }
            public Builder setNumbers(List<Long> numbers) {
                this.numbers = numbers;
                return this;
            }
            public Builder setImage(byte[] image) {
                this.image = image;
                return this;
            }
            public FancyStruct build() {
                return new FancyStruct(messages, numbers, image);
            }
        }
    }
    /** For internal use only */
    protected Arrays(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native List<String> methodWithArray(final List<String> input);
    public static native List<Long> methodWithArrayInline(final List<Long> input);
    public static native List<Arrays.BasicStruct> methodWithStructArray(final List<Arrays.BasicStruct> input);
    public static native List<List<Long>> methodWithArrayOfArrays(final List<List<Long>> input);
    public static native List<Arrays.FancyStruct> mergeArraysOfStructsWithArrays(final List<Arrays.FancyStruct> inlineFancyArray, final List<Arrays.FancyStruct> fancyArray);
    public static native List<String> methodWithArrayOfAliases(final List<String> input);
    public static native List<Map<Integer, String>> methodWithArrayOfMaps(final List<Map<Integer, String>> input);
    public static native byte[] methodWithByteBuffer(final byte[] input);
}
