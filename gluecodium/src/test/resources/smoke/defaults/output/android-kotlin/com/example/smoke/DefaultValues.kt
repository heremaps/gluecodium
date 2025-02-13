/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class DefaultValues : NativeBase {

    class StructWithDefaults {
        var intField: Int
        var uintField: Long
        var floatField: Float
        var doubleField: Double
        var boolField: Boolean
        var stringField: String



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
        var intField: Int?
        var uintField: Long?
        var floatField: Float?
        var boolField: Boolean?
        var stringField: String?



        constructor() {
            this.intField = null
            this.uintField = null
            this.floatField = null
            this.boolField = null
            this.stringField = null
        }


    }

    class StructWithSpecialDefaults {
        var floatNanField: Float
        var floatInfinityField: Float
        var floatNegativeInfinityField: Float
        var doubleNanField: Double
        var doubleInfinityField: Double
        var doubleNegativeInfinityField: Double



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
        var intsField: List<Int>
        var floatsField: List<Float>
        var mapField: Map<Long, String>
        var structField: DefaultValues.StructWithDefaults
        var setTypeField: Set<String>



        constructor() {
            this.intsField = listOf()
            this.floatsField = listOf()
            this.mapField = mapOf()
            this.structField = DefaultValues.StructWithDefaults()
            this.setTypeField = setOf()
        }


    }

    class StructWithTypedefDefaults {
        var longField: Long
        var boolField: Boolean
        var stringField: String



        constructor() {
            this.longField = 42L
            this.boolField = true
            this.stringField = "\\Jonny \"Magic\" Smith\n"
        }


    }



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun processStructWithDefaults(input: DefaultValues.StructWithDefaults) : DefaultValues.StructWithDefaults
    }
}
