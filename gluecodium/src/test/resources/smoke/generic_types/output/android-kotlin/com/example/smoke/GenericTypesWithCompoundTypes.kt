/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class GenericTypesWithCompoundTypes : NativeBase {

    enum class SomeEnum(private val value: Int) {
        FOO(0),
        BAR(1);
    }
    enum class ExternalEnum(private val value: Int) {
        ON(0),
        OFF(1);
    }
    class BasicStruct {
        var value: Double



        constructor(value: Double) {
            this.value = value
        }




    }

    class ExternalStruct {
        var string: String



        constructor(string: String) {
            this.string = string
        }




    }



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    external fun methodWithStructList(input: MutableList<GenericTypesWithCompoundTypes.BasicStruct>) : MutableList<GenericTypesWithCompoundTypes.ExternalStruct>
    external fun methodWithStructMap(input: MutableMap<String, GenericTypesWithCompoundTypes.BasicStruct>) : MutableMap<String, GenericTypesWithCompoundTypes.ExternalStruct>
    external fun methodWithEnumList(input: MutableList<GenericTypesWithCompoundTypes.SomeEnum>) : MutableList<GenericTypesWithCompoundTypes.ExternalEnum>
    external fun methodWithEnumMapKey(input: MutableMap<GenericTypesWithCompoundTypes.SomeEnum, Boolean>) : MutableMap<GenericTypesWithCompoundTypes.ExternalEnum, Boolean>
    external fun methodWithEnumMapValue(input: MutableMap<Int, GenericTypesWithCompoundTypes.SomeEnum>) : MutableMap<Int, GenericTypesWithCompoundTypes.ExternalEnum>
    external fun methodWithEnumSet(input: MutableSet<GenericTypesWithCompoundTypes.SomeEnum>) : MutableSet<GenericTypesWithCompoundTypes.ExternalEnum>
    external fun methodWithInstancesList(input: MutableList<DummyClass>) : MutableList<DummyInterface>
    external fun methodWithInstancesMap(input: MutableMap<Int, DummyClass>) : MutableMap<Int, DummyInterface>



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
