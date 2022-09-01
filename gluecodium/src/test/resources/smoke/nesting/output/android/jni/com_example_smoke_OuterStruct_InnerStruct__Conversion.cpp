/*
 *
 */
#include "com_example_smoke_OuterStruct_InnerStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::OuterStruct::InnerStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::OuterStruct::InnerStruct*)
{
    ::smoke::OuterStruct::InnerStruct _nout{};
    ::std::vector< ::std::chrono::system_clock::time_point > n_other_field = convert_from_jni(
        _jenv,
        ::gluecodium::jni::get_object_field_value(_jenv, _jinput, "otherField", "Ljava/util/List;"),
        (::std::vector< ::std::chrono::system_clock::time_point >*)nullptr );
    _nout.other_field = n_other_field;
    return _nout;
}
std::optional<::smoke::OuterStruct::InnerStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::OuterStruct::InnerStruct>*)
{
    return _jinput
        ? std::optional<::smoke::OuterStruct::InnerStruct>(convert_from_jni(_jenv, _jinput, (::smoke::OuterStruct::InnerStruct*)nullptr))
        : std::optional<::smoke::OuterStruct::InnerStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/OuterStruct$InnerStruct", com_example_smoke_OuterStruct_00024InnerStruct, ::smoke::OuterStruct::InnerStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::OuterStruct::InnerStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::OuterStruct::InnerStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    auto jother_field = convert_to_jni(_jenv, _ninput.other_field);
    ::gluecodium::jni::set_object_field_value(_jenv, _jresult, "otherField", "Ljava/util/List;", jother_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::OuterStruct::InnerStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
