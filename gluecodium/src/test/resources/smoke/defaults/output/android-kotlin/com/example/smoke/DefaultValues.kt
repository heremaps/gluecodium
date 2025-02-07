/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class DefaultValues : NativeBase {

    class StructWithDefaults(var intField: Int = 42,
        var uintField: Long = 4294967295L,
        var floatField: Float = 3.14f,
        var doubleField: Double = -1.4142,
        var boolField: Boolean = true,
        var stringField: String = "\\Jonny \"Magic\" Smith\n") {




    }


    class NullableStructWithDefaults(var intField: Int? = null,
        var uintField: Long? = null,
        var floatField: Float? = null,
        var boolField: Boolean? = null,
        var stringField: String? = null) {




    }


    class StructWithSpecialDefaults(var floatNanField: Float = Float.NaN,
        var floatInfinityField: Float = Float.POSITIVE_INFINITY,
        var floatNegativeInfinityField: Float = Float.NEGATIVE_INFINITY,
        var doubleNanField: Double = Double.NaN,
        var doubleInfinityField: Double = Double.POSITIVE_INFINITY,
        var doubleNegativeInfinityField: Double = Double.NEGATIVE_INFINITY) {




    }


    class StructWithEmptyDefaults(var intsField: List<Int> = listOf(),
        var floatsField: List<Float> = listOf(),
        var mapField: Map<Long, String> = mapOf(),
        var structField: DefaultValues.StructWithDefaults = DefaultValues.StructWithDefaults(),
        var setTypeField: Set<String> = setOf()) {




    }


    class StructWithTypedefDefaults(var longField: Long = 42L,
        var boolField: Boolean = true,
        var stringField: String = "\\Jonny \"Magic\" Smith\n") {




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
