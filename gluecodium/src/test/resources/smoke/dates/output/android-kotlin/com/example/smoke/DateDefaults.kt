/*

 *
 */

@file:JvmName("DateDefaults")

package com.example.smoke

import java.util.Date

class DateDefaults {
    @JvmField var dateTime: Date
    @JvmField var dateTimeUtc: Date
    @JvmField var beforeEpoch: Date
    @JvmField var exactlyEpoch: Date



    constructor() {
        this.dateTime = Date(1643966117000L)
        this.dateTimeUtc = Date(1643966117000L)
        this.beforeEpoch = Date(-1511793883000L)
        this.exactlyEpoch = Date(0L)
    }





}

