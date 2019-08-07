/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public class Structs extends NativeBase {
    public enum FooBar {
        FOO(0),
        BAR(1);
        public final int value;
        FooBar(final int value) {
            this.value = value;
        }
    }
    public static class Point {
        public double x;
        public double y;
        public Point(final double x, final double y) {
            this.x = x;
            this.y = y;
        }
    }
    public static class Line {
        @NonNull
        public Structs.Point a;
        @NonNull
        public Structs.Point b;
        public Line(@NonNull final Structs.Point a, @NonNull final Structs.Point b) {
            this.a = a;
            this.b = b;
        }
    }
    public static class AllTypesStruct {
        public final byte int8Field;
        public final short uint8Field;
        public final short int16Field;
        public final int uint16Field;
        public final int int32Field;
        public final long uint32Field;
        public final long int64Field;
        public final long uint64Field;
        public final float floatField;
        public final double doubleField;
        @NonNull
        public final String stringField;
        public final boolean booleanField;
        @NonNull
        public final byte[] bytesField;
        @NonNull
        public final Structs.Point pointField;
        public AllTypesStruct(final byte int8Field, final short uint8Field, final short int16Field, final int uint16Field, final int int32Field, final long uint32Field, final long int64Field, final long uint64Field, final float floatField, final double doubleField, @NonNull final String stringField, final boolean booleanField, @NonNull final byte[] bytesField, @NonNull final Structs.Point pointField) {
            this.int8Field = int8Field;
            this.uint8Field = uint8Field;
            this.int16Field = int16Field;
            this.uint16Field = uint16Field;
            this.int32Field = int32Field;
            this.uint32Field = uint32Field;
            this.int64Field = int64Field;
            this.uint64Field = uint64Field;
            this.floatField = floatField;
            this.doubleField = doubleField;
            this.stringField = stringField;
            this.booleanField = booleanField;
            this.bytesField = bytesField;
            this.pointField = pointField;
        }
        public static class Builder {
            private byte int8Field = (byte)0;
            private short uint8Field = (short)0;
            private short int16Field = (short)0;
            private int uint16Field = 0;
            private int int32Field = 0;
            private long uint32Field = 0L;
            private long int64Field = 0L;
            private long uint64Field = 0L;
            private float floatField = 0f;
            private double doubleField = 0;
            private String stringField = (String)null;
            private boolean booleanField = false;
            private byte[] bytesField = (byte[])null;
            private Structs.Point pointField = (Structs.Point)null;
            public Builder() { }
            public Builder1 setInt8Field(byte int8Field) {
                Builder.this.int8Field = int8Field;
                return new Builder1();
            }
            public class Builder1 {
                Builder1() { }
                public Builder2 setUint8Field(short uint8Field) {
                    Builder.this.uint8Field = uint8Field;
                    return new Builder2();
                }
            }
            public class Builder2 {
                Builder2() { }
                public Builder3 setInt16Field(short int16Field) {
                    Builder.this.int16Field = int16Field;
                    return new Builder3();
                }
            }
            public class Builder3 {
                Builder3() { }
                public Builder4 setUint16Field(int uint16Field) {
                    Builder.this.uint16Field = uint16Field;
                    return new Builder4();
                }
            }
            public class Builder4 {
                Builder4() { }
                public Builder5 setInt32Field(int int32Field) {
                    Builder.this.int32Field = int32Field;
                    return new Builder5();
                }
            }
            public class Builder5 {
                Builder5() { }
                public Builder6 setUint32Field(long uint32Field) {
                    Builder.this.uint32Field = uint32Field;
                    return new Builder6();
                }
            }
            public class Builder6 {
                Builder6() { }
                public Builder7 setInt64Field(long int64Field) {
                    Builder.this.int64Field = int64Field;
                    return new Builder7();
                }
            }
            public class Builder7 {
                Builder7() { }
                public Builder8 setUint64Field(long uint64Field) {
                    Builder.this.uint64Field = uint64Field;
                    return new Builder8();
                }
            }
            public class Builder8 {
                Builder8() { }
                public Builder9 setFloatField(float floatField) {
                    Builder.this.floatField = floatField;
                    return new Builder9();
                }
            }
            public class Builder9 {
                Builder9() { }
                public Builder10 setDoubleField(double doubleField) {
                    Builder.this.doubleField = doubleField;
                    return new Builder10();
                }
            }
            public class Builder10 {
                Builder10() { }
                public Builder11 setStringField(String stringField) {
                    Builder.this.stringField = stringField;
                    return new Builder11();
                }
            }
            public class Builder11 {
                Builder11() { }
                public Builder12 setBooleanField(boolean booleanField) {
                    Builder.this.booleanField = booleanField;
                    return new Builder12();
                }
            }
            public class Builder12 {
                Builder12() { }
                public Builder13 setBytesField(byte[] bytesField) {
                    Builder.this.bytesField = bytesField;
                    return new Builder13();
                }
            }
            public class Builder13 {
                Builder13() { }
                public FinalBuilder setPointField(Structs.Point pointField) {
                    Builder.this.pointField = pointField;
                    return new FinalBuilder();
                }
            }
            public class FinalBuilder {
                FinalBuilder() { }
                public FinalBuilder setInt8Field(byte int8Field) {
                    Builder.this.int8Field = int8Field;
                    return this;
                }
                public FinalBuilder setUint8Field(short uint8Field) {
                    Builder.this.uint8Field = uint8Field;
                    return this;
                }
                public FinalBuilder setInt16Field(short int16Field) {
                    Builder.this.int16Field = int16Field;
                    return this;
                }
                public FinalBuilder setUint16Field(int uint16Field) {
                    Builder.this.uint16Field = uint16Field;
                    return this;
                }
                public FinalBuilder setInt32Field(int int32Field) {
                    Builder.this.int32Field = int32Field;
                    return this;
                }
                public FinalBuilder setUint32Field(long uint32Field) {
                    Builder.this.uint32Field = uint32Field;
                    return this;
                }
                public FinalBuilder setInt64Field(long int64Field) {
                    Builder.this.int64Field = int64Field;
                    return this;
                }
                public FinalBuilder setUint64Field(long uint64Field) {
                    Builder.this.uint64Field = uint64Field;
                    return this;
                }
                public FinalBuilder setFloatField(float floatField) {
                    Builder.this.floatField = floatField;
                    return this;
                }
                public FinalBuilder setDoubleField(double doubleField) {
                    Builder.this.doubleField = doubleField;
                    return this;
                }
                public FinalBuilder setStringField(String stringField) {
                    Builder.this.stringField = stringField;
                    return this;
                }
                public FinalBuilder setBooleanField(boolean booleanField) {
                    Builder.this.booleanField = booleanField;
                    return this;
                }
                public FinalBuilder setBytesField(byte[] bytesField) {
                    Builder.this.bytesField = bytesField;
                    return this;
                }
                public FinalBuilder setPointField(Structs.Point pointField) {
                    Builder.this.pointField = pointField;
                    return this;
                }
                public AllTypesStruct build() {
                    return new AllTypesStruct(int8Field, uint8Field, int16Field, uint16Field, int32Field, uint32Field, int64Field, uint64Field, floatField, doubleField, stringField, booleanField, bytesField, pointField);
                }
            }
        }
    }
    public static class ExternalStruct {
        @NonNull
        public String stringField;
        @NonNull
        public String externalStringField;
        @NonNull
        public List<Byte> externalArrayField;
        @NonNull
        public Structs.AnotherExternalStruct externalStructField;
        public ExternalStruct(@NonNull final String stringField, @NonNull final String externalStringField, @NonNull final List<Byte> externalArrayField, @NonNull final Structs.AnotherExternalStruct externalStructField) {
            this.stringField = stringField;
            this.externalStringField = externalStringField;
            this.externalArrayField = externalArrayField;
            this.externalStructField = externalStructField;
        }
    }
    public static class AnotherExternalStruct {
        public byte intField;
        public AnotherExternalStruct(final byte intField) {
            this.intField = intField;
        }
    }
    public static class YetAnotherExternalStruct {
        @NonNull
        public String stringField;
        public YetAnotherExternalStruct(@NonNull final String stringField) {
            this.stringField = stringField;
        }
    }
    public static class NestingImmutableStruct {
        @NonNull
        public Structs.AllTypesStruct structField;
        public NestingImmutableStruct(@NonNull final Structs.AllTypesStruct structField) {
            this.structField = structField;
        }
    }
    public static class DoubleNestingImmutableStruct {
        @NonNull
        public Structs.NestingImmutableStruct nestingStructField;
        public DoubleNestingImmutableStruct(@NonNull final Structs.NestingImmutableStruct nestingStructField) {
            this.nestingStructField = nestingStructField;
        }
    }
    public static class StructWithArrayOfImmutable {
        @NonNull
        public List<Structs.AllTypesStruct> arrayField;
        public StructWithArrayOfImmutable(@NonNull final List<Structs.AllTypesStruct> arrayField) {
            this.arrayField = arrayField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Structs(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native Structs.Point swapPointCoordinates(@NonNull final Structs.Point input);
    @NonNull
    public static native Structs.AllTypesStruct returnAllTypesStruct(@NonNull final Structs.AllTypesStruct input);
    @NonNull
    public static native Structs.ExternalStruct getExternalStruct();
    @NonNull
    public static native Structs.AnotherExternalStruct getAnotherExternalStruct();
    @NonNull
    public static native Structs.YetAnotherExternalStruct getYetAnotherExternalStruct();
    @NonNull
    public static native Point createPoint(final double x, final double y);
    @NonNull
    public static native AllTypesStruct modifyAllTypesStruct(@NonNull final AllTypesStruct input);
}
