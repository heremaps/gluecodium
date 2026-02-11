/*

 *
 */

@file:JvmName("ListenerWithPropertiesExtensions")


package com.example.smoke

import com.example.NativeBase

interface ListenerWithProperties {
    enum class ResultEnum(@JvmField val value: Int) {
        NONE(0),
        RESULT(1);
    }
    class ResultStruct {
        @JvmField var result: Double



        constructor(result: Double) {
            this.result = result
        }





    }



    var message: String
        get
        set

    var packedMessage: CalculationResult
        get
        set

    var structuredMessage: ListenerWithProperties.ResultStruct
        get
        set

    var enumeratedMessage: ListenerWithProperties.ResultEnum
        get
        set

    var arrayedMessage: List<String>
        get
        set

    var mappedMessage: Map<String, Double>
        get
        set

    var bufferedMessage: ByteArray
        get
        set


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class ListenerWithPropertiesImpl : NativeBase, ListenerWithProperties {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    override var message: String
        external get
        external set

    override var packedMessage: CalculationResult
        external get
        external set

    override var structuredMessage: ListenerWithProperties.ResultStruct
        external get
        external set

    override var enumeratedMessage: ListenerWithProperties.ResultEnum
        external get
        external set

    override var arrayedMessage: List<String>
        external get
        external set

    override var mappedMessage: Map<String, Double>
        external get
        external set

    override var bufferedMessage: ByteArray
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
