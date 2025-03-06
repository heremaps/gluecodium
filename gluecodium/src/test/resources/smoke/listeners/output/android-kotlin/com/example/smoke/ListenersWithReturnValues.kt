/*

 *
 */

package com.example.smoke


interface ListenersWithReturnValues {
    enum class ResultEnum(private val value: Int) {
        NONE(0),
        RESULT(1);
    }
    class ResultStruct {
        var result: Double



        constructor(result: Double) {
            this.result = result
        }




    }


    fun fetchDataDouble() : Double
    fun fetchDataString() : String
    fun fetchDataStruct() : ListenersWithReturnValues.ResultStruct
    fun fetchDataEnum() : ListenersWithReturnValues.ResultEnum
    fun fetchDataArray() : MutableList<Double>
    fun fetchDataMap() : MutableMap<String, Double>
    fun fetchDataInstance() : CalculationResult


}

