/*
 *
 */
#include "java_util_Currency__Conversion.h"
#include "java_util_SimpleTimeZone__Conversion.h"
#include "java_time_Month__Conversion.h"
#include "java_lang_Integer__Conversion.h"
#include "java_lang_String__Conversion.h"
#include "com_example_smoke_JavaExternalTypesStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::JavaExternalTypesStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::JavaExternalTypesStruct*)
{
    ::smoke::Currency n_currency = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "currency", "Ljava/util/Currency;"),
        (::smoke::Currency*)nullptr );
    ::smoke::TimeZone n_time_zone = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "timeZone", "Ljava/util/SimpleTimeZone;"),
        (::smoke::TimeZone*)nullptr );
    ::smoke::Month n_month = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "month", "Ljava/time/Month;"),
        (::smoke::Month*)nullptr );
    ::smoke::SystemColor n_color = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "color", "Ljava/lang/Integer;"),
        (::smoke::SystemColor*)nullptr );
    ::smoke::Season n_season = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "season", "Ljava/lang/String;"),
        (::smoke::Season*)nullptr );
    return ::smoke::JavaExternalTypesStruct(std::move(n_currency), std::move(n_time_zone), std::move(n_month), std::move(n_color), std::move(n_season));
}
::gluecodium::optional<::smoke::JavaExternalTypesStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::JavaExternalTypesStruct>*)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::JavaExternalTypesStruct>(convert_from_jni(_jenv, _jinput, (::smoke::JavaExternalTypesStruct*)nullptr))
        : ::gluecodium::optional<::smoke::JavaExternalTypesStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/JavaExternalTypesStruct", com_example_smoke_JavaExternalTypesStruct, ::smoke::JavaExternalTypesStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::JavaExternalTypesStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::JavaExternalTypesStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    auto jcurrency = convert_to_jni(_jenv, _ninput.currency);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "currency", "Ljava/util/Currency;", jcurrency);
    auto jtime_zone = convert_to_jni(_jenv, _ninput.time_zone);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "timeZone", "Ljava/util/SimpleTimeZone;", jtime_zone);
    auto jmonth = convert_to_jni(_jenv, _ninput.month);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "month", "Ljava/time/Month;", jmonth);
    auto jcolor = convert_to_jni(_jenv, _ninput.color);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "color", "Ljava/lang/Integer;", jcolor);
    auto jseason = convert_to_jni(_jenv, _ninput.season);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "season", "Ljava/lang/String;", jseason);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::JavaExternalTypesStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
