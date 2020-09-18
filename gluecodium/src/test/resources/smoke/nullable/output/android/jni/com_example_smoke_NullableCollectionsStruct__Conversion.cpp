/*
 *
 */
#include "com_example_smoke_NullableCollectionsStruct__Conversion.h"
#include "com_example_smoke_Nullable_SomeStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::NullableCollectionsStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::NullableCollectionsStruct*)
{
    ::smoke::NullableCollectionsStruct _nout{};
    ::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > > n_dates = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "dates", "Ljava/util/List;"),
        (::std::vector< ::gluecodium::optional< ::std::chrono::system_clock::time_point > >*)nullptr );
    _nout.dates = n_dates;
    ::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > > n_structs = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "structs", "Ljava/util/Map;"),
        (::std::unordered_map< int32_t, ::gluecodium::optional< ::smoke::Nullable::SomeStruct > >*)nullptr );
    _nout.structs = n_structs;
    return _nout;
}
::gluecodium::optional<::smoke::NullableCollectionsStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::NullableCollectionsStruct>*)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::NullableCollectionsStruct>(convert_from_jni(_jenv, _jinput, (::smoke::NullableCollectionsStruct*)nullptr))
        : ::gluecodium::optional<::smoke::NullableCollectionsStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/NullableCollectionsStruct", com_example_smoke_NullableCollectionsStruct, ::smoke::NullableCollectionsStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::NullableCollectionsStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::NullableCollectionsStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    auto jdates = convert_to_jni(_jenv, _ninput.dates);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "dates", "Ljava/util/List;", jdates);
    auto jstructs = convert_to_jni(_jenv, _ninput.structs);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "structs", "Ljava/util/Map;", jstructs);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::NullableCollectionsStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
