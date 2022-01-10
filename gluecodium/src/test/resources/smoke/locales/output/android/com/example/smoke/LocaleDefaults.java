/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import java.util.Locale;
public final class LocaleDefaults {
    @NonNull
    public Locale english;
    @NonNull
    public Locale latAmSpanish;
    @NonNull
    public Locale romanshSursilvan;
    @NonNull
    public Locale serbianCyrillic;
    @NonNull
    public Locale traditionalChineseTaiwan;
    @NonNull
    public Locale zuerichGerman;
    public LocaleDefaults() {
        this.english = Locale.forLanguageTag("en");
        this.latAmSpanish = Locale.forLanguageTag("es-419");
        this.romanshSursilvan = Locale.forLanguageTag("rm-sursilv");
        this.serbianCyrillic = Locale.forLanguageTag("sr-Cyrl");
        this.traditionalChineseTaiwan = Locale.forLanguageTag("nan-Hant-TW");
        this.zuerichGerman = Locale.forLanguageTag("gsw-u-sd-chzh");
    }
}
