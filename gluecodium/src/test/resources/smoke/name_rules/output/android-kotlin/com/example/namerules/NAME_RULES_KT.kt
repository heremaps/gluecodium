/*

 *
 */

package com.example.namerules

import com.example.NativeBase

class NAME_RULES_KT : NativeBase {

    enum class EXAMPLE_ERROR_CODE_KT(private val value: Int) {
        NONE(0),
        FATAL(1);
    }
    class ExampleException(val error: NAME_RULES_KT.EXAMPLE_ERROR_CODE_KT) : Exception(error.toString())


    class EXAMPLE_STRUCT_KT {
        var value: Double
        var int_value: MutableList<Long>



        constructor(value: Double, int_value: MutableList<Long>) {
            this.value = value
            this.int_value = int_value
        }




    }


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


    external fun some_method(someArgument: NAME_RULES_KT.EXAMPLE_STRUCT_KT) : Double

    var intProperty: Long
        external get
        external set

    var isBooleanProperty: Boolean
        external get
        external set

    var structProperty: NAME_RULES_KT.EXAMPLE_STRUCT_KT
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun create() : Long
    }
}
