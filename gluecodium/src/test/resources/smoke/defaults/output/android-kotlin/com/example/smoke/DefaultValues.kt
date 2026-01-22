/*

 *
 */

@file:JvmName("DefaultValuesExtensions")


package com.example.smoke

import com.example.NativeBase

class DefaultValues : NativeBase {

    class StructWithDefaults {
        @JvmField var intField: Int
        @JvmField var uintField: Long
        @JvmField var floatField: Float
        @JvmField var doubleField: Double
        @JvmField var boolField: Boolean
        @JvmField var stringField: String



        constructor() {
            this.intField = 42
            this.uintField = 4294967295L
            this.floatField = 3.14f
            this.doubleField = -1.4142
            this.boolField = true
            this.stringField = "\\Jonny \"Magic\" Smith\n"
        }





    }

    class NullableStructWithDefaults {
        @JvmField var intField: Int?
        @JvmField var uintField: Long?
        @JvmField var floatField: Float?
        @JvmField var boolField: Boolean?
        @JvmField var stringField: String?



        constructor() {
            this.intField = null
            this.uintField = null
            this.floatField = null
            this.boolField = null
            this.stringField = null
        }





    }

    class StructWithSpecialDefaults {
        @JvmField var floatNanField: Float
        @JvmField var floatInfinityField: Float
        @JvmField var floatNegativeInfinityField: Float
        @JvmField var doubleNanField: Double
        @JvmField var doubleInfinityField: Double
        @JvmField var doubleNegativeInfinityField: Double



        constructor() {
            this.floatNanField = Float.NaN
            this.floatInfinityField = Float.POSITIVE_INFINITY
            this.floatNegativeInfinityField = Float.NEGATIVE_INFINITY
            this.doubleNanField = Double.NaN
            this.doubleInfinityField = Double.POSITIVE_INFINITY
            this.doubleNegativeInfinityField = Double.NEGATIVE_INFINITY
        }





    }

    class StructWithEmptyDefaults {
        @JvmField var intsField: List<Int>
        @JvmField var floatsField: List<Float>
        @JvmField var mapField: Map<Long, String>
        @JvmField var structField: DefaultValues.StructWithDefaults
        @JvmField var setTypeField: Set<String>



        constructor() {
            this.intsField = mutableListOf()
            this.floatsField = mutableListOf()
            this.mapField = mutableMapOf()
            this.structField = DefaultValues.StructWithDefaults()
            this.setTypeField = mutableSetOf()
        }





    }

    class StructWithTypedefDefaults {
        @JvmField var longField: Long
        @JvmField var boolField: Boolean
        @JvmField var stringField: String



        constructor() {
            this.longField = 42L
            this.boolField = true
            this.stringField = "\\Jonny \"Magic\" Smith\n"
        }





    }



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic external fun processStructWithDefaults(input: DefaultValues.StructWithDefaults) : DefaultValues.StructWithDefaults
    }
}


