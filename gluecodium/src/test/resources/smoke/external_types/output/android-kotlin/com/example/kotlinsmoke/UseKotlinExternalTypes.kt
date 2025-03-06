/*

 *
 */

package com.example.kotlinsmoke

import com.example.NativeBase

class UseKotlinExternalTypes : NativeBase {



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}






    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun currencyRoundTrip(input: java.util.Currency) : java.util.Currency
        @JvmStatic external fun timeZoneRoundTrip(input: java.util.SimpleTimeZone) : java.util.SimpleTimeZone
        @JvmStatic external fun monthRoundTrip(input: java.time.Month) : java.time.Month
        @JvmStatic external fun colorRoundTrip(input: kotlin.Int?) : kotlin.Int?
        @JvmStatic external fun seasonRoundTrip(input: kotlin.String) : kotlin.String
        @JvmStatic external fun structRoundTrip(input: KotlinExternalTypesStruct) : KotlinExternalTypesStruct
        @JvmStatic external fun veryBooleanUnbox(input: kotlin.Boolean?) : Boolean
    }
}
