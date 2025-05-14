/*

 *
 */

@file:JvmName("EnumDefaults")

package com.example.smoke

import com.example.NativeBase
import com.example.fire.Enum1
import com.example.fire.Enum2
import com.example.fire.Enum3
import com.example.fire.Enum4

class EnumDefaults : NativeBase {

    class SimpleEnum {
        @JvmField var enumField: Enum1



        constructor() {
            this.enumField = Enum1.DISABLED
        }





    }

    class NullableEnum {
        @JvmField var enumField1: Enum2?
        @JvmField var enumField1: Enum2?



        constructor() {
            this.enumField1 = null
            this.enumField1 = Enum2.DISABLED
        }





    }

    class AliasEnum {
        @JvmField var enumField: Enum3



        constructor() {
            this.enumField = Enum3.DISABLED
        }





    }

    class WrappedEnum {
        @JvmField var structField: EnumWrapper



        constructor() {
            this.structField = EnumWrapper(Enum4.DISABLED)
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

