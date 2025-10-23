/*

 *
 */

@file:JvmName("EnumDefaultsExternalExtensions")

package com.example.smoke

import com.example.NativeBase

class EnumDefaultsExternal : NativeBase {

    class SimpleEnum {
        @JvmField var enumField: foo.AlienEnum1



        constructor() {
            this.enumField = foo.AlienEnum1.DISABLED
        }





    }

    class NullableEnum {
        @JvmField var enumField1: foo.AlienEnum2?
        @JvmField var enumField2: foo.AlienEnum2?



        constructor() {
            this.enumField1 = null
            this.enumField2 = foo.AlienEnum2.DISABLED
        }





    }

    class AliasEnum {
        @JvmField var enumField: foo.AlienEnum3



        constructor() {
            this.enumField = foo.AlienEnum3.DISABLED
        }





    }

    class WrappedEnum {
        @JvmField var structField: EnumWrapper



        constructor() {
            this.structField = EnumWrapper(foo.AlienEnum4.DISABLED)
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







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

