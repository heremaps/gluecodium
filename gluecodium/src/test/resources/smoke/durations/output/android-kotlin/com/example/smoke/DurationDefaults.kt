/*

 *
 */

@file:JvmName("DurationDefaults")

package com.example.smoke

import com.example.time.Duration

class DurationDefaults {
    @JvmField var dayz: Duration
    @JvmField var hourz: Duration
    @JvmField var minutez: Duration
    @JvmField var secondz: Duration
    @JvmField var milliz: Duration
    @JvmField var microz: Duration
    @JvmField var nanoz: Duration



    constructor() {
        this.dayz = Duration.ofDays(28L)
        this.hourz = Duration.ofHours(22L)
        this.minutez = Duration.ofMinutes(45L)
        this.secondz = Duration.ofSeconds(42L)
        this.milliz = Duration.ofMillis(500L)
        this.microz = Duration.ofNanos(665000L)
        this.nanoz = Duration.ofNanos(314635L)
    }





}

