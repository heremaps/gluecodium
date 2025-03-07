/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class ListenerWithPropertiesImpl : NativeBase, ListenerWithProperties {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
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
