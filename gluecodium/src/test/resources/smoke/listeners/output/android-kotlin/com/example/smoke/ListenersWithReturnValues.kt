/*

 *
 */

@file:JvmName("ListenersWithReturnValuesExtensions")


package com.example.smoke

import com.example.NativeBase

interface ListenersWithReturnValues {
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




    fun fetchDataDouble() : Double


    fun fetchDataString() : String


    fun fetchDataStruct() : ListenersWithReturnValues.ResultStruct


    fun fetchDataEnum() : ListenersWithReturnValues.ResultEnum


    fun fetchDataArray() : List<Double>


    fun fetchDataMap() : Map<String, Double>


    fun fetchDataInstance() : CalculationResult


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class ListenersWithReturnValuesImpl : NativeBase, ListenersWithReturnValues {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun fetchDataDouble() : Double


    override external fun fetchDataString() : String


    override external fun fetchDataStruct() : ListenersWithReturnValues.ResultStruct


    override external fun fetchDataEnum() : ListenersWithReturnValues.ResultEnum


    override external fun fetchDataArray() : List<Double>


    override external fun fetchDataMap() : Map<String, Double>


    override external fun fetchDataInstance() : CalculationResult



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
