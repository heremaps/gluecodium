/*

 *
 */

@file:JvmName("TypeDefsExtensions")

package com.example.smoke

import com.example.NativeBase

class TypeDefs : NativeBase {

    class StructHavingAliasFieldDefinedBelow {
        @JvmField var field: Double



        constructor(field: Double) {
            this.field = field
        }





    }

    class TestStruct {
        @JvmField var something: String



        constructor(something: String) {
            this.something = something
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




    var primitiveTypeProperty: MutableList<Double>
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic external fun methodWithPrimitiveTypeDef(input: Double) : Double


        @JvmStatic external fun methodWithComplexTypeDef(input: MutableList<TypeDefs.TestStruct>) : MutableList<TypeDefs.TestStruct>


        @JvmStatic external fun returnNestedIntTypeDef(input: Double) : Double


        @JvmStatic external fun returnTestStructTypeDef(input: TypeDefs.TestStruct) : TypeDefs.TestStruct


        @JvmStatic external fun returnNestedStructTypeDef(input: TypeDefs.TestStruct) : TypeDefs.TestStruct


        @JvmStatic external fun returnTypeDefPointFromTypeCollection(input: TypeCollection.Point) : TypeCollection.Point
    }
}

