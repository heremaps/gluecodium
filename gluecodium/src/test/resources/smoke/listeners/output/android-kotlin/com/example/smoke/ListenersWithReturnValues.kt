/*

 *
 */

@file:JvmName("ListenersWithReturnValues")

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


    fun fetchDataArray() : MutableList<Double>


    fun fetchDataMap() : MutableMap<String, Double>


    fun fetchDataInstance() : CalculationResult


}

