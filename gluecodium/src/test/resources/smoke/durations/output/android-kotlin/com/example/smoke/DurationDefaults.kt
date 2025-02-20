/*

 *
 */

package com.example.smoke

import com.example.time.Duration

class DurationDefaults {
    var dayz: Duration
    var hourz: Duration
    var minutez: Duration
    var secondz: Duration
    var milliz: Duration
    var microz: Duration
    var nanoz: Duration



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

