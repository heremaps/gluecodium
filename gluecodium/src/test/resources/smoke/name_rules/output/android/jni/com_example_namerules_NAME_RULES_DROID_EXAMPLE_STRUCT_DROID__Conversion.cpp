/*
 *
 */
#include "com_example_namerules_NAME_RULES_DROID_EXAMPLE_STRUCT_DROID__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
namespace jni
{
::namerules::NameRules::ExampleStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::namerules::NameRules::ExampleStruct* dummy)
{
    ::namerules::NameRules::ExampleStruct _nout{};
    double n_m_value = ::jni::get_field_value(
        _jenv,
        _jinput,
        "j_value",
        (double*)nullptr );
    _nout.m_value = n_m_value;
    ::std::vector< int64_t > n_m_int_value = convert_from_jni(
        _jenv,
        ::jni::get_object_field_value(_jenv, _jinput, "j_int_value", "Ljava/util/List;"),
        (::std::vector< int64_t >*)nullptr );
    _nout.m_int_value = n_m_int_value;
    return _nout;
}
::optional<::namerules::NameRules::ExampleStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::optional<::namerules::NameRules::ExampleStruct>* dummy)
{
    return _jinput
        ? ::optional<::namerules::NameRules::ExampleStruct>(convert_from_jni(_jenv, _jinput, (::namerules::NameRules::ExampleStruct*)nullptr))
        : ::optional<::namerules::NameRules::ExampleStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/namerules/NAME_RULES_DROID$EXAMPLE_STRUCT_DROID", com_example_namerules_NAME_1RULES_1DROID_00024EXAMPLE_1STRUCT_1DROID, ::namerules::NameRules::ExampleStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::namerules::NameRules::ExampleStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::namerules::NameRules::ExampleStruct>::java_class;
    auto _jresult = ::jni::alloc_object(_jenv, javaClass);
    ::jni::set_field_value(_jenv, _jresult, "j_value", _ninput.m_value);
    auto jm_int_value = convert_to_jni(_jenv, _ninput.m_int_value);
    ::jni::set_object_field_value(_jenv, _jresult, "j_int_value", "Ljava/util/List;", jm_int_value);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::optional<::namerules::NameRules::ExampleStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}