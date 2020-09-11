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
    ::std::string n_other_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "otherField",
        (::std::string*)nullptr );
    _nout.other_field = n_other_field;
    return _nout;
}
::gluecodium::optional<::smoke::OuterStruct::InnerStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::smoke::OuterStruct::InnerStruct>*)
{
    return _jinput
        ? ::gluecodium::optional<::smoke::OuterStruct::InnerStruct>(convert_from_jni(_jenv, _jinput, (::smoke::OuterStruct::InnerStruct*)nullptr))
        : ::gluecodium::optional<::smoke::OuterStruct::InnerStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/OuterStruct$InnerStruct", com_example_smoke_OuterStruct_00024InnerStruct, ::smoke::OuterStruct::InnerStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::OuterStruct::InnerStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::OuterStruct::InnerStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "otherField", _ninput.other_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::smoke::OuterStruct::InnerStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
