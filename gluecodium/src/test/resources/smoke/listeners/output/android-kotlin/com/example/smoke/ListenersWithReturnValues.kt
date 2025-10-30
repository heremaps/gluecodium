/*

 *
 */

@file:JvmName("ListenersWithReturnValuesExtensions")

package com.example.smoke


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

