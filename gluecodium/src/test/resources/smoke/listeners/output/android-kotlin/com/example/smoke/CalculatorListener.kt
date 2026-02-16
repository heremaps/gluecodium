/*

 *
 */

@file:JvmName("CalculatorListenerExtensions")


package com.example.smoke

import com.example.NativeBase

interface CalculatorListener {
    class ResultStruct {
        @JvmField var result: Double



        constructor(result: Double) {
            this.result = result
        }





    }




    fun onCalculationResult(calculationResult: Double) : Unit


    fun onCalculationResultConst(calculationResult: Double) : Unit


    fun onCalculationResultStruct(calculationResult: CalculatorListener.ResultStruct) : Unit


    fun onCalculationResultArray(calculationResult: List<Double>) : Unit


    fun onCalculationResultMap(calculationResults: Map<String, Double>) : Unit


    fun onCalculationResultInstance(calculationResult: CalculationResult) : Unit


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class CalculatorListenerImpl : NativeBase, CalculatorListener {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun onCalculationResult(calculationResult: Double) : Unit


    override external fun onCalculationResultConst(calculationResult: Double) : Unit


    override external fun onCalculationResultStruct(calculationResult: CalculatorListener.ResultStruct) : Unit


    override external fun onCalculationResultArray(calculationResult: List<Double>) : Unit


    override external fun onCalculationResultMap(calculationResults: Map<String, Double>) : Unit


    override external fun onCalculationResultInstance(calculationResult: CalculationResult) : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
