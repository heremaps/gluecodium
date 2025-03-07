/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class Structs : NativeBase {

    class ExternalStruct {
        var stringField: String
        var externalStringField: String
        var externalArrayField: MutableList<Byte>
        var externalStructField: Structs.AnotherExternalStruct



        constructor(stringField: String, externalStringField: String, externalArrayField: MutableList<Byte>, externalStructField: Structs.AnotherExternalStruct) {
            this.stringField = stringField
            this.externalStringField = externalStringField
            this.externalArrayField = externalArrayField
            this.externalStructField = externalStructField
        }




    }

    class AnotherExternalStruct {
        var intField: Byte



        constructor(intField: Byte) {
            this.intField = intField
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






    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun getExternalStruct() : Structs.ExternalStruct
        @JvmStatic external fun getAnotherExternalStruct() : Structs.AnotherExternalStruct
    }
}
