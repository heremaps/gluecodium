/*

 *
 */

#include "com_example_kotlinsmoke_KotlinExternalTypesStruct__Conversion.h"
#include "com_example_kotlinsmoke_UseKotlinExternalTypes.h"
#include "com_example_kotlinsmoke_UseKotlinExternalTypes__Conversion.h"
#include "java_time_Month__Conversion.h"
#include "java_util_Currency__Conversion.h"
#include "java_util_SimpleTimeZone__Conversion.h"
#include "kotlin_Boolean__Nullable____Conversion.h"
#include "kotlin_Int__Nullable____Conversion.h"
#include "kotlin_String__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_currencyRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::kotlin_smoke::Currency input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::kotlin_smoke::Currency>{});





    auto _result = ::kotlin_smoke::UseKotlinExternalTypes::currency_round_trip(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_timeZoneRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::kotlin_smoke::TimeZone input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::kotlin_smoke::TimeZone>{});





    auto _result = ::kotlin_smoke::UseKotlinExternalTypes::time_zone_round_trip(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_monthRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::kotlin_smoke::Month input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::kotlin_smoke::Month>{});





    auto _result = ::kotlin_smoke::UseKotlinExternalTypes::month_round_trip(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_colorRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::kotlin_smoke::SystemColor input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::kotlin_smoke::SystemColor>{});





    auto _result = ::kotlin_smoke::UseKotlinExternalTypes::color_round_trip(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_seasonRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::kotlin_smoke::Season input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::kotlin_smoke::Season>{});





    auto _result = ::kotlin_smoke::UseKotlinExternalTypes::season_round_trip(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_structRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::kotlin_smoke::KotlinExternalTypesStruct input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::kotlin_smoke::KotlinExternalTypesStruct>{});





    auto _result = ::kotlin_smoke::UseKotlinExternalTypes::struct_round_trip(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jboolean
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_veryBooleanUnbox(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::kotlin_smoke::VeryBoolean input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::kotlin_smoke::VeryBoolean>{});





    auto _result = ::kotlin_smoke::UseKotlinExternalTypes::very_boolean_unbox(input);

    return _result;
}



JNIEXPORT void JNICALL
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::kotlin_smoke::UseKotlinExternalTypes>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
