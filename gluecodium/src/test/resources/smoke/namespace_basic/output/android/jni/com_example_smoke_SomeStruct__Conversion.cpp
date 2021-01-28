/*
 *
 */
#include "com_example_smoke_SomeStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::root::space::smoke::SomeStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::root::space::smoke::SomeStruct*)
{
    ::root::space::smoke::SomeStruct _nout{};
    ::std::string n_some_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "someField",
        (::std::string*)nullptr );
    _nout.some_field = n_some_field;
    return _nout;
}
::gluecodium::optional<::root::space::smoke::SomeStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::gluecodium::optional<::root::space::smoke::SomeStruct>*)
{
    return _jinput
        ? ::gluecodium::optional<::root::space::smoke::SomeStruct>(convert_from_jni(_jenv, _jinput, (::root::space::smoke::SomeStruct*)nullptr))
        : ::gluecodium::optional<::root::space::smoke::SomeStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/SomeStruct", com_example_smoke_SomeStruct, ::root::space::smoke::SomeStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::root::space::smoke::SomeStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::root::space::smoke::SomeStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "someField", _ninput.some_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::gluecodium::optional<::root::space::smoke::SomeStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
