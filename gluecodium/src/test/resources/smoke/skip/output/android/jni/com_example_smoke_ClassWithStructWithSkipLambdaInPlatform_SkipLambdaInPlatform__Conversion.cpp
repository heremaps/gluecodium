/*
 *
 */
#include "com_example_smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform*)
{
    ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform _nout{};
    int32_t n_int_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "intField",
        (int32_t*)nullptr );
    _nout.int_field = n_int_field;
    return _nout;
}
std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>*)
{
    return _jinput
        ? std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>(convert_from_jni(_jenv, _jinput, (::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform*)nullptr))
        : std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/ClassWithStructWithSkipLambdaInPlatform$SkipLambdaInPlatform", com_example_smoke_ClassWithStructWithSkipLambdaInPlatform_00024SkipLambdaInPlatform, ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform& _ninput)
{
    auto& javaClass = CachedJavaClass<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "intField", _ninput.int_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}