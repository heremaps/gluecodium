/*

 *
 */

@file:JvmName("ChildConstructors")

package com.example.smoke


class ChildConstructors : Constructors {



    constructor() : this(createNoArgsChild(), null as Any?) {
        cacheThisInstance();
    }

    constructor(other: Constructors) : this(createCopyFromParent(other), null as Any?) {
        cacheThisInstance();
    }

    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, tag) {}

    private external fun cacheThisInstance()






    companion object {

        @JvmStatic external fun createNoArgsChild() : Long

        @JvmStatic external fun createCopyFromParent(other: Constructors) : Long
    }
}
