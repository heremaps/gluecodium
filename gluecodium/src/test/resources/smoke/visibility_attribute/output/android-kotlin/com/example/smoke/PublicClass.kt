/*

 *
 */

@file:JvmName("PublicClassExtensions")


package com.example.smoke

import com.example.NativeBase

class PublicClass : NativeBase {

    internal enum class InternalEnum(@JvmField @JvmSynthetic internal val value: Int) {
        FOO(0),
        BAR(1);
    }
    internal class InternalStruct {
        @JvmField var stringField: String



        constructor(stringField: String) {
            this.stringField = stringField
        }





    }

    class PublicStruct {
        @JvmField @JvmSynthetic internal var internalField: PublicClass.InternalStruct



        internal constructor(internalField: PublicClass.InternalStruct) {
            this.internalField = internalField
        }





    }

    class PublicStructWithInternalDefaults {
        @JvmField @JvmSynthetic internal var internalField: String
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





    @JvmSynthetic @JvmName("internalMethod") internal external fun internalMethod(input: PublicClass.InternalStruct) : PublicClass.InternalStruct

    internal var internalStructProperty: PublicClass.InternalStruct
        @JvmSynthetic @JvmName("getInternalStructProperty") external get
        @JvmSynthetic @JvmName("setInternalStructProperty") external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


