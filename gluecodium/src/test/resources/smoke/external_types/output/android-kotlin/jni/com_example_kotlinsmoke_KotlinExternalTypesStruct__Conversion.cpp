/*

 *
 */

#include "com_example_kotlinsmoke_KotlinExternalTypesStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::kotlin_smoke::KotlinExternalTypesStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::kotlin_smoke::KotlinExternalTypesStruct>)
{
    
    ::kotlin_smoke::Currency n_currency = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "currency", "Ljava/util/Currency;"),
        TypeId<::kotlin_smoke::Currency>{} );
    
    ::kotlin_smoke::TimeZone n_time_zone = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "timeZone", "Ljava/util/SimpleTimeZone;"),
        TypeId<::kotlin_smoke::TimeZone>{} );
    
    ::kotlin_smoke::Month n_month = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "month", "Ljava/time/Month;"),
        TypeId<::kotlin_smoke::Month>{} );
    
    ::kotlin_smoke::SystemColor n_color = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "color", "Ljava/lang/Integer;"),
        TypeId<::kotlin_smoke::SystemColor>{} );
    
    ::kotlin_smoke::Season n_season = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "season", "Ljava/lang/String;"),
        TypeId<::kotlin_smoke::Season>{} );
    
    return ::kotlin_smoke::KotlinExternalTypesStruct(std::move(n_currency), std::move(n_time_zone), std::move(n_month), std::move(n_color), std::move(n_season));
}

std::optional<::kotlin_smoke::KotlinExternalTypesStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::kotlin_smoke::KotlinExternalTypesStruct>>)
{
    return _jinput
        ? std::optional<::kotlin_smoke::KotlinExternalTypesStruct>(convert_from_jni(_jenv, _jinput, TypeId<::kotlin_smoke::KotlinExternalTypesStruct>{}))
        : std::optional<::kotlin_smoke::KotlinExternalTypesStruct>{};
}

REGISTER_JNI_CLASS_CACHE("com/example/kotlinsmoke/KotlinExternalTypesStruct", com_example_kotlinsmoke_KotlinExternalTypesStruct, ::kotlin_smoke::KotlinExternalTypesStruct)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::kotlin_smoke::KotlinExternalTypesStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::kotlin_smoke::KotlinExternalTypesStruct>::java_class;
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
convert_to_jni(JNIEnv* _jenv, const std::optional<::kotlin_smoke::KotlinExternalTypesStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
