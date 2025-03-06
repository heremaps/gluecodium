/*

 *
 */

package com.example.smoke


interface CalculatorListener {
    class ResultStruct {
        var result: Double



        constructor(result: Double) {
            this.result = result
        }




    }


    fun onCalculationResult(calculationResult: Double) : Unit
    fun onCalculationResultConst(calculationResult: Double) : Unit
    fun onCalculationResultStruct(calculationResult: CalculatorListener.ResultStruct) : Unit
    fun onCalculationResultArray(calculationResult: MutableList<Double>) : Unit
    fun onCalculationResultMap(calculationResults: MutableMap<String, Double>) : Unit
    fun onCalculationResultInstance(calculationResult: CalculationResult) : Unit


}

