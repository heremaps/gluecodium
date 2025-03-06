/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class ListenersWithReturnValuesImpl : NativeBase, ListenersWithReturnValues {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun fetchDataDouble() : Double
    override external fun fetchDataString() : String
    override external fun fetchDataStruct() : ListenersWithReturnValues.ResultStruct
    override external fun fetchDataEnum() : ListenersWithReturnValues.ResultEnum
    override external fun fetchDataArray() : MutableList<Double>
    override external fun fetchDataMap() : MutableMap<String, Double>
    override external fun fetchDataInstance() : CalculationResult



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
