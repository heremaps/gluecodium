/*

 *
 */

@file:JvmName("KotlinExternalTypesStruct")

package com.example.kotlinsmoke


class KotlinExternalTypesStruct {
    @JvmField var currency: java.util.Currency
    @JvmField var timeZone: java.util.SimpleTimeZone
    @JvmField var month: java.time.Month
    @JvmField var color: kotlin.Int?
    @JvmField var season: kotlin.String



    constructor(currency: java.util.Currency, timeZone: java.util.SimpleTimeZone, month: java.time.Month, color: kotlin.Int?, season: kotlin.String) {
        this.currency = currency
        this.timeZone = timeZone
        this.month = month
        this.color = color
        this.season = season
    }





}

