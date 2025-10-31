/*

 *
 */

@file:JvmName("ListenerWithPropertiesExtensions")

package com.example.smoke


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

    var arrayedMessage: List<@JvmSuppressWildcards String>
        get
        set

    var mappedMessage: Map<@JvmSuppressWildcards String, @JvmSuppressWildcards Double>
        get
        set

    var bufferedMessage: ByteArray
        get
        set


}

