/*

 *
 */

@file:JvmName("KotlinExternalTypesStruct")

package com.example.kotlinsmoke


class KotlinExternalTypesStruct {
    var currency: java.util.Currency
    var timeZone: java.util.SimpleTimeZone
    var month: java.time.Month
    var color: kotlin.Int?
    var season: kotlin.String



    constructor(currency: java.util.Currency, timeZone: java.util.SimpleTimeZone, month: java.time.Month, color: kotlin.Int?, season: kotlin.String) {
        this.currency = currency
        this.timeZone = timeZone
        this.month = month
        this.color = color
        this.season = season
    }





}

