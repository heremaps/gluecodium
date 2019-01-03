/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
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
    public enum ExternalEnum {
        ON(0),
        OFF(1);
        public final int value;
        ExternalEnum(final int value) {
            this.value = value;
        }
    }
    public static class BasicStruct {
        public double value;
        public BasicStruct() {
            this(0);
        }
        public BasicStruct(double value) {
            this.value = value;
        }
    }
    public static class ExternalStruct {
        public String string;
        public ExternalStruct() {
            this((String)null);
        }
        public ExternalStruct(String string) {
            this.string = string;
        }
    }
    public static class FancyStruct {
        @NonNull
        public List<String> messages;
        @NonNull
        public List<Short> numbers;
        public byte[] image;
        public FancyStruct() {
            this(new ArrayList<>(), new ArrayList<>(), (byte[])null);
        }
        public FancyStruct(List<String> messages, List<Short> numbers, byte[] image) {
            this.messages = messages;
            this.numbers = numbers;
            this.image = image;
        }
        public static class Builder {
            private List<String> messages = new ArrayList<>();
            private List<Short> numbers = new ArrayList<>();
            private byte[] image = (byte[])null;
            public Builder() {
            }
            public Builder setMessages(List<String> messages) {
                this.messages = messages;
                return this;
            }
            public Builder setNumbers(List<Short> numbers) {
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
    @NonNull
    public static native List<String> methodWithArray(@NonNull final List<String> input);
    @NonNull
    public static native List<Short> methodWithArrayInline(@NonNull final List<Short> input);
    @NonNull
    public static native List<Arrays.BasicStruct> methodWithStructArray(@NonNull final List<Arrays.BasicStruct> input);
    @NonNull
    public static native List<Arrays.ExternalStruct> methodWithExternalStructArray(@NonNull final List<Arrays.ExternalStruct> input);
    @NonNull
    public static native List<List<Short>> methodWithArrayOfArrays(@NonNull final List<List<Short>> input);
    @NonNull
    public static native List<Arrays.FancyStruct> mergeArraysOfStructsWithArrays(@NonNull final List<Arrays.FancyStruct> inlineFancyArray, @NonNull final List<Arrays.FancyStruct> fancyArray);
    @NonNull
    public static native List<String> methodWithArrayOfAliases(@NonNull final List<String> input);
    @NonNull
    public static native List<Map<Integer, String>> methodWithArrayOfMaps(@NonNull final List<Map<Integer, String>> input);
    public static native byte[] methodWithByteBuffer(final byte[] input);
    @NonNull
    public static native List<Arrays.SomeEnum> methodWithEnumArray(@NonNull final List<Arrays.SomeEnum> input);
    @NonNull
    public static native List<Arrays.ExternalEnum> methodWithExternalEnumArray(@NonNull final List<Arrays.ExternalEnum> input);
}
