/*

 *
 */

@file:JvmName("GenericTypesWithGenericTypes")

package com.example.smoke

import com.example.NativeBase

class GenericTypesWithGenericTypes : NativeBase {



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    external fun methodWithListOfLists(input: MutableList<MutableList<Int>>) : MutableList<MutableList<Int>>
    external fun methodWithMapOfMaps(input: MutableMap<Int, MutableMap<Int, Boolean>>) : MutableMap<MutableMap<Int, Boolean>, Boolean>
    external fun methodWithSetOfSets(input: MutableSet<MutableSet<Int>>) : MutableSet<MutableSet<Int>>
    external fun methodWithListAndMap(input: MutableList<MutableMap<Int, Boolean>>) : MutableMap<Int, MutableList<Int>>
    external fun methodWithListAndSet(input: MutableList<MutableSet<Int>>) : MutableSet<MutableList<Int>>
    external fun methodWithMapAndSet(input: MutableMap<Int, MutableSet<Int>>) : MutableSet<MutableMap<Int, Boolean>>
    external fun methodWithMapGenericKeys(input: MutableMap<MutableSet<Int>, Boolean>) : MutableMap<MutableList<Int>, Boolean>




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
