/*

 *
 */

@file:JvmName("EnumsExtensions")

package com.example.smoke

import com.example.NativeBase

class Enums : NativeBase {

    enum class ExternalEnum(@JvmField val value: Int) {
        FOO_VALUE(0),
        BAR_VALUE(1);
    }
    enum class VeryExternalEnum(@JvmField val value: Int) {
        FOO(0),
        BAR(1);
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


        @JvmStatic external fun methodWithExternalEnum(input: Enums.ExternalEnum) : Unit
    }
}

