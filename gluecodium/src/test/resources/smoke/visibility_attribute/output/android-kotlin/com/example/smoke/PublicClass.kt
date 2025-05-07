/*

 *
 */

@file:JvmName("PublicClass")

package com.example.smoke

import com.example.NativeBase

class PublicClass : NativeBase {

    internal enum class InternalEnum(private val value: Int) {
        FOO(0),
        BAR(1);
    }
    internal class InternalStruct {
        var stringField: String



        constructor(stringField: String) {
            this.stringField = stringField
        }





    }

    class PublicStruct {
        internal var internalField: PublicClass.InternalStruct



        internal constructor(internalField: PublicClass.InternalStruct) {
            this.internalField = internalField
        }





    }

    class PublicStructWithInternalDefaults {
        internal var internalField: String
        var publicField: Float



        constructor(publicField: Float) {
            this.internalField = "foo"
            this.publicField = publicField
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



    internal external fun internalMethod(input: PublicClass.InternalStruct) : PublicClass.InternalStruct

    internal var internalStructProperty: PublicClass.InternalStruct
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
