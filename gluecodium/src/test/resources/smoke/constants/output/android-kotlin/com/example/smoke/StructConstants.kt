/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class StructConstants : NativeBase {

    class SomeStruct(var stringField: String,
        var floatField: Float) {




    }


    class NestingStruct(var structField: StructConstants.SomeStruct) {




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
        val STRUCT_CONSTANT: StructConstants.SomeStruct = StructConstants.SomeStruct("bar Buzz", 1.41f)
        val NESTING_STRUCT_CONSTANT: StructConstants.NestingStruct = StructConstants.NestingStruct(StructConstants.SomeStruct("nonsense", -2.82f))
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
