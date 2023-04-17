/*
 *
 */
#include "com_example_smoke_BasicTypes_SomeStruct__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
#include "JniCallJavaMethod.h"
#include "JniClassCache.h"
namespace gluecodium
{
namespace jni
{
::root::space::smoke::BasicTypes::SomeStruct
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, ::root::space::smoke::BasicTypes::SomeStruct*)
{
    ::root::space::smoke::BasicTypes::SomeStruct _nout{};
    ::std::string n_some_field = ::gluecodium::jni::get_field_value(
        _jenv,
        _jinput,
        "someField",
        (::std::string*)nullptr );
    _nout.some_field = n_some_field;
    return _nout;
}
std::optional<::root::space::smoke::BasicTypes::SomeStruct>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, std::optional<::root::space::smoke::BasicTypes::SomeStruct>*)
{
    return _jinput
        ? std::optional<::root::space::smoke::BasicTypes::SomeStruct>(convert_from_jni(_jenv, _jinput, (::root::space::smoke::BasicTypes::SomeStruct*)nullptr))
        : std::optional<::root::space::smoke::BasicTypes::SomeStruct>{};
}
REGISTER_JNI_CLASS_CACHE("com/example/smoke/BasicTypes$SomeStruct", com_example_smoke_BasicTypes_00024SomeStruct, ::root::space::smoke::BasicTypes::SomeStruct)
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const ::root::space::smoke::BasicTypes::SomeStruct& _ninput)
{
    auto& javaClass = CachedJavaClass<::root::space::smoke::BasicTypes::SomeStruct>::java_class;
    auto _jresult = ::gluecodium::jni::alloc_object(_jenv, javaClass);
    ::gluecodium::jni::set_field_value(_jenv, _jresult, "someField", _ninput.some_field);
    return _jresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::optional<::root::space::smoke::BasicTypes::SomeStruct> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
