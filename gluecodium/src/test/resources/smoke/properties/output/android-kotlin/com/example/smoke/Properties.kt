/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class Properties : NativeBase {

    enum class InternalErrorCode(private val value: Int) {
        ERROR_NONE(0),
        ERROR_FATAL(999);
    }
    class ExampleStruct {
        var value: Double



        constructor(value: Double) {
            this.value = value
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



    var builtInTypeProperty: Long
        external get
        external set
    val readonlyProperty: Float
        external get
    var structProperty: Properties.ExampleStruct
        external get
        external set
    var arrayProperty: List<String>
        external get
        external set
    var complexTypeProperty: Properties.InternalErrorCode
        external get
        external set
    var byteBufferProperty: ByteArray
        external get
        external set
    var instanceProperty: PropertiesInterface
        external get
        external set
    var isBooleanProperty: Boolean
        external get
        external set


    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic var staticProperty: String
            external get
            external set
        @JvmStatic val staticReadonlyProperty: Properties.ExampleStruct
            external get
    }
}
