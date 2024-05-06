/*

 *
 */

#include "com_example_smoke_NullableCollectionsStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"

namespace gluecodium
{
namespace jni
{

::smoke::NullableCollectionsStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<::smoke::NullableCollectionsStruct>)
{
    ::smoke::NullableCollectionsStruct _nout{};
    ::std::vector< std::optional< ::std::chrono::system_clock::time_point > > n_dates = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "dates", "Ljava/util/List;"),
        TypeId<::std::vector< std::optional< ::std::chrono::system_clock::time_point > >>{} );
    _nout.dates = n_dates;
    ::std::unordered_map< int32_t, std::optional< ::smoke::Nullable::SomeStruct > > n_structs = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "structs", "Ljava/util/Map;"),
        TypeId<::std::unordered_map< int32_t, std::optional< ::smoke::Nullable::SomeStruct > >>{} );
    _nout.structs = n_structs;
    return _nout;
}

std::optional<::smoke::NullableCollectionsStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, TypeId<std::optional<::smoke::NullableCollectionsStruct>>)
{
    return _jinput
        ? std::optional<::smoke::NullableCollectionsStruct>(convert_from_jni(_jenv, _jinput, TypeId<::smoke::NullableCollectionsStruct>{}))
        : std::optional<::smoke::NullableCollectionsStruct>{};
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
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::NullableCollectionsStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}

}
}
