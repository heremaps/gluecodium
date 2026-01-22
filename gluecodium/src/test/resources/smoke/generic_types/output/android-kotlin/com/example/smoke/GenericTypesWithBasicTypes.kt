/*

 *
 */

@file:JvmName("GenericTypesWithBasicTypesExtensions")


package com.example.smoke

import com.example.NativeBase

class GenericTypesWithBasicTypes : NativeBase {

    class StructWithGenerics {
        @JvmField var numbersList: List<Short>
        @JvmField var numbersMap: Map<Short, String>
        @JvmField var numbersSet: Set<Short>



        constructor(numbersList: List<Short>, numbersMap: Map<Short, String>, numbersSet: Set<Short>) {
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
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun methodWithList(input: List<Int>) : List<Int>


    external fun methodWithMap(input: Map<Int, Boolean>) : Map<Int, Boolean>


    external fun methodWithSet(input: Set<Int>) : Set<Int>


    external fun methodWithListTypeAlias(input: List<String>) : List<String>


    external fun methodWithMapTypeAlias(input: Map<String, String>) : Map<String, String>


    external fun methodWithSetTypeAlias(input: Set<String>) : Set<String>

    var listProperty: List<Float>
        external get
        external set

    var mapProperty: Map<Float, Double>
        external get
        external set

    var setProperty: Set<Float>
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


