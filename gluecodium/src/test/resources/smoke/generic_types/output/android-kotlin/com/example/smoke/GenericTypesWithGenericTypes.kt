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





    external fun methodWithListOfLists(input: List<@JvmSuppressWildcards List<@JvmSuppressWildcards Int>>) : List<@JvmSuppressWildcards List<@JvmSuppressWildcards Int>>


    external fun methodWithMapOfMaps(input: Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards Boolean>>) : Map<@JvmSuppressWildcards Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards Boolean>, @JvmSuppressWildcards Boolean>


    external fun methodWithSetOfSets(input: Set<@JvmSuppressWildcards Set<@JvmSuppressWildcards Int>>) : Set<@JvmSuppressWildcards Set<@JvmSuppressWildcards Int>>


    external fun methodWithListAndMap(input: List<@JvmSuppressWildcards Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards Boolean>>) : Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards List<@JvmSuppressWildcards Int>>


    external fun methodWithListAndSet(input: List<@JvmSuppressWildcards Set<@JvmSuppressWildcards Int>>) : Set<@JvmSuppressWildcards List<@JvmSuppressWildcards Int>>


    external fun methodWithMapAndSet(input: Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards Set<@JvmSuppressWildcards Int>>) : Set<@JvmSuppressWildcards Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards Boolean>>


    external fun methodWithMapGenericKeys(input: Map<@JvmSuppressWildcards Set<@JvmSuppressWildcards Int>, @JvmSuppressWildcards Boolean>) : Map<@JvmSuppressWildcards List<@JvmSuppressWildcards Int>, @JvmSuppressWildcards Boolean>




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


