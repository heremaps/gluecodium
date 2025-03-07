/*

 *
 */

package com.example.smoke

import java.util.Locale

class LocaleDefaults {
    var english: Locale
    var latAmSpanish: Locale
    var romanshSursilvan: Locale
    var serbianCyrillic: Locale
    var traditionalChineseTaiwan: Locale
    var zuerichGerman: Locale



    constructor() {
        this.english = Locale.forLanguageTag("en")
        this.latAmSpanish = Locale.forLanguageTag("es-419")
        this.romanshSursilvan = Locale.forLanguageTag("rm-sursilv")
        this.serbianCyrillic = Locale.forLanguageTag("sr-Cyrl")
        this.traditionalChineseTaiwan = Locale.forLanguageTag("nan-Hant-TW")
        this.zuerichGerman = Locale.forLanguageTag("gsw-u-sd-chzh")
    }




}

