/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class CalculatorListenerImpl : NativeBase, CalculatorListener {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
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
