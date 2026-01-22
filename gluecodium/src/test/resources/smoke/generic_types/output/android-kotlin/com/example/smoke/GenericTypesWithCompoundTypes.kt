/*

 *
 */

@file:JvmName("GenericTypesWithCompoundTypesExtensions")


package com.example.smoke

import com.example.NativeBase

class GenericTypesWithCompoundTypes : NativeBase {

    enum class SomeEnum(@JvmField val value: Int) {
        FOO(0),
        BAR(1);
    }
    enum class ExternalEnum(@JvmField val value: Int) {
        ON(0),
        OFF(1);
    }
    class BasicStruct {
        @JvmField var value: Double



        constructor(value: Double) {
            this.value = value
        }





    }

    class ExternalStruct {
        @JvmField var string: String



        constructor(string: String) {
            this.string = string
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





    external fun methodWithStructList(input: List<GenericTypesWithCompoundTypes.BasicStruct>) : List<GenericTypesWithCompoundTypes.ExternalStruct>


    external fun methodWithStructMap(input: Map<String, GenericTypesWithCompoundTypes.BasicStruct>) : Map<String, GenericTypesWithCompoundTypes.ExternalStruct>


    external fun methodWithEnumList(input: List<GenericTypesWithCompoundTypes.SomeEnum>) : List<GenericTypesWithCompoundTypes.ExternalEnum>


    external fun methodWithEnumMapKey(input: Map<GenericTypesWithCompoundTypes.SomeEnum, Boolean>) : Map<GenericTypesWithCompoundTypes.ExternalEnum, Boolean>


    external fun methodWithEnumMapValue(input: Map<Int, GenericTypesWithCompoundTypes.SomeEnum>) : Map<Int, GenericTypesWithCompoundTypes.ExternalEnum>


    external fun methodWithEnumSet(input: Set<GenericTypesWithCompoundTypes.SomeEnum>) : Set<GenericTypesWithCompoundTypes.ExternalEnum>


    external fun methodWithInstancesList(input: List<DummyClass>) : List<@JvmSuppressWildcards DummyInterface>


    external fun methodWithInstancesMap(input: Map<Int, DummyClass>) : Map<Int, @JvmSuppressWildcards DummyInterface>




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


