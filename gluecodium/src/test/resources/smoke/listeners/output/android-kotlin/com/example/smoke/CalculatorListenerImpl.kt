/*

 *
 */

@file:JvmName("CalculatorListenerImplExtensions")

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


    override external fun onCalculationResultArray(calculationResult: List<@JvmSuppressWildcards Double>) : Unit


    override external fun onCalculationResultMap(calculationResults: Map<@JvmSuppressWildcards String, @JvmSuppressWildcards Double>) : Unit


    override external fun onCalculationResultInstance(calculationResult: CalculationResult) : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
