/*

 *
 */

@file:JvmName("FirstParentIsClassClass")

package com.example.smoke


class FirstParentIsClassClass : ParentClass, ParentNarrowOne {



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, tag) {}



    external fun childFunction() : Unit

    var childProperty: String
        external get
        external set


    override external fun parentFunctionOne() : Unit
    override var parentPropertyOne: String
        external get
        external set



}
