/*

 *
 */

@file:JvmName("GenericTypesWithBasicTypesExtensions")

package com.example.smoke

import com.example.NativeBase

class GenericTypesWithBasicTypes : NativeBase {

    class StructWithGenerics {
        @JvmField var numbersList: List<@JvmSuppressWildcards Short>
        @JvmField var numbersMap: Map<@JvmSuppressWildcards Short, @JvmSuppressWildcards String>
        @JvmField var numbersSet: Set<@JvmSuppressWildcards Short>



        constructor(numbersList: List<@JvmSuppressWildcards Short>, numbersMap: Map<@JvmSuppressWildcards Short, @JvmSuppressWildcards String>, numbersSet: Set<@JvmSuppressWildcards Short>) {
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





    external fun methodWithList(input: List<@JvmSuppressWildcards Int>) : List<@JvmSuppressWildcards Int>


    external fun methodWithMap(input: Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards Boolean>) : Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards Boolean>


    external fun methodWithSet(input: Set<@JvmSuppressWildcards Int>) : Set<@JvmSuppressWildcards Int>


    external fun methodWithListTypeAlias(input: List<@JvmSuppressWildcards String>) : List<@JvmSuppressWildcards String>


    external fun methodWithMapTypeAlias(input: Map<@JvmSuppressWildcards String, @JvmSuppressWildcards String>) : Map<@JvmSuppressWildcards String, @JvmSuppressWildcards String>


    external fun methodWithSetTypeAlias(input: Set<@JvmSuppressWildcards String>) : Set<@JvmSuppressWildcards String>

    var listProperty: List<@JvmSuppressWildcards Float>
        external get
        external set

    var mapProperty: Map<@JvmSuppressWildcards Float, @JvmSuppressWildcards Double>
        external get
        external set

    var setProperty: Set<@JvmSuppressWildcards Float>
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


