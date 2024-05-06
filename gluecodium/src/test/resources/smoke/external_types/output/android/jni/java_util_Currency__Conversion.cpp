/*

 *
 */

#include "java_util_Currency__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::Currency
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::Currency>)
{
    
    auto j_currency_code = call_java_method<jstring>(_jenv, _jinput, "getCurrencyCode", "()Ljava/lang/String;");
    auto n_currency_code = convert_from_jni(_jenv, j_currency_code, TypeId<::std::string>{});
    
    auto n_numeric_code = call_java_method<jint>(_jenv, _jinput, "getNumericCode", "()I");
    
    return ::smoke::Currency(std::move(n_currency_code), std::move(n_numeric_code));
}

std::optional<::smoke::Currency>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::Currency>>)
{
    return _jinput
        ? std::optional<::smoke::Currency>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::Currency>{}))
        : std::optional<::smoke::Currency>{};
}

REGISTER_JNI_CLASS_CACHE("java/util/Currency", java_util_Currency, ::smoke::Currency)

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::Currency& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::Currency>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "currencyCode", _ninput.currency_code);

    ::gluecodium::jni::set_field_value(_jenv, _jresult, "numericCode", _ninput.numeric_code);
    return _jresult;
}

JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::Currency> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
