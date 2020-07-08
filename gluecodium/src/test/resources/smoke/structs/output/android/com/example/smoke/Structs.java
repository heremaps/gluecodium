/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public final class Structs extends NativeBase {
    public enum FooBar {
        FOO(0),
        BAR(1);
        public final int value;
        FooBar(final int value) {
            this.value = value;
        }
    }
    public final static class Point {
        public double x;
        public double y;
        public Point(final double x, final double y) {
            this.x = x;
            this.y = y;
        }
    }
    public final static class Line {
        @NonNull
        public Structs.Point a;
        @NonNull
        public Structs.Point b;
        public Line(@NonNull final Structs.Point a, @NonNull final Structs.Point b) {
            this.a = a;
            this.b = b;
        }
    }
    public final static class AllTypesStruct {
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
        /**
         * Allows to construct a new AllTypesStruct instance by calling the following setters for mandatory fields in the
         * following order before {@link FinalBuilder#build build} can be called:
         * <pre>
         *
         * AllTypesStruct instance = new AllTypesStruct.Builder()
         *     .setInt8Field(int8Field)
         *     .setUint8Field(uint8Field)
         *     .setInt16Field(int16Field)
         *     .setUint16Field(uint16Field)
         *     .setInt32Field(int32Field)
         *     .setUint32Field(uint32Field)
         *     .setInt64Field(int64Field)
         *     .setUint64Field(uint64Field)
         *     .setFloatField(floatField)
         *     .setDoubleField(doubleField)
         *     .setStringField(stringField)
         *     .setBooleanField(booleanField)
         *     .setBytesField(bytesField)
         *     .setPointField(pointField)
         *     .build();
         * </pre>
         */
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
            /**
             * Sets int8Field.
             */
            public PartialBuilder1 setInt8Field(byte int8Field) {
                Builder.this.int8Field = int8Field;
                return new PartialBuilder1();
            }
            /** @exclude */
            public class PartialBuilder1 {
                PartialBuilder1() { }
                /**
                 * Sets uint8Field.
                 */
                public PartialBuilder2 setUint8Field(short uint8Field) {
                    Builder.this.uint8Field = uint8Field;
                    return new PartialBuilder2();
                }
            }
            /** @exclude */
            public class PartialBuilder2 {
                PartialBuilder2() { }
                /**
                 * Sets int16Field.
                 */
                public PartialBuilder3 setInt16Field(short int16Field) {
                    Builder.this.int16Field = int16Field;
                    return new PartialBuilder3();
                }
            }
            /** @exclude */
            public class PartialBuilder3 {
                PartialBuilder3() { }
                /**
                 * Sets uint16Field.
                 */
                public PartialBuilder4 setUint16Field(int uint16Field) {
                    Builder.this.uint16Field = uint16Field;
                    return new PartialBuilder4();
                }
            }
            /** @exclude */
            public class PartialBuilder4 {
                PartialBuilder4() { }
                /**
                 * Sets int32Field.
                 */
                public PartialBuilder5 setInt32Field(int int32Field) {
                    Builder.this.int32Field = int32Field;
                    return new PartialBuilder5();
                }
            }
            /** @exclude */
            public class PartialBuilder5 {
                PartialBuilder5() { }
                /**
                 * Sets uint32Field.
                 */
                public PartialBuilder6 setUint32Field(long uint32Field) {
                    Builder.this.uint32Field = uint32Field;
                    return new PartialBuilder6();
                }
            }
            /** @exclude */
            public class PartialBuilder6 {
                PartialBuilder6() { }
                /**
                 * Sets int64Field.
                 */
                public PartialBuilder7 setInt64Field(long int64Field) {
                    Builder.this.int64Field = int64Field;
                    return new PartialBuilder7();
                }
            }
            /** @exclude */
            public class PartialBuilder7 {
                PartialBuilder7() { }
                /**
                 * Sets uint64Field.
                 */
                public PartialBuilder8 setUint64Field(long uint64Field) {
                    Builder.this.uint64Field = uint64Field;
                    return new PartialBuilder8();
                }
            }
            /** @exclude */
            public class PartialBuilder8 {
                PartialBuilder8() { }
                /**
                 * Sets floatField.
                 */
                public PartialBuilder9 setFloatField(float floatField) {
                    Builder.this.floatField = floatField;
                    return new PartialBuilder9();
                }
            }
            /** @exclude */
            public class PartialBuilder9 {
                PartialBuilder9() { }
                /**
                 * Sets doubleField.
                 */
                public PartialBuilder10 setDoubleField(double doubleField) {
                    Builder.this.doubleField = doubleField;
                    return new PartialBuilder10();
                }
            }
            /** @exclude */
            public class PartialBuilder10 {
                PartialBuilder10() { }
                /**
                 * Sets stringField.
                 */
                public PartialBuilder11 setStringField(String stringField) {
                    Builder.this.stringField = stringField;
                    return new PartialBuilder11();
                }
            }
            /** @exclude */
            public class PartialBuilder11 {
                PartialBuilder11() { }
                /**
                 * Sets booleanField.
                 */
                public PartialBuilder12 setBooleanField(boolean booleanField) {
                    Builder.this.booleanField = booleanField;
                    return new PartialBuilder12();
                }
            }
            /** @exclude */
            public class PartialBuilder12 {
                PartialBuilder12() { }
                /**
                 * Sets bytesField.
                 */
                public PartialBuilder13 setBytesField(byte[] bytesField) {
                    Builder.this.bytesField = bytesField;
                    return new PartialBuilder13();
                }
            }
            /** @exclude */
            public class PartialBuilder13 {
                PartialBuilder13() { }
                /**
                 * Sets pointField.
                 */
                public FinalBuilder setPointField(Structs.Point pointField) {
                    Builder.this.pointField = pointField;
                    return new FinalBuilder();
                }
            }
            /**
             * After all mandatory fields are set, this builder is returned which allows
             * setting all fields and constructing a new AllTypesStruct instance by calling {@link #build build}.
             */
            public class FinalBuilder {
                FinalBuilder() { }
                /**
                 * Sets int8Field.
                 */
                public FinalBuilder setInt8Field(byte int8Field) {
                    Builder.this.int8Field = int8Field;
                    return this;
                }
                /**
                 * Sets uint8Field.
                 */
                public FinalBuilder setUint8Field(short uint8Field) {
                    Builder.this.uint8Field = uint8Field;
                    return this;
                }
                /**
                 * Sets int16Field.
                 */
                public FinalBuilder setInt16Field(short int16Field) {
                    Builder.this.int16Field = int16Field;
                    return this;
                }
                /**
                 * Sets uint16Field.
                 */
                public FinalBuilder setUint16Field(int uint16Field) {
                    Builder.this.uint16Field = uint16Field;
                    return this;
                }
                /**
                 * Sets int32Field.
                 */
                public FinalBuilder setInt32Field(int int32Field) {
                    Builder.this.int32Field = int32Field;
                    return this;
                }
                /**
                 * Sets uint32Field.
                 */
                public FinalBuilder setUint32Field(long uint32Field) {
                    Builder.this.uint32Field = uint32Field;
                    return this;
                }
                /**
                 * Sets int64Field.
                 */
                public FinalBuilder setInt64Field(long int64Field) {
                    Builder.this.int64Field = int64Field;
                    return this;
                }
                /**
                 * Sets uint64Field.
                 */
                public FinalBuilder setUint64Field(long uint64Field) {
                    Builder.this.uint64Field = uint64Field;
                    return this;
                }
                /**
                 * Sets floatField.
                 */
                public FinalBuilder setFloatField(float floatField) {
                    Builder.this.floatField = floatField;
                    return this;
                }
                /**
                 * Sets doubleField.
                 */
                public FinalBuilder setDoubleField(double doubleField) {
                    Builder.this.doubleField = doubleField;
                    return this;
                }
                /**
                 * Sets stringField.
                 */
                public FinalBuilder setStringField(String stringField) {
                    Builder.this.stringField = stringField;
                    return this;
                }
                /**
                 * Sets booleanField.
                 */
                public FinalBuilder setBooleanField(boolean booleanField) {
                    Builder.this.booleanField = booleanField;
                    return this;
                }
                /**
                 * Sets bytesField.
                 */
                public FinalBuilder setBytesField(byte[] bytesField) {
                    Builder.this.bytesField = bytesField;
                    return this;
                }
                /**
                 * Sets pointField.
                 */
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
    public final static class NestingImmutableStruct {
        @NonNull
        public Structs.AllTypesStruct structField;
        public NestingImmutableStruct(@NonNull final Structs.AllTypesStruct structField) {
            this.structField = structField;
        }
    }
    public final static class DoubleNestingImmutableStruct {
        @NonNull
        public Structs.NestingImmutableStruct nestingStructField;
        public DoubleNestingImmutableStruct(@NonNull final Structs.NestingImmutableStruct nestingStructField) {
            this.nestingStructField = nestingStructField;
        }
    }
    public final static class StructWithArrayOfImmutable {
        @NonNull
        public List<Structs.AllTypesStruct> arrayField;
        public StructWithArrayOfImmutable(@NonNull final List<Structs.AllTypesStruct> arrayField) {
            this.arrayField = arrayField;
        }
    }
    public final static class ImmutableStructWithCppAccessors {
        @NonNull
        public final String stringField;
        public ImmutableStructWithCppAccessors(@NonNull final String stringField) {
            this.stringField = stringField;
        }
    }
    public final static class MutableStructWithCppAccessors {
        @NonNull
        public String stringField;
        public MutableStructWithCppAccessors(@NonNull final String stringField) {
            this.stringField = stringField;
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
    public static native Point createPoint(final double x, final double y);
    @NonNull
    public static native AllTypesStruct modifyAllTypesStruct(@NonNull final AllTypesStruct input);
}
