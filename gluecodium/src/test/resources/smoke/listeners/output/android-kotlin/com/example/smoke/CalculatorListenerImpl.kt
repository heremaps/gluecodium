/*

 *
 */

@file:JvmName("CalculatorListenerImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class CalculatorListenerImpl : NativeBase, CalculatorListener {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun onCalculationResult(calculationResult: Double) : Unit


    override external fun onCalculationResultConst(calculationResult: Double) : Unit


    override external fun onCalculationResultStruct(calculationResult: CalculatorListener.ResultStruct) : Unit


    override external fun onCalculationResultArray(calculationResult: MutableList<Double>) : Unit


    override external fun onCalculationResultMap(calculationResults: MutableMap<String, Double>) : Unit


    override external fun onCalculationResultInstance(calculationResult: CalculationResult) : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
