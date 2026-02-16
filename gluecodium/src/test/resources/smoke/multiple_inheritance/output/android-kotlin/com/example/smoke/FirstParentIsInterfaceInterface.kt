/*

 *
 */

@file:JvmName("FirstParentIsInterfaceInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase
import com.example.another.SomeCoolClassType

interface FirstParentIsInterfaceInterface : ParentInterface, ParentNarrowOne {



    fun childFunction() : Unit

    var childProperty: String
        get
        set


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class FirstParentIsInterfaceInterfaceImpl : NativeBase, FirstParentIsInterfaceInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun childFunction() : Unit

    override var childProperty: String
        external get
        external set




    override external fun parentFunction() : Unit


    override external fun someFunctionThatUsesTypeFromAnotherPackage(someParam: SomeCoolClassType) : Unit


    override external fun parentFunctionOne() : Unit
    override var parentProperty: String
        external get
        external set

    override var parentPropertyOne: String
        external get
        external set


    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
