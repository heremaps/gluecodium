/*

 *
 */

@file:JvmName("ChildClassFromClass")

package com.example.smoke


class ChildClassFromClass : ParentClass {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, tag) {}





    external fun childClassMethod() : Unit




}

