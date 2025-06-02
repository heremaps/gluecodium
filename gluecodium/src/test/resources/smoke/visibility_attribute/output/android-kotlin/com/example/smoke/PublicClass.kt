/*

 *
 */

@file:JvmName("PublicClass")

package com.example.smoke

import com.example.NativeBase

class PublicClass : NativeBase {

    enum class InternalEnum(@JvmField val value: Int) {
        FOO(0),
        BAR(1);
    }
    class InternalStruct {
        @JvmField var stringField: String



        constructor(stringField: String) {
            this.stringField = stringField
        }





    }

    class PublicStruct {
        @JvmField var internalField: PublicClass.InternalStruct



        constructor(internalField: PublicClass.InternalStruct) {
            this.internalField = internalField
        }





    }

    class PublicStructWithInternalDefaults {
        @JvmField var internalField: String
        @JvmField var publicField: Float



        constructor(publicField: Float) {
            this.internalField = "foo"
            this.publicField = publicField
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





    @JvmName("internalMethod") internal external fun internalMethod(input: PublicClass.InternalStruct) : PublicClass.InternalStruct

    var internalStructProperty: PublicClass.InternalStruct
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

