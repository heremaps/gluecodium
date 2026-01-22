/*

 *
 */

@file:JvmName("GenericTypesWithGenericTypesExtensions")


package com.example.smoke

import com.example.NativeBase

class GenericTypesWithGenericTypes : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun methodWithListOfLists(input: List<List<Int>>) : List<List<Int>>


    external fun methodWithMapOfMaps(input: Map<Int, Map<Int, Boolean>>) : Map<Map<Int, Boolean>, Boolean>


    external fun methodWithSetOfSets(input: Set<Set<Int>>) : Set<Set<Int>>


    external fun methodWithListAndMap(input: List<Map<Int, Boolean>>) : Map<Int, List<Int>>


    external fun methodWithListAndSet(input: List<Set<Int>>) : Set<List<Int>>


    external fun methodWithMapAndSet(input: Map<Int, Set<Int>>) : Set<Map<Int, Boolean>>


    external fun methodWithMapGenericKeys(input: Map<Set<Int>, Boolean>) : Map<List<Int>, Boolean>




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


