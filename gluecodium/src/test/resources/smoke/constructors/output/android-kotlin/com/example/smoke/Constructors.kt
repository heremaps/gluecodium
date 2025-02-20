/*

 *
 */

package com.example.smoke

import com.example.NativeBase

open class Constructors : NativeBase {

    enum class ErrorEnum(private val value: Int) {
        NONE(0),
        CRASHED(1);
    }
    class ConstructorExplodedException(val error: Constructors.ErrorEnum) : Exception(error.toString())



    constructor() : this(create(), null as Any?) {
        cacheThisInstance();
    }
    constructor(other: Constructors) : this(create(other), null as Any?) {
        cacheThisInstance();
    }
    constructor(foo: String, bar: Long) : this(create(foo, bar), null as Any?) {
        cacheThisInstance();
    }
    constructor(input: String) : this(create(input), null as Any?) {
        cacheThisInstance();
    }
    constructor(input: MutableList<Double>) : this(create(input), null as Any?) {
        cacheThisInstance();
    }
    constructor(input: Long) : this(create(input), null as Any?) {
        cacheThisInstance();
    }

    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    private external fun cacheThisInstance()





    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun create() : Long
        @JvmStatic external fun create(other: Constructors) : Long
        @JvmStatic external fun create(foo: String, bar: Long) : Long
        @JvmStatic external fun create(input: String) : Long
        @JvmStatic external fun create(input: MutableList<Double>) : Long
        @JvmStatic external fun create(input: Long) : Long
    }
}
