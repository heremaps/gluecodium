/*

 *
 */

@file:JvmName("CalculatorListenerExtensions")


package com.example.smoke


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

