/*

 *
 */

@file:JvmName("CtorLinks")

package com.example.smoke

import com.example.NativeBase

class CtorLinks : NativeBase {

    class SingleCtor : NativeBase {


        constructor() : this(create(), null as Any?) {
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
        }
    }
    class SingleCtorWithOneArgument : NativeBase {


        constructor(arg: Int) : this(create(arg), null as Any?) {
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
            @JvmStatic external fun create(arg: Int) : Long
        }
    }
    class SingleCtorWithTwoArgument : NativeBase {


        constructor(arg: Int, arg2: String) : this(create(arg, arg2), null as Any?) {
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
            @JvmStatic external fun create(arg: Int, arg2: String) : Long
        }
    }
    class OverloadedCtors : NativeBase {


        constructor(input: String) : this(create(input), null as Any?) {
            cacheThisInstance();
        }
        constructor(input: String, flag: Boolean) : this(create(input, flag), null as Any?) {
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
            @JvmStatic external fun create(input: String) : Long
            @JvmStatic external fun create(input: String, flag: Boolean) : Long
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
    }
}
