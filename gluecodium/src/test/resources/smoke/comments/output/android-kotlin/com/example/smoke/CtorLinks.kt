/*

 *
 */

@file:JvmName("CtorLinksExtensions")

package com.example.smoke

import com.example.NativeBase

class CtorLinks : NativeBase {

    /**
     * This class has just one constructor [com.example.smoke.CtorLinks.SingleCtor.SingleCtor].
     */
    class SingleCtor : NativeBase {




        constructor() : this(create(), null as Any?) {
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

            @JvmStatic external fun create() : Long
        }
    }

    /**
     * This class has just one constructor with one argument [com.example.smoke.CtorLinks.SingleCtorWithOneArgument.SingleCtorWithOneArgument].
     */
    class SingleCtorWithOneArgument : NativeBase {




        constructor(arg: Int) : this(create(arg), null as Any?) {
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

            @JvmStatic external fun create(arg: Int) : Long
        }
    }

    /**
     * This class has just one constructor with two argument [com.example.smoke.CtorLinks.SingleCtorWithTwoArgument.SingleCtorWithTwoArgument].
     */
    class SingleCtorWithTwoArgument : NativeBase {




        constructor(arg: Int, arg2: String) : this(create(arg, arg2), null as Any?) {
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

            @JvmStatic external fun create(arg: Int, arg2: String) : Long
        }
    }

    class OverloadedCtors : NativeBase {




        constructor(input: String) : this(create(input), null as Any?) {
            cacheThisInstance();
        }
        /**
         *
         * @param input
         * @param flag
         */
        @Deprecated("Use [com.example.smoke.CtorLinks.OverloadedCtors.OverloadedCtors] instead.")

        constructor(input: String, flag: Boolean) : this(create(input, flag), null as Any?) {
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

            @JvmStatic external fun create(input: String) : Long

            @JvmStatic external fun create(input: String, flag: Boolean) : Long
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

