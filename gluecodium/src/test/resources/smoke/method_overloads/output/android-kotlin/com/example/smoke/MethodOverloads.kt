/*

 *
 */

@file:JvmName("MethodOverloadsExtensions")

package com.example.smoke

import com.example.NativeBase

class MethodOverloads : NativeBase {

    class Point {
        @JvmField var x: Double
        @JvmField var y: Double



        constructor(x: Double, y: Double) {
            this.x = x
            this.y = y
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





    external fun isBoolean(input: Boolean) : Boolean


    external fun isBoolean(input: Byte) : Boolean


    external fun isBoolean(input: String) : Boolean


    external fun isBoolean(input: MethodOverloads.Point) : Boolean


    external fun isBoolean(input1: Boolean, input2: Byte, input3: String, input4: MethodOverloads.Point) : Boolean


    external fun isBooleanStringArrayOverload(input: List<String>) : Boolean


    external fun isBooleanIntArrayOverload(input: List<Byte>) : Boolean


    external fun isBoolean() : Boolean


    external fun isFloat(input: String) : Boolean


    external fun isFloat(input: List<Byte>) : Boolean




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


