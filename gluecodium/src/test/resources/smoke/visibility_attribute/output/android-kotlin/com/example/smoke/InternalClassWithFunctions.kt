/*

 *
 */

@file:JvmName("InternalClassWithFunctionsExtensions")


package com.example.smoke

import com.example.NativeBase

internal class InternalClassWithFunctions : NativeBase {




    private constructor() : this(make(), null as Any?) {
        cacheThisInstance();
    }


    private constructor(foo: String) : this(make(foo), null as Any?) {
        cacheThisInstance();
    }

    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    private external fun cacheThisInstance()




    @JvmSynthetic @JvmName("fooBar") internal external fun fooBar() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

        @JvmStatic @JvmSynthetic @JvmName("make") private external fun make() : Long

        @JvmStatic @JvmSynthetic @JvmName("make") private external fun make(foo: String) : Long
        @JvmSynthetic internal operator fun invoke(): InternalClassWithFunctions = InternalClassWithFunctions()
        @JvmSynthetic internal operator fun invoke(foo: String): InternalClassWithFunctions = InternalClassWithFunctions(foo)
    }
}


