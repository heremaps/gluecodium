/*

 *
 */

@file:JvmName("GenericTypesWithBasicTypes")

package com.example.smoke

import com.example.NativeBase

class GenericTypesWithBasicTypes : NativeBase {

    class StructWithGenerics {
        @JvmField var numbersList: MutableList<Short>
        @JvmField var numbersMap: MutableMap<Short, String>
        @JvmField var numbersSet: MutableSet<Short>



        constructor(numbersList: MutableList<Short>, numbersMap: MutableMap<Short, String>, numbersSet: MutableSet<Short>) {
            this.numbersList = numbersList
            this.numbersMap = numbersMap
            this.numbersSet = numbersSet
        }





    }



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun methodWithList(input: MutableList<Int>) : MutableList<Int>


    external fun methodWithMap(input: MutableMap<Int, Boolean>) : MutableMap<Int, Boolean>


    external fun methodWithSet(input: MutableSet<Int>) : MutableSet<Int>


    external fun methodWithListTypeAlias(input: MutableList<String>) : MutableList<String>


    external fun methodWithMapTypeAlias(input: MutableMap<String, String>) : MutableMap<String, String>


    external fun methodWithSetTypeAlias(input: MutableSet<String>) : MutableSet<String>

    var listProperty: MutableList<Float>
        external get
        external set

    var mapProperty: MutableMap<Float, Double>
        external get
        external set

    var setProperty: MutableSet<Float>
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
