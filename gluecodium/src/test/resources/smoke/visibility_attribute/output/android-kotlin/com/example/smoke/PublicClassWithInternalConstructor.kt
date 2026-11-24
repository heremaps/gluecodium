/*

 *
 */

@file:JvmName("PublicClassWithInternalConstructorExtensions")


package com.example.smoke

import com.example.NativeBase

class PublicClassWithInternalConstructor : NativeBase {




    constructor() : this(create(), null as Any?) {
        cacheThisInstance();
    }


    private constructor(value: Int) : this(create(value), null as Any?) {
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






    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

        @JvmStatic private external fun create() : Long

        @JvmStatic @JvmSynthetic @JvmName("create") private external fun create(value: Int) : Long
        @JvmSynthetic internal operator fun invoke(value: Int): PublicClassWithInternalConstructor = PublicClassWithInternalConstructor(value)
    }
}

