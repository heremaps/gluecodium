/*

 *
 */

@file:JvmName("ListenersWithReturnValuesImplExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class ListenersWithReturnValuesImpl : NativeBase, ListenersWithReturnValues {
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
