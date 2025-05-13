/*

 *
 */

@file:JvmName("LocaleDefaults")

package com.example.smoke

import java.util.Locale

class LocaleDefaults {
    @JvmField var english: Locale
    @JvmField var latAmSpanish: Locale
    @JvmField var romanshSursilvan: Locale
    @JvmField var serbianCyrillic: Locale
    @JvmField var traditionalChineseTaiwan: Locale
    @JvmField var zuerichGerman: Locale



    constructor() {
        this.english = Locale.forLanguageTag("en")
        this.latAmSpanish = Locale.forLanguageTag("es-419")
        this.romanshSursilvan = Locale.forLanguageTag("rm-sursilv")
        this.serbianCyrillic = Locale.forLanguageTag("sr-Cyrl")
        this.traditionalChineseTaiwan = Locale.forLanguageTag("nan-Hant-TW")
        this.zuerichGerman = Locale.forLanguageTag("gsw-u-sd-chzh")
    }





}

