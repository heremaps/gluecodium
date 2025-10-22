/*

 *
 */

@file:JvmName("StructConstantsExtensions")

package com.example.smoke

import com.example.NativeBase

class StructConstants : NativeBase {

    class SomeStruct {
        @JvmField var stringField: String
        @JvmField var floatField: Float



        constructor(stringField: String, floatField: Float) {
            this.stringField = stringField
            this.floatField = floatField
        }





    }

    class NestingStruct {
        @JvmField var structField: StructConstants.SomeStruct



        constructor(structField: StructConstants.SomeStruct) {
            this.structField = structField
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
        @JvmField final val STRUCT_CONSTANT: StructConstants.SomeStruct = StructConstants.SomeStruct("bar Buzz", 1.41f)
        @JvmField final val NESTING_STRUCT_CONSTANT: StructConstants.NestingStruct = StructConstants.NestingStruct(StructConstants.SomeStruct("nonsense", -2.82f))
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

