/*

 *
 */

@file:JvmName("ListenerWithPropertiesImplExtensions")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class ListenerWithPropertiesImpl : NativeBase, ListenerWithProperties {
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

    override var arrayedMessage: MutableList<String>
        external get
        external set

    override var mappedMessage: MutableMap<String, Double>
        external get
        external set

    override var bufferedMessage: ByteArray
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
